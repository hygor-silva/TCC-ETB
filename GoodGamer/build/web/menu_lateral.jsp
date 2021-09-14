<%@page import="modelo.Funcionario"%>
<div id="div_menu_lateral">
    <%
        Funcionario func = new Funcionario();
        try{
            func = (Funcionario) session.getAttribute("usuario");
            out.print("<div id='bem_vindo' align='left'><p>Seja bem vindo, "+func.getNome()
                     +".</p><p><a href='sair.jsp'><img title='Sair' id='img_bem_vindo' width='75px' height='25px' src='imagens/sair.png'/></a></p></div><hr>");
        }catch(Exception e){
            response.sendRedirect("login.jsp");
        }
        try{
            int id_menu = Integer.parseInt(request.getParameter("id_menu"));
            if (id_menu == 1){ //Produtos
                %>
                <p><a href="realizar_troca.jsp">Realizar Troca</a></p>
                <p><a href="listar_capa.jsp">Capas</a></p>
                <p><a href="listar_midia.jsp">Midias</a></p>
                <%
            }
            else if (id_menu == 2){ //Vendas
                %>
                <p><a href="realizar_troca.jsp">Realizar Troca</a></p>
                <p><a href="listar_venda.jsp">Listar Vendas</a></p>
                <%
            }
            else if (id_menu == 3){ //Clientes
                %>
                <p><a href="copiar_emails.jsp">Copiar E-mail dos Clientes</a></p>
                <%
            }
            else if (id_menu == 4){ //Funcionários
                %>
                <p><a href="listar_perfil.jsp">Perfil</a></p>
                <%
            }
        }
        catch(Exception e){
        }
    %>
</div>