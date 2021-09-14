package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class FuncionarioDAO extends DataBaseDAO {
    public FuncionarioDAO() throws Exception {
    }
    public void inserir(Funcionario funcionario) throws Exception {
        PreparedStatement pst;
        String sql = "INSERT INTO funcionario (id_perfil,nome,cpf,telefone_pessoal,telefone_recado,endereco,email,login,senha) VALUES(?,?,?,?,?,?,?,?,?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, funcionario.getId_perfil());
        pst.setString(2, funcionario.getNome());
        pst.setString(3, funcionario.getCpf());
        pst.setString(4, funcionario.getTelefonePessoal());
        pst.setString(5, funcionario.getTelefoneRecado());
        pst.setString(6, funcionario.getEndereco());
        pst.setString(7, funcionario.getEmail());
        pst.setString(8, funcionario.getLogin());
        pst.setString(9, funcionario.getSenha());
        pst.execute();
    }
    
    public ArrayList<Funcionario> listar(String texto_consulta,String tipo_consulta) throws Exception {
        ArrayList<Funcionario> lista = new ArrayList<Funcionario>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM funcionario";
        if(!tipo_consulta.isEmpty()){
            sql = "SELECT * FROM funcionario WHERE UPPER(" + tipo_consulta + ") LIKE UPPER('%" + texto_consulta + "%')";
        }
        pst = conn.prepareStatement(sql);
        rs = pst.executeQuery();
        while (rs.next()) {
            Funcionario f = new Funcionario();
            PerfilDAO pDB = new PerfilDAO();
            Perfil p = new Perfil();
            f.setId_funcionario(rs.getInt("id_funcionario"));
            f.setId_perfil(rs.getInt("id_perfil"));
            f.setNome(rs.getString("nome"));
            f.setCpf(rs.getString("cpf"));
            f.setTelefonePessoal(rs.getString("telefone_pessoal"));
            f.setTelefoneRecado(rs.getString("telefone_recado"));
            f.setEndereco(rs.getString("endereco"));
            f.setEmail(rs.getString("email"));
            f.setLogin(rs.getString("login"));
            f.setSenha(rs.getString("senha"));
            pDB.conectar();
            p = pDB.carregarPorId(f.getId_perfil());
            pDB.desconectar();
            f.setPerfil(p);
            lista.add(f);
        }

        return lista;
    }
    
    public void alterar(Funcionario funcionario) throws Exception {
        PreparedStatement pst;
        String sql = "UPDATE funcionario SET id_perfil=?, nome=?, cpf=?, telefone_pessoal=?, telefone_recado=?, endereco=?, email=?, login=?, senha=? WHERE id_funcionario=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, funcionario.getId_perfil());
        pst.setString(2, funcionario.getNome());
        pst.setString(3, funcionario.getCpf());
        pst.setString(4, funcionario.getTelefonePessoal());
        pst.setString(5, funcionario.getTelefoneRecado());
        pst.setString(6, funcionario.getEndereco());
        pst.setString(7, funcionario.getEmail());
        pst.setString(8, funcionario.getLogin());
        pst.setString(9, funcionario.getSenha());
        pst.setInt(10, funcionario.getId_funcionario());
        pst.execute();
    }
    
    public void excluir(Funcionario funcionario) throws Exception {
        Statement stm;
        stm = conn.createStatement();
        String sql = "DELETE FROM funcionario WHERE id_funcionario=" + funcionario.getId_funcionario();
        stm.execute(sql);
    }
       
     public Funcionario carregarPorId(int id_funcionario) throws Exception {
        Statement stm;
        ResultSet rs;
        Funcionario f = new Funcionario();
        stm = conn.createStatement();
        String sql = "SELECT * FROM funcionario WHERE id_funcionario=" + id_funcionario;
        rs = stm.executeQuery(sql);
        if (rs.next()) {
            f.setId_funcionario(rs.getInt("id_funcionario"));
            f.setId_perfil(rs.getInt("id_perfil"));
            f.setNome(rs.getString("nome"));
            f.setCpf(rs.getString("cpf"));
            f.setTelefonePessoal(rs.getString("telefone_pessoal"));
            f.setTelefoneRecado(rs.getString("telefone_recado"));
            f.setEndereco(rs.getString("endereco"));
            f.setEmail(rs.getString("email"));
            f.setLogin(rs.getString("login"));
            f.setSenha(rs.getString("senha"));
        }
        return f;
    }
    
    public Funcionario efetuarLogin(String login, String senha) throws Exception {
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM funcionario WHERE login=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1, login);

        rs = pst.executeQuery();
        Funcionario f = new Funcionario();
        if (rs.next()) {
            if (senha.equals(rs.getString("senha"))) {
                
                f.setId_funcionario(rs.getInt("id_funcionario"));
                f.setId_perfil(rs.getInt("id_perfil"));
                f.setNome(rs.getString("nome"));
                f.setCpf(rs.getString("cpf"));
                f.setTelefonePessoal(rs.getString("telefone_pessoal"));
                f.setTelefoneRecado(rs.getString("telefone_recado"));
                f.setEmail(rs.getString("email"));
                f.setEndereco(rs.getString("endereco"));
                f.setLogin(rs.getString("login"));
                f.setSenha(rs.getString("senha"));
                
                PerfilDAO perfilDB = new PerfilDAO();
                perfilDB.conectar();
                Perfil p = perfilDB.carregarPorId(f.getId_perfil());
                perfilDB.desconectar();
                
                f.setPerfil(p);
            }
        }
        return f;
    }
}
