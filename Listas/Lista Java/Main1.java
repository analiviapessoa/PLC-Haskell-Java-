interface Transporte {
    public double calcularValor();
    public String tempoDeViagem();
}

class Viagem implements Transporte {
    protected String destino;
    protected double distanciaEmKm;
    protected double precoBase;

    public Viagem(String destino, double distanciaEmKm, double precoBase){
        this.destino = destino;
        this.distanciaEmKm = distanciaEmKm;
        this.precoBase = precoBase;
    }

    public double calcularValor() {
        return precoBase;
    }

    public String tempoDeViagem() {
        return "Tempo desconhecido";
    }

}

class Onibus extends Viagem {
    public Onibus(String destino, double distanciaEmKm, double precoBase) {
        super(destino, distanciaEmKm, precoBase);
    }

    @Override
    public double calcularValor() {
        return (0.3 * distanciaEmKm) + precoBase;
    }
    
    @Override
    public String tempoDeViagem() {
        return "" + Math.round(distanciaEmKm / 80) + " horas";
    }
}

class Aviao extends Viagem {
    public Aviao(String destino, double distanciaEmKm, double precoBase) {
        super(destino, distanciaEmKm, precoBase);
    }
    
    @Override
    public double calcularValor() {
        return (1 * distanciaEmKm) + precoBase;
    }
    
    @Override
    public String tempoDeViagem() {
        return "" + (Math.round((distanciaEmKm / 800) * 10.0)/ 10.0) + " horas";
    }
}

class Carro extends Viagem {
    public Carro(String destino, double distanciaEmKm, double precoBase) {
        super(destino, distanciaEmKm, precoBase);
    }
    
    @Override
    public double calcularValor() {
        return (0.5 * distanciaEmKm) + precoBase;
    }

    @Override
    public String tempoDeViagem() {
        return "" + Math.round(distanciaEmKm / 100) + " horas";
    }
}

public class Main1 {
    public static void main(String[] args){
        Transporte viagem1 = new Onibus("Salvador", 900, 100);
        Transporte viagem2 = new Aviao("Salvador", 900, 100);
        Transporte viagem3 = new Carro("Salvador", 900, 100);
    
        System.out.println("Transporte: Ônibus");
        System.out.println("Destino: Salvador");
        System.out.println("Preço da viagem: R$" + viagem1.calcularValor());
        System.out.println("Tempo estimado: " + viagem1.tempoDeViagem());
        System.out.println("");
    
        System.out.println("Transporte: Avião");
        System.out.println("Destino: Salvador");
        System.out.println("Preço da viagem: R$" + viagem2.calcularValor());
        System.out.println("Tempo estimado: " + viagem2.tempoDeViagem());
        System.out.println("");
    
        System.out.println("Transporte: Carro");
        System.out.println("Destino: Salvador");
        System.out.println("Preço da viagem: R$" + viagem3.calcularValor());
        System.out.println("Tempo estimado: " + viagem3.tempoDeViagem());
    }
}