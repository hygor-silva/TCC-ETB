package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Midia;
import modelo.MidiaDAO;

public class AlterarMidia extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Alterar Midia</title>");  
            out.println("</head>");
            out.println("<body>");

            int id_midia = Integer.parseInt(request.getParameter("id_midia"));
            String tipo_midia = new String (request.getParameter("tipo_midia").getBytes("ISO-8859-1"),"UTF-8");

            if (tipo_midia == null || tipo_midia.equals("")) {
                out.print("O campo Tipo de Midia deve ser preenchido!");
            } else if (id_midia<1) {
                out.print("ID do midia não encontrado!");
            } else {
                try {
                    Midia t = new Midia();
                    t.setId_midia(id_midia);
                    t.setTipo_midia(tipo_midia);
                    MidiaDAO tDB = new MidiaDAO();
                    tDB.conectar();
                    tDB.alterar(t);
                    tDB.desconectar();
                    out.print("<script language='javascript'>");
                    out.print("alert('Midia atualizado com sucesso!!');");
                    out.print("location.href='listar_midia.jsp';");
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
