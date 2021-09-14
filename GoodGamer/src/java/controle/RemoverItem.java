package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.ProdutoVenda;
import modelo.ProdutoVendaDAO;
import modelo.Produto;
import modelo.ProdutoDAO;

public class RemoverItem extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Remover Item</title>");  
            out.println("</head>");
            out.println("<body>");
            int id_produto_defeituoso = 0;
            try {
                id_produto_defeituoso = Integer.parseInt(request.getParameter("id_produto_defeituoso"));
            } catch (Exception e){
            }
            int id_produto = Integer.parseInt(request.getParameter("id_produto"));
            int id_venda = Integer.parseInt(request.getParameter("id_venda"));
            int quantidade_itens = Integer.parseInt(request.getParameter("quantidade_itens"));

            if (id_produto < 1) {
                out.print("ID do produto não encontrado!");
            } else if (id_venda < 1) {
                out.print("ID da venda não encontrado!");
            } else {
                try {
                    ProdutoDAO pDB = new ProdutoDAO();
                    Produto p = new Produto();
                    pDB.conectar();
                    p.setQuantidade_estoque(pDB.carregarPorId(id_produto).getQuantidade_estoque());
                    pDB.desconectar();
                    ProdutoVenda pv = new ProdutoVenda();
                    pv.setId_produto(id_produto);
                    pv.setId_venda(id_venda);
                    pv.setQuantidade_itens(quantidade_itens + p.getQuantidade_estoque());
                    ProdutoVendaDAO pvDB = new ProdutoVendaDAO();
                    pvDB.conectar();
                    pvDB.removerItem(pv);
                    pvDB.desconectar();
                    out.print("<script language='javascript'>");
                    out.print("alert('Item removido do carrinho!!');");
                    if (id_produto_defeituoso == 0){
                        out.print("location.href='listar_carrinho.jsp?id_venda=" + id_venda + "';");
                    } else {
                        out.print("location.href='listar_carrinho.jsp?id_venda=" + id_venda + "&id_produto_defeituoso=" + id_produto_defeituoso + "';");
                    }
                    out.print("</script>");
                } catch (Exception erro) {
                    out.print(erro);
                }

            }
            out.println("</body>");
            out.println("</html>");
            
        } finally { 
            out.close();
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
