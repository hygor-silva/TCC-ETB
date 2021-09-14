package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Produto;
import modelo.ProdutoDAO;


public class CadastrarProduto extends HttpServlet {
   

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Cadastrar Produto</title>");
            out.println("</head>");
            out.println("<body>");
            int id_capa = Integer.parseInt(request.getParameter("id_capa"));
            int id_midia = Integer.parseInt(request.getParameter("id_midia"));
            
            String descricao_produto = new String(request.getParameter("descricao_produto").getBytes("ISO-8859-1"),"UTF-8");
            double preco = Double.parseDouble(request.getParameter("preco"));
            int quantidade_estoque = Integer.parseInt(request.getParameter("quantidade_estoque"));

            try {
                Produto p = new Produto();
                p.setId_capa(id_capa);
                p.setId_midia(id_midia);
                
                p.setDescricao_produto(descricao_produto);
                p.setPreco(preco);
                p.setQuantidade_estoque(quantidade_estoque);
                ProdutoDAO pDB = new ProdutoDAO();
                pDB.conectar();
                pDB.inserir(p);
                pDB.desconectar();
                out.print("<script language='javascript'>");
                out.print("alert('Produto inserido com sucesso!!');");
                out.print("location.href='listar_produto.jsp';");
                out.print("</script>");
            } catch (Exception erro) {
                out.print(erro);
            }

            out.println("</body>");
            out.println("</html>");


        } catch (Exception e) { 
            out.print("<script language='javascript'>");
            out.print("alert('Houve um erro ao inserir um novo produto!\\nVerifique os se os dados foram digitados corretamente.');");
            out.print("location.href='form_inserir_produto.jsp';");
            out.print("</script>");
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