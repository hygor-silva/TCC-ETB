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
        <script language="javascript" >
            function validaForm() {
                formulario = document.consulta_cliente;
                if (formulario.tipo_consulta.value != "nome" && formulario.tipo_consulta.value != "cpf") {
                    alert("É necessário selecionar CPF ou NOME no filtro de busca!");
                    formulario.tipo_consulta.focus();
                    return false;
                }
                if (formulario.texto_consulta.value == "") {
                    alert("Digite algum texto para buscar clientes!");
                    formulario.texto_consulta.focus();
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>
        <div id="div_pagina">
            <%@include file="banner.jsp" %>
            <%@include file="menu_horizontal.jsp"%>
            <%@include file="menu_lateral.jsp"%>
            <div id="div_conteudo">
                <h2>Lista de Clientes (<a href="form_inserir_cliente.jsp">Novo Cliente</a>)</h2>

                <!-- <div id="consulta" align="right">
                    <form name="consulta_cliente" action="consultar_cliente.do" method="post" onsubmit="return validaForm();">
                        <table>
                            <tr>
                                <td>
                                    <p><input type="radio" value="nome" name="tipo_consulta" checked/> NOME
                                    <input type="radio" value="cpf" name="tipo_consulta"/> CPF</p>
                                </td>
                                <td>
                                    <p><input type="text" name ="texto_consulta" size="20" style="margin-left: 20px; margin-right: 10px;"/></p>
                                </td>
                                <td>
                                    <p><input type="submit" value="Consultar"/></p>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
                <hr> -->
                <%

                    String texto_consulta = request.getParameter("texto_consulta");
                    String tipo_consulta = request.getParameter("tipo_consulta");

                    try {
                        ClienteDAO cDB = new ClienteDAO();
                        ArrayList<Cliente> lista;
                        cDB.conectar();
                        lista = cDB.consultarCliente(texto_consulta, tipo_consulta);
                        cDB.desconectar();

                        for (Cliente c : lista) {
                %>
                <table id="conteudo">
                    <tr>
                        <td id="form_lado_direito">
                            <p>Nome:</p>
                        </td>
                        <td id="form_lado_direito">
                            <%=c.getNome()%>
                        </td>
                    </tr>
                    <tr>
                        <td id="form_lado_direito">
                            <p>CPF:</p>
                        </td>
                        <td id="form_lado_direito">
                            <%=c.getCpf()%>
                        </td>
                    </tr>
                    <tr>
                        <td id="form_lado_direito">
                            <p>Telefone Pessoal:</p>
                        </td>
                        <td id="form_lado_direito">
                            <%=c.getTelefonePessoal()%>
                        </td>
                    </tr>
                    <tr>
                        <td id="form_lado_direito">
                            <p>Telefone para Contato:</p>
                        </td>
                        <td id="form_lado_direito">
                            <%=c.getTelefoneRecado()%>
                        </td>
                    </tr>
                    <tr>
                        <td id="form_lado_direito">
                            <p>Email:</p>
                        </td>
                        <td id="form_lado_direito">
                            <%=c.getEmail()%>
                        </td>
                    </tr>
                    <tr>
                        <td id="form_lado_esquerdo">
                            <p><a href="form_alterar_cliente.jsp?id_cliente=<%=c.getId_cliente()%>">
                                    <img width="20px" height="20px" src="imagens/alterar.png"/> Alterar
                                </a></p>
                        </td>
                        <td id="form_lado_direito">
                            <p><a href="excluir_cliente.do?id_cliente=<%=c.getId_cliente()%>">
                                    <img width="20px" height="20px" src="imagens/excluir.png"/> Excluir
                                </a></p>
                        </td>
                    </tr>
                </table>
                <hr>
                <%
                        }

                    } catch (Exception erro) {
                        out.print(erro);
                    }
                %>
            </div>
        </div>
    </body>
</html>
