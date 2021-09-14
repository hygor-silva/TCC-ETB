package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.text.SimpleDateFormat;

public class VendaDAO extends DataBaseDAO {
    public VendaDAO() throws Exception {
    }
    
    public ArrayList<Venda> verificarVendaAberta() throws Exception {
        ArrayList<Venda> verificarVendaAberta = new ArrayList<Venda>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM venda WHERE aberta = 0";                
        pst = conn.prepareStatement(sql);
        rs = pst.executeQuery();
        if (rs.next()) {
            Venda v = new Venda();
            v.setId_venda(rs.getInt("id_venda"));
            verificarVendaAberta.add(v);
        } else {
            Venda v = new Venda();
            v.setId_venda(0);
            verificarVendaAberta.add(v);
        }

        return verificarVendaAberta;
    }
    
    public void inserir(Venda venda) throws Exception {
        Statement stm;
        stm = conn.createStatement();
        String sql = "INSERT INTO venda (cpf_cliente, aberta) VALUES(" + venda.getCpf_cliente() + ", 0)";
        if (venda.getCpf_cliente() == "00000000000"){
            sql = "INSERT INTO venda (aberta) VALUES(0)";
        }
        stm.execute(sql); 
    }
    
    public void cancelarVenda(int id_venda) throws Exception {
        try {
            Statement stm;
            stm = conn.createStatement();
            String sql1 = "DELETE FROM produto_venda WHERE id_venda=" + id_venda;
            String sql2 = "DELETE FROM venda WHERE id_venda=" + id_venda;
            stm.execute(sql1);
            stm.execute(sql2);
        } catch(Exception e) {}
    }
    
    public void finalizarVenda(Venda venda) throws Exception {
        Statement stm;
        stm = conn.createStatement();
        String sql = "UPDATE venda SET valor = " + venda.getValor() + ",aberta = 1 WHERE id_venda=" + venda.getId_venda();
        stm.execute(sql);
    }
    
    public Venda carregarPorId(int id_venda) throws Exception {
        Statement stm;
        ResultSet rs;
        Venda v = new Venda();
        stm = conn.createStatement();
        String sql = "SELECT * FROM venda WHERE id_venda=" + id_venda;
        rs = stm.executeQuery(sql);
        if (rs.next()) {
            v.setId_venda(rs.getInt("id_venda"));
            if (rs.getString("cpf_cliente") != "" || rs.getString("cpf_cliente") != null){
                v.setCpf_cliente(rs.getString("cpf_cliente"));
            } else {
                v.setCpf_cliente("");
            }
            if (rs.getDouble("valor") > 0){
                v.setValor(rs.getDouble("valor"));
            } else {
                v.setValor(0);
            }
        }
        return v;
    }
    
    public Venda buscarIdVenda() throws Exception {
        Statement stm;
        ResultSet rs;
        stm = conn.createStatement();
        String sql = "SELECT id_venda FROM venda WHERE aberta = 0";
        rs = stm.executeQuery(sql);
        Venda v = new Venda();
        if (rs.next()) {
            v.setId_venda(rs.getInt("id_venda"));
        } else {
            v.setId_venda(0);
        }
        return v;
    }
}