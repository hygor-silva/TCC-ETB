package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class CapaDAO extends DataBaseDAO {
    public CapaDAO() throws Exception{
    }
    public void inserir(Capa capa) throws Exception {
       PreparedStatement pst;
       String sql = "INSERT INTO capa (tipo_capa) VALUES(?)";
       pst = conn.prepareStatement(sql);
       pst.setString(1, capa.getTipo_capa());
       pst.execute();
   }

   public ArrayList<Capa> listar() throws Exception {
       ArrayList<Capa> lista = new ArrayList<Capa>();
       PreparedStatement pst;
       ResultSet rs;
       String sql = "SELECT * FROM capa";
       pst = conn.prepareStatement(sql);
       rs = pst.executeQuery();
       while (rs.next()) {
           Capa e = new Capa();
           e.setId_capa(rs.getInt("id_capa"));
           e.setTipo_capa(rs.getString("tipo_capa"));
           lista.add(e);
       }

       return lista;
   }

       public void alterar(Capa capa) throws Exception {
       PreparedStatement pst;
       String sql = "UPDATE capa SET tipo_capa=? WHERE id_capa=?";
       pst = conn.prepareStatement(sql);
       pst.setString(1, capa.getTipo_capa());
       pst.setInt(2, capa.getId_capa());
       pst.execute();
   }

      public void excluir(Capa capa) throws Exception {
       Statement stm;
       stm = conn.createStatement();
       String sql = "DELETE FROM capa WHERE id_capa=" + capa.getId_capa();
       stm.execute(sql);
   }
       
     public Capa carregarPorId(int id_capa) throws Exception {
        Statement stm;
        ResultSet rs;
        Capa capa = new Capa();
        stm = conn.createStatement();
        String sql = "SELECT * FROM capa WHERE id_capa=" + id_capa;
        rs = stm.executeQuery(sql);
        if (rs.next()) {
            capa.setId_capa(rs.getInt("id_capa"));
            capa.setTipo_capa(rs.getString("tipo_capa"));
        }
        return capa;
    }
     
     public int verificarCapaEmUso(int id_capa) throws Exception {
        Statement stm;
        ResultSet rs;
        int capaEmUso = 0;
        stm = conn.createStatement();
        String sql = "SELECT * FROM produto WHERE id_capa=" + id_capa;
        rs = stm.executeQuery(sql);
        if (rs.next()) {
            capaEmUso = 1;
        }
        return capaEmUso;
    } 
}