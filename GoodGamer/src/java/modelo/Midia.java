package modelo;
public class Midia {
    private int id_midia;
    private String tipo_midia;

    public int getId_midia() {
        return id_midia;
    }

    public void setId_midia(int id_midia) {
        this.id_midia = id_midia;
    }

    public String getTipo_midia() {
        return tipo_midia;
    }

    public void setTipo_midia(String tipo_midia) {
        this.tipo_midia = tipo_midia;
    }
    
    @Override
    public String toString(){
        return getTipo_midia();
    }
}