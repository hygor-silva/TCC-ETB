package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import modelo.Produto;
import modelo.ProdutoDAO;
import modelo.VendaDAO;
import modelo.ProdutoVenda;
import modelo.ProdutoVendaDAO;

public class CancelamentoConfirmado extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        int id_venda = Integer.parseInt(request.getParameter("id_venda"));
        
        try {
            ProdutoVendaDAO pvDB = new ProdutoVendaDAO();
            ArrayList<ProdutoVenda> listarProdutoVenda;
            pvDB.conectar();
            listarProdutoVenda = pvDB.listarProdutoVenda(id_venda);
            pvDB.desconectar();
            for (ProdutoVenda pv : listarProdutoVenda) {
                ProdutoDAO pDB = new ProdutoDAO();
                Produto p = new Produto();
                pDB.conectar();
                p.setQuantidade_estoque(pDB.carregarPorId(pv.getId_produto()).getQuantidade_estoque());
                pDB.desconectar();
                ProdutoVenda pv2 = new ProdutoVenda();
                pv2.setId_produto(pv.getId_produto());
                pv2.setId_venda(id_venda);
                pv2.setQuantidade_itens(pv.getQuantidade_itens() + p.getQuantidade_estoque());
                ProdutoVendaDAO pv2DB = new ProdutoVendaDAO();
                pv2DB.conectar();
                pv2DB.removerItem(pv2);
                pv2DB.desconectar();
            }
        } catch (Exception e){
            out.println("Remoção falhou!");
        }
        
        try {
            /* TODO output your page here*/
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Cancelamento Confirmado</title>");
            out.println("</head>");
            out.println("<body>");

            try {
                VendaDAO vDB = new VendaDAO();
                vDB.conectar();
                vDB.cancelarVenda(id_venda);
                vDB.desconectar();

                out.print("<script language='javascript'>");
                out.print("alert ('Venda cancelada!');");
                out.print("location.href='verificar_venda_aberta.do';");
                out.print("</script>");

            } catch (Exception erro) {
                out.print(erro);
            }

            out.println("</body>");
            out.println("</html>");


        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
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
     * Handles the HTTP
     * <code>POST</code> method.
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
