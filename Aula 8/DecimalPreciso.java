public class DecimalPreciso {
    
}

class Horario {
    public int hora;     
    public int minuto;
    public int segundo;
    
    Horario() {}

    //precisa do this se não o programa vai achar que todo mundo é variável
    Horario(int hora, int minuto){
        this(hora,minuto,0);
    }

    Horario(int hora, int minuto, int segundo){
        this.hora = hora;
        this.minuto = minuto;
        this.segundo = segundo;
    }

    public String toString() {
        return hora + "h" + minuto + "m" +segundo + "s";
    }
}