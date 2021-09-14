package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Venda;
import modelo.VendaDAO;
import modelo.Cliente;
import modelo.ClienteDAO;


public class NovaVenda extends HttpServlet {
   

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here*/
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Nova Venda</title>");
            out.println("</head>");
            out.println("<body>");
            String cpf_cliente = null;
            int id_produto_defeituoso = 0;
            try {
                id_produto_defeituoso = Integer.parseInt(request.getParameter("id_produto_defeituoso"));
            } catch(Exception e){
            }
            if (id_produto_defeituoso == 0){
                try {
                    cpf_cliente = request.getParameter("cpf_cliente");
                } catch(Exception e2){
                }
                if (cpf_cliente == null || cpf_cliente.equals("")){
                    cpf_cliente = "00000000000";
                }
            } else {
                cpf_cliente = "00000000000";
            }

            try {
                if (!cpf_cliente.equals("00000000000")){
                    ClienteDAO cDB = new ClienteDAO();
                    Cliente c = new Cliente();
                    cDB.conectar();
                    c = cDB.verificarCliente(cpf_cliente);
                    cDB.desconectar();
                    if (c.getCpf().equals("0000000000")){
                        out.print("<script language='javascript'>");
                        out.print("decisao = confirm('Cliente não cadastrado no sistema!\\nCadastrar novo cliente?');");
                        out.print("if (decisao){location.href='form_inserir_cliente.jsp';}");
                        out.print("else { location.href='nova_venda.jsp';}");
                        out.print("</script>");
                    } else {
                        try {
                            Venda v = new Venda();
                            v.setCpf_cliente(c.getCpf());
                            VendaDAO vDB = new VendaDAO();
                            vDB.conectar();
                            vDB.inserir(v);
                            Venda v2 = vDB.buscarIdVenda();
                            vDB.desconectar();

                            if (v2.getId_venda() == 0){
                                out.print("<script language='javascript'>");
                                out.print("alert ('Houve um problema ao Iniciar a venda.');");
                                out.print("location.href='nova_venda';");
                                out.print("</script>");
                            } else {
                                out.print("<script language='javascript'>");
                                if (id_produto_defeituoso == 0){
                                    out.print("location.href='realizar_venda.jsp?id_venda=" + v2.getId_venda() + "';");
                                } else {
                                    out.print("location.href='realizar_venda.jsp?id_venda=" + v2.getId_venda() + "&id_produto_defeituoso=" + id_produto_defeituoso + "';");
                                }
                                out.print("</script>");
                            }
                        } catch (Exception erro) {
                            out.print(erro);
                        }
                    }

                } else {
                    try {
                        Venda v = new Venda();
                        v.setCpf_cliente(null);
                        VendaDAO vDB = new VendaDAO();
                        vDB.conectar();
                        vDB.inserir(v);
                        Venda v2 = vDB.buscarIdVenda();
                        vDB.desconectar();

                        if (v2.getId_venda() == 0){
                            out.print("<script language='javascript'>");
                            out.print("alert ('Houve um problema ao Iniciar a venda.');");
                            out.print("</script>");
                        } else {
                            out.print("<script language='javascript'>");
                            if (id_produto_defeituoso == 0){
                                out.print("location.href='realizar_venda.jsp?id_venda=" + v2.getId_venda() + "';");
                            } else {
                                out.print("location.href='realizar_venda.jsp?id_venda=" + v2.getId_venda() + "&id_produto_defeituoso=" + id_produto_defeituoso + "';");
                            }
                            out.print("</script>");
                        }
                    } catch (Exception erro) {
                        out.print(erro);
                    }
                }


            } catch (Exception e2){
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
