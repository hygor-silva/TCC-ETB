package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FinalizarVenda extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        int id_venda = Integer.parseInt(request.getParameter("id_venda"));
        double valor_total = Double.parseDouble(request.getParameter("valor_total"));
        int vazio = Integer.parseInt(request.getParameter("vazio"));
        out.println(vazio);
        if (vazio == 1){
            out.print("<script language='javascript'>");
            out.print("alert('Nenhum produto adicionado ao carrinho.\\nImpossível finalizar a venda!');");
            out.print("location.href='listar_carrinho.jsp?id_venda=" + id_venda + "';");
            out.print("</script>");
        } else {        
            out.print("<script language='javascript'>");
            out.print("decisao = confirm('Tem certeza de que deseja finalizar esta venda?\\n- OK para FINALIZAR a venda.\\n- Cancelar para CONTINUAR a venda.');");
            out.print("if (decisao){location.href='finalizacao_confirmada.do?id_venda=" + id_venda + "&valor_total=" + valor_total + "';}");
            out.print("else { location.href='listar_carrinho.jsp?id_venda=" + id_venda + "';}");
            out.print("</script>");
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
