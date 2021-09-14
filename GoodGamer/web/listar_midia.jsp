<%@page import="modelo.Midia"%>
<%@page import="modelo.MidiaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="layout.css">
        <title>Lista de Clientes</title>
    </head>
    <body>
        <div id="div_pagina">
            <%@include file="banner.jsp" %>
            <%@include file="menu_horizontal.jsp"%>
            <%@include file="menu_lateral.jsp"%>
            <div id="div_conteudo">
                <h2>Lista de Midias (<a href="form_inserir_midia.jsp">Nova Midia</a>)</h2>
                <hr>
                    <%                                            
                        try {
                            MidiaDAO tDB = new MidiaDAO();
                            ArrayList<Midia> lista;
                            tDB.conectar();
                            lista = tDB.listar();
                            if (lista.isEmpty()){
                                %>
                                <p>Nenhuma capa cadastrada no sistema.</p>
                                <%
                            } else {
                                %>
                                <table id="conteudo" border="1px">
                                    <tr>
                                        <td>
                                            <p>Tipo de Midia</p>
                                        </td>
                                        <td>
                                            <p>Alterar</p>
                                        </td>
                                        <td>
                                            <p>Excluir</p>
                                        </td>
                                    </tr>
                                    <%
                                    for(Midia t:lista){
                                        %>
                                            <tr>
                                                <td>
                                                    <%=t.getTipo_midia()%>
                                                </td>
                                                <td>
                                                    <p><a href="form_alterar_midia.jsp?id_midia=<%=t.getId_midia()%>">
                                                        <img width="20px" height="20px" src="imagens/alterar.png" title="Alterar"/>
                                                    </a></p>
                                                </td>
                                                <td>
                                                    <p><a href="excluir_midia.do?confirma=0&id_midia=<%=t.getId_midia() %>">
                                                        <img width="20px" height="20px" src="imagens/excluir.png" title="Excluir"/>
                                                    </a></p>
                                                </td>
                                            </tr>
                                        <%
                                    }
                                    %>    
                                    </table>
                                <%
                            }
                            tDB.desconectar();
                        } catch (Exception erro) {
                            out.print(erro);
                        }
                    %>
            </div>
        </div>
    </body>
</html>
