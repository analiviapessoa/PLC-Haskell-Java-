class JogadorATP {
    private double pontos;
    private String nome;
    
    public JogadorATP(String nome){
        this.nome = nome;
        this.pontos = 0;
    }

    public synchronized void adicionarPontos(double valor){
        this.pontos = pontos + valor;
        System.out.println("Jogador " + nome + " agora tem " + pontos + " pontos.");
    }
    
    public synchronized void removerPontos(double valor) throws PontosInsuficientesException {
        if (this.pontos < valor) {
            throw new PontosInsuficientesException(
                "Jogador " + nome + " não tem pontos suficientes para remover " + valor + " pontos."
            );
        }
        this.pontos = pontos - valor;
        System.out.println("Jogador " + nome + " agora tem " + pontos + " pontos.");
    }
    
    public double getPontos() {
        return this.pontos;
    }

    public String getNome() {
        return this.nome;
    }
}

class AtualizacaoRanking implements Runnable {
    private JogadorATP jogador;
    private boolean ehGanho;
    private double valor;
    
    public AtualizacaoRanking(JogadorATP jogador, boolean ehGanho, double valor){
        this.jogador = jogador;
        this.ehGanho = ehGanho;
        this.valor = valor;
    }

    @Override
    public void run(){
        try {
            if(ehGanho){
                jogador.adicionarPontos(valor);
            } else {
                jogador.removerPontos(valor);
            } 
        } catch (PontosInsuficientesException e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }
}

class PontosInsuficientesException extends Exception {
    public PontosInsuficientesException(String message) {
        super(message);
    }
}

public class Main2 {
    public static void main(String[] args) throws InterruptedException {
        JogadorATP jogador = new JogadorATP("Marcos");
        jogador.adicionarPontos(100);
        
        // Ganhos concorrentes
        Thread atualizacao1 = new Thread(new AtualizacaoRanking(jogador, true, 30));
        Thread atualizacao2 = new Thread(new AtualizacaoRanking(jogador, true, 20));
        Thread atualizacao3 = new Thread(new AtualizacaoRanking(jogador, true,50));

        atualizacao1.start();
        atualizacao2.start();
        atualizacao3.start();

        atualizacao1.join();
        atualizacao2.join();
        atualizacao3.join();

        System.out.println("Pontos após ganhos concorrentes do jogador" + jogador.getNome() + ": " + jogador.getPontos());

        // Perdas concorrentes
        Thread atualizacao4 = new Thread(new AtualizacaoRanking(jogador, false, 40));
        Thread atualizacao5 = new Thread(new AtualizacaoRanking(jogador, false, 30));
        Thread atualizacao6 = new Thread(new AtualizacaoRanking(jogador, false,10));
        
        atualizacao4.start();
        atualizacao5.start();
        atualizacao6.start();
        
        atualizacao4.join();
        atualizacao5.join();
        atualizacao6.join();

        System.out.println("Pontos após perdas concorrentes do jogador " + jogador.getNome() + ": " + jogador.getPontos());
        
        // Exceção
        Thread atualizacao7 = new Thread(new AtualizacaoRanking(jogador, false, 500));
       
        atualizacao7.start();

        atualizacao7.join();
        
        System.out.println("Pontos após tentativa de perda excessiva do jogador " + jogador.getNome() + ": " + jogador.getPontos());

        //Ganhos e perdas simultâneos
        Thread[] threads = new Thread[10];

        threads[0] = new Thread(new AtualizacaoRanking(jogador, true, 10));
        threads[1] = new Thread(new AtualizacaoRanking(jogador, true, 15));
        threads[2] = new Thread(new AtualizacaoRanking(jogador, true, 20));
        threads[3] = new Thread(new AtualizacaoRanking(jogador, true, 25));
        threads[4] = new Thread(new AtualizacaoRanking(jogador, true, 30));

        threads[5] = new Thread(new AtualizacaoRanking(jogador, false, 5));
        threads[6] = new Thread(new AtualizacaoRanking(jogador, false, 10));
        threads[7] = new Thread(new AtualizacaoRanking(jogador, false, 15));
        threads[8] = new Thread(new AtualizacaoRanking(jogador, false, 20));
        threads[9] = new Thread(new AtualizacaoRanking(jogador, false, 25));
        
        for (Thread t : threads) {
            t.start();
        }

        for (Thread t : threads) {
            t.join();
        }

        System.out.println("Pontos finais do jogador " + jogador.getNome() + ": " + jogador.getPontos());
    
    }    
}