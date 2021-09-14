<%@page import="modelo.Venda"%>
<%@page import="modelo.VendaDAO"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="layout.css">
        <title>Lista de Produtos</title>
    </head>
    <body>
        <div id="div_pagina">
            <%@include file="banner.jsp" %>
            <%@include file="menu_horizontal.jsp"%>
            <%@include file="menu_lateral.jsp"%>
                <div id="div_conteudo">
                    <h2>Nova Venda</h2>
                    <hr>
                    <form name="nova_venda" action="nova_venda.do" method="post">
                        <table id="conteudo" border="0">
                            <tr>
                                <td id="form_lado_direito">
                                    <p>CPF do Cliente</p>
                                </td>
                                <td id="form_lado_direito">
                                    <p><input type="text" name="cpf_cliente" value=""></p>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td id="form_lado_direito">
                                    <p><input type="submit" value="Iniciar Venda"></p>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
        </div>
    </body>
</html>
