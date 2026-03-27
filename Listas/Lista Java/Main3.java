import java.util.ArrayList;
import java.util.List;

class Ingrediente {
    String nome;

    public Ingrediente (String nome){
        this.nome = nome;
    }
}

class Balcao {
    private String nome;
    private int capacidade;
    List<Ingrediente> fila = new ArrayList<>();

    public Balcao (String nome, int capacidade){
        this.nome = nome;
        this.capacidade = capacidade;
    }
    
    public synchronized void colocar (Ingrediente ingrediente) throws InterruptedException{
        while (fila.size() == capacidade){
            System.out.println("O " + nome + " está cheio.");
            wait();
        }
        
        fila.add(ingrediente);
        System.out.println("Ingrediente adicionado. Ingredientes no balcão: " + fila.size() );

        notifyAll();
    }

    public synchronized void retirar() throws InterruptedException{
        while (fila.size() == 0){
            System.out.println("O " + nome + " está vazio.");
            wait();
        }
        
        fila.remove(0);
        System.out.println("Ingrediente retirado. Ingredientes no balcão: " + fila.size() );

        notifyAll();
    }
}

class Aprendiz implements Runnable{
    private Balcao balcao;
    private int desempenho;

    public Aprendiz (Balcao balcao, int desempenho) {
        this.balcao = balcao;
        this.desempenho = desempenho;
    }

    @Override
    public void run(){
        for (int i = 0 ; i < desempenho ; i++){
            Ingrediente ingrediente = new Ingrediente("Ingrediente " + (i+1));
            try {
                balcao.colocar(ingrediente);
            } catch (InterruptedException e){
                System.out.println("Erro: " + e.getMessage());
            }
        }
    }
}

class Chefe implements Runnable{
    private Balcao balcao;
    private int desempenho;

    public Chefe (Balcao balcao, int desempenho) {
        this.balcao = balcao;
        this.desempenho = desempenho;
    }

    @Override
    public void run(){
        for (int i = 0 ; i < desempenho; i ++){
            try {
                balcao.retirar();
            } catch (InterruptedException e){
                System.out.println("Erro: " + e.getMessage());
            }
        }
    }

}

public class Main3 {
    public static void main(String[] args) throws InterruptedException{

        // Balcão com pouco espaço
        Balcao balcao1 = new Balcao("Balcão 1", 2);
        Thread aprendiz1 = new Thread(new Aprendiz(balcao1, 4));
        Thread chefe1 = new Thread(new Chefe(balcao1, 2));

        System.out.println("\nCaso: Balcão com pouco espaço.\n");

        aprendiz1.start();
        chefe1.start();

        aprendiz1.join();
        chefe1.join();

        // Capacidade de produção dos aprendizes superior a dos chefes
        Balcao balcao2 = new Balcao("Balcão 2", 3);
        Thread aprendiz2 = new Thread(new Aprendiz(balcao2, 8));
        Thread chefe2 = new Thread(new Chefe(balcao2, 5));
        
        System.out.println("\nCaso: Produção > Consumo\n");

        aprendiz2.start();
        chefe2.start();

        aprendiz2.join();
        chefe2.join();

        // Capacidade de consumo dos chefes superior a dos aprendizes
        Balcao balcao3 = new Balcao("Balcão 3", 3);
        Thread aprendiz3= new Thread(new Aprendiz(balcao3, 8));
        Thread chefe3 = new Thread(new Chefe(balcao3, 4));
        Thread chefe4 = new Thread(new Chefe(balcao3, 4));
        
        System.out.println("\nCaso: Produção < Consumo\n");

        aprendiz3.start();
        chefe3.start();
        chefe4.start();

        aprendiz3.join();
        chefe3.join();
        chefe4.join();
    }
}
