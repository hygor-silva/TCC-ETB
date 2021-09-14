package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ProdutoVendaDAO extends DataBaseDAO {
    public ProdutoVendaDAO() throws Exception {
    }
    
    
    public void inserir(ProdutoVenda produtoVenda) throws Exception {
       Statement stm;
       ResultSet rs;
       String sql1 = "SELECT * FROM produto_venda WHERE id_produto=" + produtoVenda.getId_produto() + " AND id_venda=" + produtoVenda.getId_venda();
       stm = conn.createStatement();
       rs = stm.executeQuery(sql1);
       String sql = "INSERT INTO produto_venda (quantidade_itens,id_produto,id_venda) VALUES(?,?,?)";
       if (rs.next()){
           int qt_itens = rs.getInt("quantidade_itens") + produtoVenda.getQuantidade_itens();
           produtoVenda.setQuantidade_itens(qt_itens);
           sql = "UPDATE produto_venda SET quantidade_itens=? WHERE id_produto=? AND id_venda=?";
       }
       PreparedStatement pst;
       pst = conn.prepareStatement(sql);
       pst.setInt(1, produtoVenda.getQuantidade_itens());
       pst.setInt(2, produtoVenda.getId_produto());
       pst.setInt(3, produtoVenda.getId_venda());
       pst.execute();
    }
    
    public ArrayList<ProdutoVenda> listarProdutoVenda(int id_venda) throws Exception {
        ArrayList<ProdutoVenda> listarProdutoVenda = new ArrayList<ProdutoVenda>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM produto_venda WHERE id_venda=" + id_venda;             
        pst = conn.prepareStatement(sql);
        rs = pst.executeQuery();
        while (rs.next()) {
            ProdutoVenda pv = new ProdutoVenda();
            Produto p = new Produto();
            ProdutoDAO pDB = new ProdutoDAO();
            pv.setId_produto(rs.getInt("id_produto"));
            pDB.conectar();
            pv.setProduto(pDB.carregarPorId(pv.getId_produto()));
            pDB.desconectar();
            pv.setQuantidade_itens(rs.getInt("quantidade_itens"));
            listarProdutoVenda.add(pv);
        }

        return listarProdutoVenda;
    }
    
    public void removerItem(ProdutoVenda produtoVenda) throws Exception {
        
        Statement stm;
        stm = conn.createStatement();
        String sql = "DELETE FROM produto_venda WHERE id_produto=" + produtoVenda.getId_produto() + " AND id_venda=" + produtoVenda.getId_venda();
        String sql2 = "UPDATE produto SET quantidade_estoque=" + produtoVenda.getQuantidade_itens() + " WHERE id_produto=" + produtoVenda.getId_produto();
        stm.execute(sql);
        stm.execute(sql2);
        
    }
}