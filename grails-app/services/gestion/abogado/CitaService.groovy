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


}
