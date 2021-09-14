package modelo;
import java.util.Date;
public class Venda {
    private int id_venda;
    private Date data;
    private double valor;
    private String cpf_cliente;
    private int aberta;

    public int getId_venda() {
        return id_venda;
    }

    public void setId_venda(int id_venda) {
        this.id_venda = id_venda;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public String getCpf_cliente() {
        return cpf_cliente;
    }

    public void setCpf_cliente(String cpf_cliente) {
        this.cpf_cliente = cpf_cliente;
    }

    public int isAberta() {
        return aberta;
    }

    public void setAberta(int aberta) {
        this.aberta = aberta;
    }
}