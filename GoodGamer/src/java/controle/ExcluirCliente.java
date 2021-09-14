package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Cliente;
import modelo.ClienteDAO;

public class ExcluirCliente extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Excluir Cliente</title>");
            out.println("</head>");
            out.println("<body>");
            String cpf = request.getParameter("cpf");
            int confirma = Integer.parseInt(request.getParameter("confirma"));
            if (confirma == 0){
                out.print("<script language='javascript'>");
                out.print("decisao = confirm('Tem certeza de que deseja excluir este cliente?\\n- OK para EXCLUIR o cliente.\\n- Cancelar para retornar à página anterior.');");
                out.print("if (decisao){location.href='excluir_cliente.do?confirma=1&cpf=" + cpf + "';}");
                out.print("else { location.href='listar_cliente.jsp';}");
                out.print("</script>");
            } else {
                if (cpf == null || cpf.equals("")) {
                    out.print("Um Cliente deve ser selecionado!");
                } else {                
                        try {
                            Cliente u = new Cliente();
                            u.setCpf(cpf);
                            ClienteDAO cDB = new ClienteDAO();
                            cDB.conectar();
                            cDB.excluir(u);
                            cDB.desconectar();
                            out.print("<script language='javascript'>");
                            out.print("alert('Cliente excluído com sucesso!!');");
                            out.print("location.href='listar_cliente.jsp';");
                            out.print("</script>");

                        } catch (Exception erro) {
                            out.print(erro);
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