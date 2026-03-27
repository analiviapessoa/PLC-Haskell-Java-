public class Produto {
    private String descricao;
    private double valor;
    private int estoque;

    public Produto(String descricao, double valor, int estoqueInicial){
        this.descricao = descricao;
        this.valor = valor;
        this.estoque = estoqueInicial;
    }

    public String getDescricao(){
        return this.descricao;
    }

    public double getValor(){
        return this.valor;
    }
    
    public int getEstoque(){
        return this.estoque;
    }
}
