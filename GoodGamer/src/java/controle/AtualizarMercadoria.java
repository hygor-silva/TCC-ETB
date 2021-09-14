package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Produto;
import modelo.ProdutoDAO;

public class AtualizarMercadoria extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Alterar Produto</title>");  
            out.println("</head>");
            out.println("<body>");

            int id_produto = Integer.parseInt(request.getParameter("id_produto"));
            int atualizar_mercadoria = Integer.parseInt(request.getParameter("atualizar_mercadoria"));

            if (id_produto < 1) {
                out.print("ID do produto não encontrado!");
            } else if (atualizar_mercadoria < 1){
                out.print("O campo Atualizar Mercadoria deve ser preenchido com um valor maior que ZERO!");
            } else {
                try {
                    Produto p = new Produto();
                    p.setId_produto(id_produto);
                    p.setQuantidade_estoque(atualizar_mercadoria);
                    ProdutoDAO pDB = new ProdutoDAO();
                    pDB.conectar();
                    pDB.atualizarMercadoria(p);
                    pDB.desconectar();
                    out.print("<script language='javascript'>");
                    out.print("alert('Mercadoria atualizada com sucesso!!');");
                    out.print("location.href='listar_produto.jsp';");
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
