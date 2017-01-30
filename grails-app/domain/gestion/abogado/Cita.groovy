package gestion.abogado

import org.grails.databinding.BindingFormat

class Cita {

    String titulo
    TipoCita tipoCita
    Cliente cliente
    Caso caso
    String notas
    @BindingFormat('dd-MM-yyyy')
    Date fecha

    Integer horaComienzo
    Integer minutosComienzo

    Integer horaFin
    Integer minutosFin

    Boolean realizada

    static transients = ['comienzo', 'fin']

    private String formatTime(Integer hours, Integer mins) {
        String formattedHours = hours < 10 ? "0$hours" : hours.toString()
        String formattedMins = mins < 10 ? "0$mins" : mins.toString()
        "$formattedHours:$formattedMins"
    }

    String getComienzo() {
        formatTime(horaComienzo, minutosComienzo)
    }

    String getFin() {
        formatTime(horaFin, minutosFin)
    }

    static constraints = {
        horaComienzo range: 0..23
        horaFin range: 0..23

        minutosComienzo range: 0..59
        minutosFin range: 0..59

        notas nullable: true
        caso nullable: true
        realizada nullable: true

        // TODO: add a custom validator that checks the end time is after start time
    }
}
