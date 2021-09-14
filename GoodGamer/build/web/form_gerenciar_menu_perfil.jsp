<%@page import="modelo.Menu"%>
<%@page import="modelo.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.PerfilDAO"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="layout.css">
        <title>Gerenciar Menu Perfil</title>
    </head>
    <body>
        <div id="div_pagina">
            <%@include file="banner.jsp" %>
            <%@include file="menu_horizontal.jsp"%>
            <%@include file="menu_lateral.jsp"%>
            <div id="div_conteudo" align="center">
                <form style="margin-bottom: 30px;" name="form_gerenciar" method="post" action="gerenciar_menu_perfil.do">
                    <%
                        int id_perfil = 0;
                        try {
                            id_perfil = Integer.parseInt(request.getParameter("id_perfil"));
                        }catch(Exception e){
                            %>
                            <script language="javascript">
                                location.href='login.jsp';
                            </script>
                            <%
                        }
                        if (id_perfil == 0){
                            %>
                            <script language="javascript">
                                location.href='login.jsp';
                            </script>
                            <%
                        }
                        Perfil perfil = new Perfil();
                        ArrayList<Menu> listaVinculados = new ArrayList<Menu>();
                        ArrayList<Menu> listaDesvinculados = new ArrayList<Menu>();
                        try {
                            PerfilDAO pDB = new PerfilDAO();
                            pDB.conectar();

                            perfil = pDB.carregarPorId(id_perfil);
                            listaVinculados = pDB.verificarMenusVinculados(id_perfil);
                            listaDesvinculados = pDB.verificarMenusDesvinculados(id_perfil);

                            pDB.desconectar();

                        } catch (Exception e) {
                            out.print(e);
                        }
                    %>
                    <input type="hidden" name="id_perfil" value="<%=perfil.getId_perfil()%>" >
                    <input type="hidden" name="op" value="vincular" >
                    <h2 style="margin-bottom: 30px;">Perfil de <%=perfil.getPerfil()%></h2><hr>
                    <p>MENU:
                    <select name="id_menu" size="1">
                        <option value="">Escolha um menu</option>
                        <%
                            for (Menu m : listaDesvinculados) {
                                out.println("<option value='" + m.getId_menu() + "'>" + m.getMenu() + "</option>");
                            }

                        %>
                    </select>
                    <input type="submit" value="Vincular"></p>
                </form>
                <table id="menus_desvinculados" border="0">
                    <tr>
                        <td id="desvincular_lado_esquerdo">MENU</td>
                        <td id="desvincular_lado_direito">DESVINCULAR</td>
                    </tr>
                    <%
                        for (Menu m : listaVinculados) {
                            %>
                            <tr>
                                <td id="desvincular_lado_esquerdo"><%=m.getMenu()%></td>
                                <td id="desvincular_lado_direito"><a href="gerenciar_menu_perfil.do?id_menu=<%=m.getId_menu()%>&id_perfil=<%=perfil.getId_perfil()%>&op=desvincular"><img width="20px" height="20px" src="imagens/excluir.png" title="Desvincular Menu" border="0"></a></td>
                            </tr>
                            <%
                        }
                    %>
                </table>
            </div>
        </div>
    </body>
</html>
