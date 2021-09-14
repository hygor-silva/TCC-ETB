package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ProdutoDAO extends DataBaseDAO {
    public ProdutoDAO() throws Exception {
    }
    public void inserir(Produto produto) throws Exception {
        PreparedStatement pst;
        String sql = "INSERT INTO produto (id_capa,id_midia,descricao_produto,preco,quantidade_estoque) VALUES(?,?,?,?,?)";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, produto.getId_capa());
        pst.setInt(2, produto.getId_midia());
       
        pst.setString(3, produto.getDescricao_produto());
        pst.setDouble(4, produto.getPreco());
        pst.setInt(5, produto.getQuantidade_estoque());
        pst.execute();
    }
    
    public ArrayList<Produto> listar(String texto_consulta) throws Exception {
        ArrayList<Produto> lista = new ArrayList<Produto>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM produto";
        if(!texto_consulta.isEmpty()){
            sql = "SELECT * FROM produto WHERE descricao_produto LIKE UPPER('%" + texto_consulta + "%')";
        }                    
        pst = conn.prepareStatement(sql);
        rs = pst.executeQuery();
        while (rs.next()) {
            Produto p = new Produto();
            CapaDAO eDB = new CapaDAO();
            MidiaDAO tDB = new MidiaDAO();
            p.setId_produto(rs.getInt("id_produto"));
            p.setDescricao_produto(rs.getString("descricao_produto"));
            
            p.setPreco(rs.getDouble("preco"));
            p.setQuantidade_estoque(rs.getInt("quantidade_estoque"));
            p.setId_capa(rs.getInt("id_capa"));
            p.setId_midia(rs.getInt("id_midia"));
            eDB.conectar();
            p.setCapa(eDB.carregarPorId(p.getId_capa()));
            eDB.desconectar();
            tDB.conectar();
            p.setMidia(tDB.carregarPorId(p.getId_midia()));
            tDB.desconectar();
            lista.add(p);
        }

        return lista;
    }
    
    public void alterar(Produto produto) throws Exception {
        PreparedStatement pst;
        String sql = "UPDATE produto SET id_capa=?,id_midia=?,descricao_produto=?,preco=?,quantidade_estoque=? WHERE id_produto=?";
        pst = conn.prepareStatement(sql);
        pst.setInt(1, produto.getId_capa());
        pst.setInt(2, produto.getId_midia());
        
        pst.setString(3, produto.getDescricao_produto());
        pst.setDouble(4, produto.getPreco());
        pst.setInt(5, produto.getQuantidade_estoque());
        pst.setInt(6, produto.getId_produto());
        pst.execute();
    }
    
       public void excluir(Produto produto) throws Exception {
        Statement stm;
        stm = conn.createStatement();
        String sql = "DELETE FROM produto WHERE id_produto=" + produto.getId_produto();
        stm.execute(sql);
    }
    
       public void excluirProdutoVenda(Produto produto) throws Exception {
        Statement stm;
        stm = conn.createStatement();
        String sql = "DELETE FROM produto_venda WHERE id_produto=" + produto.getId_produto();
        stm.execute(sql);
    }
       
     public Produto carregarPorId(int id_produto) throws Exception {
        Statement stm;
        ResultSet rs;
        Produto p = new Produto();
        stm = conn.createStatement();
        String sql = "SELECT * FROM produto WHERE id_produto=" + id_produto;
        rs = stm.executeQuery(sql);
        if (rs.next()) {
            CapaDAO eDB = new CapaDAO();
            MidiaDAO tDB = new MidiaDAO();
            p.setId_produto(rs.getInt("id_produto"));
            p.setDescricao_produto(rs.getString("descricao_produto"));
            
            p.setPreco(rs.getDouble("preco"));
            p.setQuantidade_estoque(rs.getInt("quantidade_estoque"));
            p.setId_capa(rs.getInt("id_capa"));
            eDB.conectar();
            p.setCapa(eDB.carregarPorId(p.getId_capa()));
            eDB.desconectar();
            p.setId_midia(rs.getInt("id_midia"));
            tDB.conectar();
            p.setMidia(tDB.carregarPorId(p.getId_midia()));
            tDB.desconectar();
        }
        return p;
    }
    
    public void atualizarMercadoria(Produto p) throws Exception {
        /*PreparedStatement pst2;
        ResultSet rs;
        String sql2 = "SELECT quantidade_estoque from produto WHERE id_produto=?";
        pst2 = conn.prepareStatement(sql2);
        pst2.setInt(1, p.getId_produto());
        pst2.execute();*/
        
        Statement stm;
        ResultSet rs;
        int qt = p.getId_produto();
        String sql2 = "SELECT quantidade_estoque from produto WHERE id_produto=" + qt;
        stm = conn.createStatement();
        rs = stm.executeQuery(sql2);
        if (rs.next()){
            int atualizar_mercadoria = rs.getInt("quantidade_estoque") + p.getQuantidade_estoque();
            
            
            PreparedStatement pst;
            String sql = "UPDATE produto SET quantidade_estoque=? WHERE id_produto=?";

            pst = conn.prepareStatement(sql);
            pst.setInt(1, atualizar_mercadoria);
            pst.setInt(2, p.getId_produto());
            pst.execute();
        }
    }
       
     public Produto verificarValorCredito(int id_produto_defeituoso) throws Exception {
        Statement stm;
        ResultSet rs;
        Produto p = new Produto();
        stm = conn.createStatement();
        String sql = "SELECT preco FROM produto WHERE id_produto=" + id_produto_defeituoso;
        rs = stm.executeQuery(sql);
        if (rs.next()) {
            p.setPreco(rs.getDouble("preco"));
        }
        return p;
    }
     
     public int verificarProdutoEmUso(int id_produto) throws Exception {
        Statement stm;
        ResultSet rs;
        int produtoEmUso = 0;
        stm = conn.createStatement();
        String sql = "SELECT * FROM produto_venda WHERE id_produto=" + id_produto;
        rs = stm.executeQuery(sql);
        if (rs.next()) {
            produtoEmUso = 1;
        }
        return produtoEmUso;
    }
    
    public void subtrairEstoque(Produto produto) throws Exception {
        PreparedStatement pst;
        String sql = "UPDATE produto SET quantidade_estoque=? WHERE id_produto=?";
        pst = conn.prepareStatement(sql);
        int quantidade_estoque = carregarPorId(produto.getId_produto()).getQuantidade_estoque() - produto.getQuantidade_estoque();
        pst.setInt(1, quantidade_estoque);
        pst.setInt(2, produto.getId_produto());
        pst.execute();
    }
}