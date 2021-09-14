<%@page import="java.util.ArrayList"%>
<%@page import="modelo.PerfilDAO"%>
<%@page import="modelo.Menu"%>
<%@page import="modelo.Funcionario"%>
<%
Funcionario funcionario = new Funcionario();
try{
    funcionario = (Funcionario) session.getAttribute("usuario");
    
    if (funcionario != null){
        %>
        <div>
            <div id="div_menu_horizontal">
                <table border="0">
                    <tr>
                        <%
                            PerfilDAO perDB = new PerfilDAO();
                            perDB.conectar();
                            ArrayList<Menu> listaMenu = perDB.verificarMenusVinculados(funcionario.getId_perfil());
                            //ArrayList<Menu> listaMenu = perDB.verificarMenusVinculados(funcionario.getId_perfil());

                            for (Menu m : listaMenu) {
                                %>
                                <td id="menu_horizontal_individual">
                                    <a style="text-decoration:none; font-size: 15pt; color: black;"  href="<%=m.getLink()%>?id_menu=<%=m.getId_menu()%>"><%--<img id="img_menu" src="imagens/<%=m.getIcone() %>">
                                        --%><%=m.getMenu()%>
                                    </a>
                                </td>
                                <%
                            }
                            perDB.desconectar();
                        %>
                    </tr>
                </table>
            </div>
        </div>
        <%
    } else {
        %>
        <script language="javascript">
            location.href='login.jsp';
        </script>
        <%
    }
}catch(Exception e){
    response.sendRedirect("login.jsp");
}
%>