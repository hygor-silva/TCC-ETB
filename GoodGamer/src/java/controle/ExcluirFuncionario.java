package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Funcionario;
import modelo.FuncionarioDAO;

public class ExcluirFuncionario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Excluir Funcionário</title>");
            out.println("</head>");
            out.println("<body>");
            String id_funcionario = request.getParameter("id_funcionario");
            int confirma = Integer.parseInt(request.getParameter("confirma"));
                if (id_funcionario.equals("1")){
                    out.print("<script language='javascript'>");
                    out.print("alert('Impossível excluir o ADMINISTRADOR ORIGINAL do sistema!');");
                    out.print("location.href='listar_funcionario.jsp?id_menu=4';");
                    out.print("</script>");
                } else {
                
                    if (confirma == 0){
                        out.print("<script language='javascript'>");
                        out.print("decisao = confirm('Tem certeza de que deseja excluir este funcionario?\\n- OK para EXCLUIR o funcionario.\\n- Cancelar para retornar à página anterior.');");
                        out.print("if (decisao){location.href='excluir_funcionario.do?confirma=1&id_funcionario=" + id_funcionario + "';}");
                        out.print("else { location.href='listar_funcionario.jsp?id_menu=4';}");
                        out.print("</script>");
                    } else {
                        if (id_funcionario == null || id_funcionario.equals("")) {
                            out.print("Um Funcionário deve ser selecionado!");
                        } else {
                                try {
                                    Funcionario f = new Funcionario();
                                    f.setId_funcionario(Integer.parseInt(id_funcionario));
                                    FuncionarioDAO cDB = new FuncionarioDAO();
                                    cDB.conectar();
                                    cDB.excluir(f);
                                    cDB.desconectar();
                                    out.print("<script language='javascript'>");
                                    out.print("alert('Funcionário excluído com sucesso!!');");
                                    out.print("location.href='listar_funcionario.jsp?id_menu=4';");
                                    out.print("</script>");

                                } catch (Exception erro) {
                                    out.print(erro);
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