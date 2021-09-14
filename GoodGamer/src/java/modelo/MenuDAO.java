package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class MenuDAO extends DataBaseDAO {
    public MenuDAO() throws Exception{
    }
    public ArrayList<Menu> listar() throws Exception {
       ArrayList<Menu> lista = new ArrayList<Menu>();
       PreparedStatement pst;
       ResultSet rs;
       String sql = "SELECT * FROM menu";
       pst = conn.prepareStatement(sql);
       rs = pst.executeQuery();
       while (rs.next()) {
           Menu m = new Menu();
           m.setId_menu(rs.getInt("id_menu"));
           m.setMenu(rs.getString("menu"));
           m.setLink(rs.getString("link"));
           m.setIcone(rs.getString("icone"));
           lista.add(m);
       }
       return lista;
   }
}