public class Expressoes {
    public static void main (String args[]) {
        System.out.println(new Soma(new Valor(42), new Mult(new Valor(10), new Valor(3))));
        System.out.println(new Soma(new Valor(42), new Mult(new Valor(10), new Valor(3))).avaliar());
    }
}

class Expressao {
    public String toString() {
        return "Expressao";
    }
    public int avaliar() {
        return 0;
    }
}

// Valor herda de Expressão
class Valor extends Expressao {
    protected int valor = 0;
    Valor(int valor) {
        this.valor = valor;
    }

    public String toString() {
        return "" + this.valor;
    }

    public int avaliar() {
        return this.valor;
    }
}

class ExpressaoBinaria extends Expressao {
    protected Expressao primeiro = new Valor(0);
    protected Expressao segundo = new Valor(0);

    ExpressaoBinaria(Expressao primeiro, Expressao segundo){
        this.primeiro = primeiro;
        this.segundo = segundo;
    }
}

class Soma extends ExpressaoBinaria {
    Soma(Expressao primeiro, Expressao segundo) {
        super(primeiro, segundo);
    }

    public int avaliar(){
        return this.primeiro.avaliar() + this.segundo.avaliar();
    }

    public String toString(){
        return "(" + this.primeiro.toString() + " + " + this.segundo.toString()
    }
}

class Mult extends ExpressaoBinaria {
    Mult(Expressao primeiro, Expressao segundo) {
        super(primeiro, segundo);
    }

    public int avaliar(){
        return this.primeiro.avaliar() * this.segundo.avaliar();
    }

    public String toString(){
        return "(" + this.primeiro.toString() + " * " + this.segundo.toString()
    }
}