package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Capa;
import modelo.CapaDAO;

public class AlterarCapa extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Alterar Capa</title>");  
            out.println("</head>");
            out.println("<body>");

            int id_capa = Integer.parseInt(request.getParameter("id_capa"));
            String tipo_capa = new String (request.getParameter("tipo_capa").getBytes("ISO-8859-1"),"UTF-8");

            if (tipo_capa == null || tipo_capa.equals("")) {
                out.print("O campo Tipo de Capa deve ser preenchido!");
            } else if (id_capa<1) {
                out.print("ID da capa não encontrado!");
            } else {
                try {
                    Capa e = new Capa();
                    e.setId_capa(id_capa);
                    e.setTipo_capa(tipo_capa);
                    CapaDAO eDB = new CapaDAO();
                    eDB.conectar();
                    eDB.alterar(e);
                    eDB.desconectar();
                    out.print("<script language='javascript'>");
                    out.print("alert('Capa atualizada com sucesso!!');");
                    out.print("location.href='listar_capa.jsp';");
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
