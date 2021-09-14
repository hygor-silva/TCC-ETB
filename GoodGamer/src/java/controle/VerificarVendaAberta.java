package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import modelo.Venda;
import modelo.VendaDAO;


public class VerificarVendaAberta extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here*/
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Venda Aberta</title>");
            out.println("</head>");
            out.println("<body>");

            try {
                VendaDAO vDB = new VendaDAO();
                ArrayList<Venda> verificarVendaAberta;
                vDB.conectar();
                verificarVendaAberta = vDB.verificarVendaAberta();
                vDB.desconectar();

                for (Venda v : verificarVendaAberta) {
                    if (v.getId_venda() > 0){
                        out.println("<SCRIPT LANGUAGE=\"JavaScript\" TYPE=\"text/javascript\">");
                        out.println("alert ('Há uma venda não finalizada! Você será redirecionado para Meu Carrinho.');");
                        out.println("location.href='listar_carrinho.jsp?id_venda=" + v.getId_venda() + "';");
                        out.println("</SCRIPT>");
                    } else if (v.getId_venda() == 0){
                        out.print("<script language='javascript'>");
                        out.print("location.href='nova_venda.jsp?id_menu=2';");
                        out.print("</script>");
                    }
                }
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
