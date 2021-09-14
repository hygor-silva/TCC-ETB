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
        <title>Perfis</title>
    </head>
    <body>
        <div id="div_pagina">
            <%@include file="banner.jsp" %>
            <%@include file="menu_horizontal.jsp"%>
            <%@include file="menu_lateral.jsp"%>
            <div id="div_conteudo">
                <h2>Lista de Perfis (<a href="form_inserir_perfil.jsp">Novo Perfil</a>)</h2>
                <table id="conteudo">
                    <tr>
                        <td>PERFIL</td>
                        <td>ALTERAR</td>
                        <td>EXCLUIR</td>
                        <td>GERENCIAR</td>
                    </tr>
                    <%                                            
                                try {
                                    PerfilDAO pDB = new PerfilDAO();
                                    ArrayList<Perfil> lista;
                                    pDB.conectar();
                                    lista = pDB.listar();
                                    for(Perfil p:lista){
                                        %>
                                        <tr>
                                            <td><%=p.getPerfil() %></td>
                                            <td align="center"><a href="form_alterar_perfil.jsp?id_perfil=<%=p.getId_perfil()%>"><img width="20px" height="20px" src="imagens/alterar.png" title="Alterar" border="0"></a></td>
                                            <td align="center"><a href="excluir_perfil.do?confirma=0&id_perfil=<%=p.getId_perfil()%>"><img width="20px" height="20px" src="imagens/excluir.png" title="Excluir" border="0"></a></td>
                                            <td align="center"><a href="form_gerenciar_menu_perfil.jsp?id_perfil=<%=p.getId_perfil()%>"><img width="20px" height="20px" src="imagens/gerenciar.png" title="Gerenciar Menu Perfil" border="0"></a></td>
                                        </tr>
                                        <%
                                    }
                                    pDB.desconectar();
                                } catch (Exception erro) {
                                    out.print(erro);
                                }
                    %>
                </table>
            </div>
        </div>
    </body>
</html>
