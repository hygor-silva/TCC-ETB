package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.CapaDAO;
import modelo.Produto;
import modelo.ProdutoDAO;

public class ExcluirProduto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Excluir Produto</title>");
            out.println("</head>");
            out.println("<body>");
            String id_produto = request.getParameter("id_produto");
            int confirma = Integer.parseInt(request.getParameter("confirma"));
            if (confirma == 0){
                out.print("<script language='javascript'>");
                out.print("decisao = confirm('Tem certeza de que deseja excluir este produto?\\n- OK para EXCLUIR o produto.\\n- Cancelar para retornar à página anterior.');");
                out.print("if (decisao){location.href='excluir_produto.do?confirma=1&id_produto=" + id_produto + "';}");
                out.print("else { location.href='listar_produto.jsp';}");
                out.print("</script>");
            } else {
                if (id_produto == null || id_produto.equals("")) {
                    out.print("Um Produto deve ser selecionado!");
                } else {
                    try {
                        Produto p = new Produto();
                        p.setId_produto(Integer.parseInt(id_produto));
                        ProdutoDAO pDB = new ProdutoDAO();
                        pDB.conectar();
                        pDB.excluir(p);
                        pDB.desconectar();
                        out.print("<script language='javascript'>");
                        out.print("alert('Produto excluído com sucesso!!');");
                        out.print("location.href='listar_produto.jsp';");
                        out.print("</script>");
                    } catch (Exception erro) {
                            try {
                                ProdutoDAO pDB = new ProdutoDAO();
                                Produto p = new Produto();
                                p.setId_produto(Integer.parseInt(id_produto));
                                pDB.conectar();
                                int produtoEmUso = pDB.verificarProdutoEmUso(p.getId_produto());
                                if (produtoEmUso == 1){
                                    out.print("<script language='javascript'>");
                                    out.print("decisao = confirm('Ao excluir este produto, o registro de todas as vendas com as quais ele está vinculado serão apagados.\\nTem certeza de que deseja excluí-lo?\\n- OK para Excluir\\n- Cancelar para voltar pra página anterior.');");
                                    out.print("if (decisao){location.href='confirmar_exclusao_produto.do?id_produto=" + id_produto + "';}");
                                    out.print("else { location.href='listar_produto.jsp';}");
                                    out.print("</script>");
                                } else{
                                    out.print("<script language='javascript'>");
                                    out.print("alert('Ops! Ocorreu um erro ao tentar excluir o produto. Reinicie o sistema e tente novamente.');");
                                    out.print("location.href='listar_produto.jsp';");
                                    out.print("</script>");
                                }
                                pDB.desconectar();
                            } catch(Exception e2){
                                out.print("<script language='javascript'>");
                                out.print("alert('Ops! Ocorreu um erro ao tentar excluir o produto. Reinicie o sistema e tente novamente.');");
                                out.print("location.href='listar_produto.jsp';");
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