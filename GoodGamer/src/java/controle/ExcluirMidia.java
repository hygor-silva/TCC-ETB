package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Midia;
import modelo.MidiaDAO;

public class ExcluirMidia extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Excluir Midia</title>");
            out.println("</head>");
            out.println("<body>");
            String id_midia = request.getParameter("id_midia");int confirma = Integer.parseInt(request.getParameter("confirma"));
            if (confirma == 0){
                out.print("<script language='javascript'>");
                out.print("decisao = confirm('Tem certeza de que deseja excluir esta midia?\\n- OK para EXCLUIR a midia.\\n- Cancelar para retornar à página anterior.');");
                out.print("if (decisao){location.href='excluir_midia.do?confirma=1&id_midia=" + id_midia + "';}");
                out.print("else { location.href='listar_midia.jsp';}");
                out.print("</script>");
            } else {
                if (id_midia == null || id_midia.equals("")) {
                    out.print("Uma Midia deve ser selecionado!");
                } else {                
                        try {
                            Midia t = new Midia();
                            t.setId_midia(Integer.parseInt(id_midia));
                            MidiaDAO tDB = new MidiaDAO();
                            tDB.conectar();
                            tDB.excluir(t);
                            tDB.desconectar();
                            out.println(id_midia);
                            out.print("<script language='javascript'>");
                            out.print("alert('Midia excluído com sucesso!!');");
                            out.print("location.href='listar_midia.jsp';");
                            out.print("</script>");

                        } catch (Exception erro) {
                            try {
                                MidiaDAO tDB = new MidiaDAO();
                                tDB.conectar();
                                int midiaEmUso = tDB.verificarMidiaEmUso(Integer.parseInt(request.getParameter("id_midia")));
                                tDB.desconectar();
                                if (midiaEmUso == 1){
                                    out.print("<script language='javascript'>");
                                    out.print("alert('Esta midia está sendo usado para descrever um ou mais produtos!\\nPara excluí-lo, é necessário excluir o(s) produto(s) que está(ão) vinculado(s) à ele ou vinculá-lo(s) à outro tecido.');");
                                    out.print("location.href='listar_midia.jsp';");
                                    out.print("</script>");
                                } else {
                                    out.print("<script language='javascript'>");
                                    out.print("alert('Ops! Ocorreu um erro ao tentar excluir a midia. Reinicie o sistema e tente novamente.');");
                                    out.print("location.href='listar_midia.jsp';");
                                    out.print("</script>");
                                }
                            } catch(Exception e2){
                                out.print("<script language='javascript'>");
                                out.print("alert('Ops! Ocorreu um erro ao tentar excluir a midia. Reinicie o sistema e tente novamente.');");
                                out.print("location.href='listar_midia.jsp';");
                                out.print("</script>");
                            }
                        }
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