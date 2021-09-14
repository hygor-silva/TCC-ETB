package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Funcionario;
import modelo.FuncionarioDAO;
import java.util.ArrayList;


public class CadastrarFuncionario extends HttpServlet {
   

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Cadastrar Funcionario</title>");
            out.println("</head>");
            out.println("<body>");
            
            int id_perfil = Integer.parseInt(request.getParameter("id_perfil"));
            String nome = new String(request.getParameter("nome").getBytes("ISO-8859-1"),"UTF-8");
            String cpf = request.getParameter("cpf");
            String telefonePessoal = request.getParameter("telefonePessoal");
            String telefoneRecado = request.getParameter("telefoneRecado");
            String endereco = new String (request.getParameter("endereco").getBytes("ISO-8859-1"),"UTF-8");
            String email = request.getParameter("email");
            String login = request.getParameter("login");
            String senha = request.getParameter("senha");
            
            try {
                String texto_consulta = "";
                String tipo_consulta = "";
                FuncionarioDAO funcDB = new FuncionarioDAO();
                ArrayList<Funcionario> lista;
                funcDB.conectar();
                lista = funcDB.listar(texto_consulta, tipo_consulta);
                funcDB.desconectar();
                if (!lista.isEmpty()){
                    int loginJaExiste = 0;
                    for (Funcionario f : lista) {
                        if (f.getLogin().equals(login)){
                            loginJaExiste = 1;
                            out.print("<script language='javascript'>");
                            out.print("alert('Este login já existe!\\nTente novamente com outro login.');");
                            out.print("location.href='javascript: history.back();';");
                            out.print("</script>");
                        }
                    }
                    if (loginJaExiste == 0){
                        try {
                            Funcionario f = new Funcionario();
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
                            fDB.inserir(f);
                            fDB.desconectar();
                            out.print("<script language='javascript'>");
                            out.print("alert('Funcionário cadastrado com sucesso!!');");
                            out.print("location.href='listar_funcionario.jsp?id_menu=4';");
                            out.print("</script>");
                        } catch (Exception erro) {
                            out.print(erro);
                        }
                    }
                    
                } else {
                    try {
                        Funcionario f = new Funcionario();
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
                        fDB.inserir(f);
                        fDB.desconectar();
                        out.print("<script language='javascript'>");
                        out.print("alert('Funcionário cadastrado com sucesso!!');");
                        out.print("location.href='listar_funcionario.jsp?id_menu=4';");
                        out.print("</script>");
                    } catch (Exception erro) {
                        out.print(erro);
                    }
                }
                
            } catch (Exception e){
                try {
                    Funcionario f = new Funcionario();
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
                    fDB.inserir(f);
                    fDB.desconectar();
                    out.print("<script language='javascript'>");
                    out.print("alert('Funcionário cadastrado com sucesso!!');");
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
