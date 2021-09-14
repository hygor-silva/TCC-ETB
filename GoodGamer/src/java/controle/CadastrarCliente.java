package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Cliente;
import modelo.ClienteDAO;


public class CadastrarCliente extends HttpServlet {
   

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here*/
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Cadastrar Cliente</title>");
            out.println("</head>");
            out.println("<body>");
            String nome = new String (request.getParameter("nome").getBytes("ISO-8859-1"),"UTF-8");
            String cpf = request.getParameter("cpf");
            String telefonePessoal = request.getParameter("telefonePessoal");
            String telefoneRecado = request.getParameter("telefoneRecado");
            String email = new String (request.getParameter("email").getBytes("ISO-8859-1"),"UTF-8");

            try {
                Cliente c = new Cliente();
                c.setNome(nome);
                c.setCpf(cpf);
                c.setTelefonePessoal(telefonePessoal);
                c.setTelefoneRecado(telefoneRecado);
                c.setEmail(email);
                ClienteDAO cDB = new ClienteDAO();
                cDB.conectar();
                cDB.inserir(c);
                cDB.desconectar();
                out.print("<script language='javascript'>");
                out.print("alert('Cliente inserido com sucesso!!');");
                out.print("location.href='listar_cliente.jsp';");
                out.print("</script>");
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
