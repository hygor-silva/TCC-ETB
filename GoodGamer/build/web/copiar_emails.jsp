<%@page import="modelo.Cliente"%>
<%@page import="modelo.ClienteDAO"%>
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
        <script type="text/javascript" src="lmcbutton.js"></script>
    </head>
    <body>
        <div id="div_pagina">
            <%@include file="banner.jsp" %>
            <%@include file="menu_horizontal.jsp"%>
            <%@include file="menu_lateral.jsp"%>
            <div id="div_conteudo">
                <%
                    try {
                        int copiar_todos = 0;
                        String texto_consulta = "";
                        String tipo_consulta = "";
                        String lista_emails = "";

                        try {
                            if (!request.getParameter("texto_consulta").isEmpty()) {
                                texto_consulta = request.getParameter("texto_consulta");
                            }
                            if (!request.getParameter("tipo_consulta").isEmpty()) {
                                tipo_consulta = request.getParameter("tipo_consulta");
                            }
                        } catch (Exception e) {
                        }

                        ClienteDAO cDB = new ClienteDAO();
                        ArrayList<Cliente> listar;
                        cDB.conectar();
                        listar = cDB.listar(texto_consulta, tipo_consulta);
                        cDB.desconectar();
                        
                        for (Cliente c : listar) {
                            lista_emails += c.getEmail() + "; ";
                        }

                %>
                <h2>Lista de E-mails dos Clientes <!--(<a href="copiar_emails.jsp">Copiar Todos os E-mails</a>)--></h2>
                <table align="center">
                    <tr>
                        <td>Copiar Todos</td>
                        <td><script type="text/javascript"> ShowLMCButton('<%=lista_emails%>');</script></td>
                    </tr>
                </table>
                <div id="consulta" align="right">
                    <form name="consulta_funcionario" action="copiar_emails.jsp" method="post" onsubmit="return validaForm();">
                        <table>
                            <tr>
                                <td>
                                    <p><input type="radio" value="nome" name="tipo_consulta" checked/> NOME
                                        <input type="radio" value="cpf_cliente" name="tipo_consulta"/> CPF</p>
                                </td>
                                <td>
                                    <p><input type="text" name ="texto_consulta" size="20" style="margin-left: 20px; margin-right: 10px;"/></p>
                                </td>
                                <td>
                                    <p><input type="image" title="Consultar" src="imagens/consultar.png" width="30px" height="30px" value="Consultar"/></p>
                                </td>
                            </tr>
                        </table>
                    </form>
                    <p style="margin-top: 0px; color: red; font-weight: bold;">Obs.: Não utilize acentuações no campo de busca!</p>
                </div>
                <hr>
                <table id="conteudo" border="0">
                    <tr>
                        <td width="95px">
                            <p>CPF</p>
                        </td>
                        <td width="145px">
                            <p>Nome</p>
                        </td>
                        <td width="210px">
                            <p>E-mails:</p>
                        </td>
                        <td width="50px">
                            <p>Copiar Este</p>
                        </td>
                    </tr>
                    <%

                        for (Cliente c : listar) {
                    %>
                    <tr>
                        <td>
                            <p><%=c.getCpf()%></p>
                        </td>
                        <td>
                            <p><%=c.getNome()%></p>
                        </td>
                        <td>
                            <p><%=c.getEmail()%></p>
                        </td>
                        <td>
                            <p><script type="text/javascript"> ShowLMCButton('<%=c.getEmail()%>');</script></p>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </table>
                <hr>
                <%
                    } catch (Exception erro) {
                        out.print(erro);
                    }
                %>
            </div>
        </div>
    </body>
</html>
