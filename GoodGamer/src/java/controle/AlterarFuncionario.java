package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Funcionario;
import modelo.FuncionarioDAO;

public class AlterarFuncionario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Alterar Funcionario</title>");  
            out.println("</head>");
            out.println("<body>");

            int id_funcionario = Integer.parseInt(request.getParameter("id_funcionario"));
            int id_perfil = Integer.parseInt(request.getParameter("id_perfil"));
            String nome = new String(request.getParameter("nome").getBytes("ISO-8859-1"),"UTF-8");
            String cpf = request.getParameter("cpf");
            String telefonePessoal = request.getParameter("telefone_pessoal");
            String telefoneRecado = request.getParameter("telefone_recado");
            String endereco = new String (request.getParameter("endereco").getBytes("ISO-8859-1"),"UTF-8");
            String email = request.getParameter("email");
            String login = request.getParameter("login");
            String senha = request.getParameter("senha");

            if (id_perfil < 1) {
                out.print("O campo Perfil deve ser preenchido!");
            } else if (nome == null || nome.equals("")) {
                out.print("O campo Nome deve ser preenchido!");
            } else if (cpf == null || cpf.equals("")) {
                out.print("O campo CPF deve ser preenchido!");
            } else if (telefonePessoal == null || telefonePessoal.equals("")) {
                out.print("O campo Telefone Pessoal deve ser preenchido!");
            } else if (telefoneRecado == null || telefoneRecado.equals("")) {
                out.print("O campo Telefone para Recado deve ser preenchido!");
            } else if (endereco == null || endereco.equals("")) {
                out.print("O campo Endereço deve ser preenchido!");
            } else if (email == null || email.equals("")) {
                out.print("O campo E-mail deve ser preenchido!");
            } else if (login == null || login.equals("")) {
                out.print("O campo Login deve ser preenchido!");
            } else if (senha == null || senha.equals("")) {
                out.print("O campo Senha deve ser preenchido!");
            } else if (id_funcionario < 1) {
                out.print("ID do cliente não encontrado!");
            } else {
                try {
                    Funcionario f = new Funcionario();
                    f.setId_funcionario(id_funcionario);
                    f.setId_perfil(id_perfil);
                    f.setNome(nome);
                    f.setCpf(cpf);
                    f.setTelefonePessoal(telefonePessoal);
                    f.setTelefoneRecado(telefoneRecado);
                    f.setEndereco(endereco);
                    f.setEmail(email);
                    f.setLogin(login);
                    f.setSenha(senha);
                    FuncionarioDAO fDB = new FuncionarioDAO();
                    fDB.conectar();
                    fDB.alterar(f);
                    fDB.desconectar();
                    out.print("<script language='javascript'>");
                    out.print("alert('Funcionário atualizado com sucesso!!');");
                    out.print("location.href='listar_funcionario.jsp?id_menu=4';");
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
