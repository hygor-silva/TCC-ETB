package modelo;
public class Capa {
    private int id_capa;
    private String tipo_capa;

    public int getId_capa() {
        return id_capa;
    }

    public void setId_capa(int id_capa) {
        this.id_capa = id_capa;
    }

    public String getTipo_capa() {
        return tipo_capa;
    }

    public void setTipo_capa(String tipo_capa) {
        this.tipo_capa = tipo_capa;
    }
    
    @Override
    public String toString(){
        return getTipo_capa();
    }
}