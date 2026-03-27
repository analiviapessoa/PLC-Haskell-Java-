enum TipoEnergia{
    MANA,
    ESTAMINA
}

class Personagem {
    double vidaAtual;
    double vidaMaxima;
    double energiaAtual;
    double energiaMaxima;
    TipoEnergia tipo;

    public Personagem(double vidaAtual, double vidaMaxima, double energiaAtual, double energiaMaxima, TipoEnergia tipo){
        this.vidaAtual = vidaAtual;
        this.vidaMaxima = vidaMaxima;
        this.energiaAtual = energiaAtual;
        this.energiaMaxima = energiaMaxima;
        this.tipo = tipo;
    }

    public double getvidaAtual(){
        return vidaAtual;
    }

    public void setvidaAtual(double valor){
        this.vidaAtual = valor;
    }

    public double getenergiaAtual(){
        return energiaAtual;
    }

    public void setenergiaAtual(double valor){
        this.energiaAtual = valor;
    }

    public double getvidaMaxima(){
        return vidaMaxima;
    }

    public double getenergiaMaxima(){
        return energiaMaxima;
    }
}

interface Restauracao {
    public void restaurar(Personagem personagem, double quantidadeRecuperada) throws EnergiaIncompativelException;
    public void calcularDuracao(double quantidadeRecuperada);
}

class Fogueira implements Restauracao {
    private double eficiencia;

    public Fogueira(double eficiencia){
        this.eficiencia = eficiencia;
    }

    public void restaurar(Personagem personagem, double quantidadeRecuperada) {
        double novaVida = personagem.getvidaAtual() + quantidadeRecuperada;
        if (novaVida < personagem.getvidaMaxima()){
            personagem.setvidaAtual(novaVida);
        }else {
            personagem.setvidaAtual(personagem.getvidaMaxima());
        }
        System.out.println("Vida atual: " + personagem.getvidaAtual());
    }

    public void calcularDuracao(double quantidadeRecuperada){
        double duracao = quantidadeRecuperada/eficiencia;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
        System.out.println("Duração de descanso: " + duracao);
    }
}

class FonteMagica implements Restauracao {
    private double eficiencia;

    public FonteMagica(double eficiencia){
        this.eficiencia = eficiencia;
    }

    public synchronized void restaurar(Personagem personagem, double quantidadeRecuperada) throws EnergiaIncompativelException {
        if (personagem.tipo != TipoEnergia.MANA){
            throw new EnergiaIncompativelException("Erro: Personagem não utiliza mana.");
        }

        double novaEnergia = personagem.getenergiaAtual() + quantidadeRecuperada;
        if (novaEnergia <= personagem.getenergiaMaxima()){
            personagem.setenergiaAtual(novaEnergia);
        }else {
            personagem.setenergiaAtual(personagem.getenergiaMaxima());
        }
        System.out.println("Energia atual: " + personagem.getenergiaAtual());
    }

    public synchronized void calcularDuracao(double quantidadeRecuperada){
        double duracao = quantidadeRecuperada/eficiencia;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
        System.out.println("Duração de descanso: " + duracao);
    }
}

class Acampamento implements Restauracao {
    private double eficiencia;

    public Acampamento(double eficiencia){
        this.eficiencia = eficiencia;
    }
    
    public void restaurar(Personagem personagem, double quantidadeRecuperada) throws EnergiaIncompativelException{
        if (personagem.tipo != TipoEnergia.ESTAMINA){
            throw new EnergiaIncompativelException("Erro: Personagem não utiliza estamina.");
        }

        double novaEnergia = personagem.getenergiaAtual() + quantidadeRecuperada;
        if (novaEnergia <= personagem.getenergiaMaxima()){
            personagem.setenergiaAtual(novaEnergia);
        }else {
            personagem.setenergiaAtual(personagem.getenergiaMaxima());
        }
        System.out.println("Energia atual: " + personagem.getenergiaAtual());
    }

    public void calcularDuracao(double quantidadeRecuperada){
        double duracao = quantidadeRecuperada/eficiencia;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
        System.out.println("Duração de descanso: " + duracao);
    }
}

class EnergiaIncompativelException extends Exception {
    public EnergiaIncompativelException (String message){
        super(message);
    }
}

public class Main4 {
    public static void main (String[] args){
        Personagem personagem = new Personagem(50, 100, 20, 100, TipoEnergia.MANA);
        Fogueira fogueira = new Fogueira(10);
        FonteMagica fonte = new FonteMagica(5);
        Acampamento acampamento = new Acampamento(8);
        
        // Restauração de vida na Fogueira
        System.out.println("Restauração de vida");
        fogueira.restaurar(personagem, 30);
        fogueira.calcularDuracao(30);
        
        // Restauração de energia bem sucedido
        System.out.println("\nRestauração de energia bem sucedido");
        try{
            fonte.restaurar(personagem, 30);
            fonte.calcularDuracao(30);
        } catch (EnergiaIncompativelException e){
            System.out.println("Erro: " + e.getMessage());
        }

        // Restauração de energia incompatível
        System.out.println("\nRestauração de energia incompatível");
        try{
            acampamento.restaurar(personagem, 30);
            acampamento.calcularDuracao(30);
        } catch (EnergiaIncompativelException e){
            System.out.println("Erro: " + e.getMessage());
        }
    }    
}