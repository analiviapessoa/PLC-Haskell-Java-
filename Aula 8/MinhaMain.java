public class MinhaMain {
    public static void main(String args[]) {
        Horario h1 = new Horario();
        h1.hora = 14;
        h1.minuto = 20;
        h1.segundo = 42;
        System.out.println(h1);
        Horario h2 = new Horario();
        h2.hora = 15;
        h2.minuto = 13;
        h2.segundo = 0; 
        System.out.println(h2);
    }
}
