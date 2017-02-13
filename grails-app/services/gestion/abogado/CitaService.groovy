package gestion.abogado

import grails.transaction.Transactional

import java.text.SimpleDateFormat

@Transactional
class CitaService {

    String addMinutos(String hora,Integer minutos) {
        SimpleDateFormat df = new SimpleDateFormat("HH:mm");
        Date d = df.parse(hora);
        Calendar cal = Calendar.getInstance();
        cal.setTime(d);
        cal.add(Calendar.MINUTE, minutos);
        String newTime = df.format(cal.getTime());
        return newTime
    }

    String addHoras(String hora, Integer horas){
        return this.addMinutos(hora,horas*60)
    }

    Integer getMinutos(String hora){
        return hora.substring(3,5) as Integer
    }

    Integer getHoras(String hora){
        return hora.substring(0,2) as Integer
    }

    String intervaloLibre(String horaInicio, String horaFinal, Date dia){
        //println horaInicio + "-->" +horaFinal
        String horaFin = ''

        def listaCitas = Cita.findAllByFecha(dia)
            listaCitas.each{ cita ->
                //println horaInicio + "-->" +horaFinal + "(" +cita.comienzo + "-->"+cita.fin +")"
                this.compararHoras(horaFinal,cita.comienzo)
                if((this.compararHoras(horaInicio,cita.comienzo) == 1) && (this.compararHoras(horaFinal,cita.comienzo)==-1)){
                    horaFin = cita.comienzo
                }
        }



        return horaFin
    }

    Integer compararHoras(String inicio, String fin){
        Integer horaInicio = this.getHoras(inicio)
        Integer horaFin = this.getHoras(fin)
        Integer minutosInicio = this.getMinutos(inicio)
        Integer minutosFin = this.getMinutos(fin)

        //Comparamos las horas
        if(horaInicio > horaFin){
            return -1
        }else if(horaFin > horaInicio){
            return 1
        } else if(horaFin == horaInicio){
            if(minutosInicio > minutosFin){
                return -1
            }else if(minutosFin > minutosInicio){
                return 1
            }
            else{
                return 0
            }

        }
    }


}
