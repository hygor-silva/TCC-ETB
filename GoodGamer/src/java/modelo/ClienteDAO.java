package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ClienteDAO extends DataBaseDAO {
    public ClienteDAO() throws Exception {
    }
    //cadastrar;
    public void inserir(Cliente cliente) throws Exception {
        PreparedStatement pst;
        String sql = "INSERT INTO cliente (nome,cpf_cliente,telefone_pessoal, telefone_recado, email) VALUES(?,?,?,?,?)";
        pst = conn.prepareStatement(sql);
        pst.setString(1, cliente.getNome());
        pst.setString(2, cliente.getCpf());
        pst.setString(3, cliente.getTelefonePessoal());
        pst.setString(4, cliente.getTelefoneRecado());
        pst.setString(5, cliente.getEmail());
        pst.execute();
    }
     
    public ArrayList<Cliente> listar(String texto_consulta,String tipo_consulta) throws Exception {
        ArrayList<Cliente> lista = new ArrayList<Cliente>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM cliente";
        if(!tipo_consulta.isEmpty()){
            sql = "SELECT * FROM cliente WHERE UPPER(" + tipo_consulta + ") LIKE UPPER('%" + texto_consulta + "%')";
        }
        pst = conn.prepareStatement(sql);
        rs = pst.executeQuery();
        while (rs.next()) {
            Cliente c = new Cliente();
            c.setNome(rs.getString("nome"));
            c.setCpf(rs.getString("cpf_cliente"));
            c.setTelefonePessoal(rs.getString("telefone_pessoal"));
            c.setTelefoneRecado(rs.getString("telefone_recado"));
            c.setEmail(rs.getString("email"));
            lista.add(c);
        }

        return lista;
     }
    
    public void alterar(Cliente cliente, String cpf_antigo) throws Exception {
        PreparedStatement pst;
        String sql = "UPDATE cliente SET nome=?, telefone_pessoal=?, telefone_recado=?, email=?, cpf_cliente=? WHERE cpf_cliente=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, cliente.getNome());
        pst.setString(2, cliente.getTelefonePessoal());
        pst.setString(3, cliente.getTelefoneRecado());
        pst.setString(4, cliente.getEmail());
        pst.setString(5, cliente.getCpf());
        pst.setString(6, cpf_antigo);
        pst.execute();
    }
    
    public void excluir(Cliente cliente) throws Exception {
        Statement stm;
        stm = conn.createStatement();
        String sql = "UPDATE venda SET cpf_cliente = null WHERE cpf_cliente='" + cliente.getCpf() + "'";
        stm.execute(sql);
        
        Statement stm2;
        stm2 = conn.createStatement();
        String sql2 = "DELETE FROM cliente WHERE cpf_cliente='" + cliente.getCpf() + "'";
        stm2.execute(sql2);
    }
       
     public Cliente carregarPorId(String cpf) throws Exception {
        Statement stm;
        ResultSet rs;
        Cliente cliente = new Cliente();
        stm = conn.createStatement();
        String sql = "SELECT * FROM cliente WHERE cpf_cliente='" + cpf + "'";
        rs = stm.executeQuery(sql);
        if (rs.next()) {
            cliente.setNome(rs.getString("nome"));
            cliente.setCpf(rs.getString("cpf_cliente"));
            cliente.setTelefonePessoal(rs.getString("telefone_pessoal"));
            cliente.setTelefoneRecado(rs.getString("telefone_recado"));
            cliente.setEmail(rs.getString("email"));
        }
        return cliente;
    }
    
    public Cliente verificarCliente(String cpf_cliente) throws Exception {
        Statement stm;
        ResultSet rs;
        stm = conn.createStatement();
        String sql = "SELECT * FROM cliente WHERE cpf_cliente='" + cpf_cliente + "'";
        rs = stm.executeQuery(sql);
        Cliente c = new Cliente();
        if (rs.next()) {
            c.setCpf(rs.getString("cpf_cliente"));
            c.setNome(rs.getString("nome"));
            c.setTelefonePessoal(rs.getString("telefone_pessoal"));;
            c.setTelefoneRecado(rs.getString("telefone_recado"));
            c.setEmail(rs.getString("email"));
        } else {
            c.setCpf("0000000000");
        }
        return c;
    }
}