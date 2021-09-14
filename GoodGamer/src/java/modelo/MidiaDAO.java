package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class MidiaDAO extends DataBaseDAO {
    public MidiaDAO() throws Exception{
    }
    public void inserir(Midia midia) throws Exception {
       PreparedStatement pst;
       String sql = "INSERT INTO midia (tipo_midia) VALUES(?)";
       pst = conn.prepareStatement(sql);
       pst.setString(1, midia.getTipo_midia());
       pst.execute();
   }

   public ArrayList<Midia> listar() throws Exception {
       ArrayList<Midia> lista = new ArrayList<Midia>();
       PreparedStatement pst;
       ResultSet rs;
       String sql = "SELECT * FROM midia";
       pst = conn.prepareStatement(sql);
       rs = pst.executeQuery();
       while (rs.next()) {
           Midia t = new Midia();
           t.setId_midia(rs.getInt("id_midia"));
           t.setTipo_midia(rs.getString("tipo_midia"));
           lista.add(t);
       }

       return lista;
   }

       public void alterar(Midia midia) throws Exception {
       PreparedStatement pst;
       String sql = "UPDATE midia SET tipo_midia=? WHERE id_midia=?";
       pst = conn.prepareStatement(sql);
       pst.setString(1, midia.getTipo_midia());
       pst.setInt(2, midia.getId_midia());
       pst.execute();
   }

      public void excluir(Midia midia) throws Exception {
       Statement stm;
       stm = conn.createStatement();
       String sql = "DELETE FROM midia WHERE id_midia=" + midia.getId_midia();
       stm.execute(sql);
   }
       
     public Midia carregarPorId(int id_midia) throws Exception {
        Statement stm;
        ResultSet rs;
        Midia midia = new Midia();
        stm = conn.createStatement();
        String sql = "SELECT * FROM midia WHERE id_midia=" + id_midia;
        rs = stm.executeQuery(sql);
        if (rs.next()) {
           midia.setId_midia(rs.getInt("id_midia"));
            midia.setTipo_midia(rs.getString("tipo_midia"));
        }
        return midia;
    }
     
     public int verificarMidiaEmUso(int id_midia) throws Exception {
        Statement stm;
        ResultSet rs;
        int midiaEmUso = 0;
        stm = conn.createStatement();
        String sql = "SELECT * FROM produto WHERE id_midia=" + id_midia;
        rs = stm.executeQuery(sql);
        if (rs.next()) {
            midiaEmUso = 1;
        }
        return midiaEmUso;
    } 
}