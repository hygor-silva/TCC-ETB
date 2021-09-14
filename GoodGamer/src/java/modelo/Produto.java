package modelo;
public class Produto {
    private int id_produto;
    private int quantidade_estoque;
    
    private String descricao_produto;
    private double preco;
    private Capa capa;
    private Midia midia;
    private int id_capa;
    private int id_midia;

    public int getId_produto() {
        return id_produto;
    }

    public void setId_produto(int id_produto) {
        this.id_produto = id_produto;
    }

    public int getQuantidade_estoque() {
        return quantidade_estoque;
    }

    public void setQuantidade_estoque(int quantidade_estoque) {
        this.quantidade_estoque = quantidade_estoque;
    }


    public String getDescricao_produto() {
        return descricao_produto;
    }

    public void setDescricao_produto(String descricao_produto) {
        this.descricao_produto = descricao_produto;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public Capa getCapa() {
        return capa;
    }

    public void setCapa(Capa capa) {
        this.capa = capa;
    }

    public Midia getMidia() {
        return midia;
    }

    public void setMidia(Midia midia) {
        this.midia = midia;
    }

    public int getId_capa() {
        return id_capa;
    }

    public void setId_capa(int id_capa) {
        this.id_capa = id_capa;
    }

    public int getId_midia() {
        return id_midia;
    }

    public void setId_midia(int id_midia) {
        this.id_midia = id_midia;
    }
}