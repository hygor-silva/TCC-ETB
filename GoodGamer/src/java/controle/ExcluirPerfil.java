
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.CapaDAO;
import modelo.Perfil;
import modelo.PerfilDAO;

public class ExcluirPerfil extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here*/
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ExcluirPerfil</title>");
            out.println("</head>");
            out.println("<body>");
            int id_perfil = Integer.parseInt(request.getParameter("id_perfil"));
            int confirma = Integer.parseInt(request.getParameter("confirma"));
            if (confirma == 0){
                out.print("<script language='javascript'>");
                out.print("decisao = confirm('Tem certeza de que deseja excluir este perfil?\\n- OK para EXCLUIR o perfil.\\n- Cancelar para retornar à página anterior.');");
                out.print("if (decisao){location.href='excluir_perfil.do?confirma=1&id_perfil=" + id_perfil + "';}");
                out.print("else { location.href='listar_perfil.jsp';}");
                out.print("</script>");
            } else {
                if (id_perfil < 1) {
                    out.print("Um Perfil deve ser selecionado!");
                } else {                
                        try {
                            Perfil p = new Perfil();
                            p.setId_perfil(id_perfil);
                            PerfilDAO pDB = new PerfilDAO();
                            pDB.conectar();
                            pDB.excluir(p);
                            pDB.desconectar();
                            out.print("<script language='javascript'>");
                            out.print("alert('Perfil excluído com sucesso!!');");
                            out.print("location.href='listar_perfil.jsp';");
                            out.print("</script>");

                        } catch (Exception erro) {
                            try {
                                PerfilDAO eDB = new PerfilDAO();
                                eDB.conectar();
                                int perfilEmUso = eDB.verificarPerfilEmUso(id_perfil);
                                eDB.desconectar();
                                if (perfilEmUso == 1){
                                    out.print("<script language='javascript'>");
                                    out.print("alert('Este perfil está sendo usado para descrever um ou mais funcionários!\\nPara excluí-lo, é necessário excluir o(s) funcionário(s) que está(ão) vinculado(s) à ele ou vinculá-lo(s) à outro perfil.');");
                                    out.print("location.href='listar_perfil.jsp';");
                                    out.print("</script>");
                                } else{
                                    out.print("<script language='javascript'>");
                                    out.print("alert('Ops! Ocorreu um erro ao tentar excluir o perfil. Reinicie o sistema e tente novamente.');");
                                    out.print("location.href='listar_perfil.jsp';");
                                    out.print("</script>");
                                }
                            } catch(Exception e2){
                                out.print("<script language='javascript'>");
                                out.print("alert('Ops! Ocorreu um erro ao tentar excluir o perfil. Reinicie o sistema e tente novamente.');");
                                out.print("location.href='listar_perfil.jsp';");
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
