package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Cliente;
import modelo.ClienteDAO;

public class AlterarCliente extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Alterar Cliente</title>");  
            out.println("</head>");
            out.println("<body>");

            String cpf = request.getParameter("cpf");
            String cpf_antigo = request.getParameter("cpf_antigo");
            String nome = new String (request.getParameter("nome").getBytes("ISO-8859-1"),"UTF-8");
            String telefonePessoal = request.getParameter("telefone_pessoal");
            String telefoneRecado = request.getParameter("telefone_recado");
            String email = new String (request.getParameter("email").getBytes("ISO-8859-1"),"UTF-8");

            if (cpf == null || cpf.equals("")) {
                out.print("O campo CPF deve ser preenchido!");
            } else if (cpf_antigo == null || cpf_antigo.equals("")) {
                out.print("O campo CPF deve ser preenchido!");
            } else if (nome == null || nome.equals("")) {
                out.print("O campo Nome deve ser preenchido!");
            } else if (telefonePessoal == null || telefonePessoal.equals("")) {
                out.print("O campo Telefone Pessoal deve ser preenchido!");
            } else if (telefoneRecado == null || telefoneRecado.equals("")) {
                out.print("O campo Telefone para Recado deve ser preenchido!");
            } else if (email == null || email.equals("")) {
                out.print("O campo E-mail deve ser preenchido!");
            } else {
                try {
                    
                    Cliente c = new Cliente();
                    c.setNome(nome);
                    c.setCpf(cpf);
                    c.setTelefonePessoal(telefonePessoal);
                    c.setTelefoneRecado(telefoneRecado);
                    c.setEmail(email);
                    
                    ClienteDAO cDB = new ClienteDAO();
                    cDB.conectar();
                    cDB.alterar(c, cpf_antigo);
                    cDB.desconectar();
                    
                    out.print("<script language='javascript'>");
                    out.print("alert('Cliente atualizado com sucesso!!');");
                    out.print("location.href='listar_cliente.jsp';");
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
