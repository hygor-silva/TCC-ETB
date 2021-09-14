package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Capa;
import modelo.CapaDAO;

public class ExcluirCapa extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Excluir Capa</title>");
            out.println("</head>");
            out.println("<body>");
            String id_capa = request.getParameter("id_capa");
            int confirma = Integer.parseInt(request.getParameter("confirma"));
            if (confirma == 0){
                out.print("<script language='javascript'>");
                out.print("decisao = confirm('Tem certeza de que deseja excluir esta capa?\\n- OK para EXCLUIR a capa.\\n- Cancelar para retornar à página anterior.');");
                out.print("if (decisao){location.href='excluir_capa.do?confirma=1&id_capa=" + id_capa + "';}");
                out.print("else { location.href='listar_capa.jsp';}");
                out.print("</script>");
            } else {
                if (id_capa == null || id_capa.equals("")) {
                    out.print("Uma Capa deve ser selecionada!");
                } else {                
                        try {
                            Capa e = new Capa();
                            e.setId_capa(Integer.parseInt(id_capa));
                            CapaDAO eDB = new CapaDAO();
                            eDB.conectar();
                            eDB.excluir(e);
                            eDB.desconectar();
                            out.print("<script language='javascript'>");
                            out.print("alert('Capa excluída com sucesso!!');");
                            out.print("location.href='listar_capa.jsp';");
                            out.print("</script>");

                        } catch (Exception e) {
                            try {
                                CapaDAO eDB = new CapaDAO();
                                eDB.conectar();
                                int capaEmUso = eDB.verificarCapaEmUso(Integer.parseInt(request.getParameter("id_capa")));
                                eDB.desconectar();
                                if (capaEmUso == 1){
                                    out.print("<script language='javascript'>");
                                    out.print("alert('Esta capa está sendo usada para descrever um ou mais produtos!\\nPara excluí-la, é necessário excluir o(s) produto(s) que está(ão) vinculado(s) à ela ou vinculá-lo(s) à outra estampa.');");
                                    out.print("location.href='listar_capa.jsp';");
                                    out.print("</script>");
                                } else{
                                    out.print("<script language='javascript'>");
                                    out.print("alert('Ops! Ocorreu um erro ao tentar excluir a capa. Reinicie o sistema e tente novamente.');");
                                    out.print("location.href='listar_capa.jsp';");
                                    out.print("</script>");
                                }
                            } catch(Exception e2){
                                out.print("<script language='javascript'>");
                                out.print("alert('Ops! Ocorreu um erro ao tentar excluir a capa. Reinicie o sistema e tente novamente.');");
                                out.print("location.href='listar_capa.jsp';");
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