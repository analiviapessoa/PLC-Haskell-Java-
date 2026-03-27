public class Conta {
    private String numero;
    private double saldo;

    public Conta (String numero){
        this.numero = numero;
        saldo = 0;
    }

    public String getNumero(){
        return this.numero;
    }

    public double getSaldo(){
        return this.saldo;
    }

    public void creditar (double valor){
        if (valor > 0){
            this.saldo = this.saldo + valor;
        }
    }

    public void debitar (double valor){
        if (valor > 0 && valor <= this.saldo){
            this.saldo = this.saldo - valor;
        }
    }

}

class Poupanca extends Conta {
    
    public Poupanca (String numero){
        super(numero);
    }

    public void renderJuros(double taxa){
        double juros = this.getSaldo() * taxa;
        this.creditar(juros);
    }
}