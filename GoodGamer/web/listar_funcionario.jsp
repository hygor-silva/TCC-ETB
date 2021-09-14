<%@page import="org.omg.PortableServer.REQUEST_PROCESSING_POLICY_ID"%>
<%@page import="modelo.Funcionario"%>
<%@page import="modelo.FuncionarioDAO"%>
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
                formulario = document.consulta_funcionario;
                if (formulario.tipo_consulta.value != "nome" && formulario.tipo_consulta.value != "cpf") {
                    alert("É necessário selecionar CPF ou NOME no filtro de busca!");
                    formulario.tipo_consulta.focus();
                    return false;
                }
                if (formulario.texto_consulta.value == "") {
                    alert("Digite algum texto para buscar funcionários!");
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
                <h2>Lista de Funcionários (<a href="form_inserir_funcionario.jsp?id_menu=<%=Integer.parseInt(request.getParameter("id_menu"))%>">Novo Funcionário</a>)</h2>
                <div id="consulta" align="right">
                    <form name="consulta_funcionario" action="listar_funcionario.jsp" method="post" onsubmit="return validaForm();">
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
                                    <p><input type="image" title="Consultar" src="imagens/consultar.png" width="30px" height="30px" value="Consultar"/></p>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
                <hr>
                <%
                    String texto_consulta = "";
                    String tipo_consulta = "";
                    String tipo_consulta_texto = "NOME";
                    try {
                        if (!request.getParameter("texto_consulta").isEmpty()) {
                            texto_consulta = new String(request.getParameter("texto_consulta").getBytes("ISO-8859-1"),"UTF-8");
                        }
                        if (!request.getParameter("tipo_consulta").isEmpty()) {
                            tipo_consulta = request.getParameter("tipo_consulta");
                        }
                    } catch (Exception e) {
                    }
                    if (tipo_consulta.equals("cpf_cliente")){
                        tipo_consulta_texto = "CPF";
                    }
                    try {
                        FuncionarioDAO fDB = new FuncionarioDAO();
                        ArrayList<Funcionario> lista;
                        fDB.conectar();
                        lista = fDB.listar(texto_consulta, tipo_consulta);
                        if (lista.isEmpty() && (texto_consulta.equals("") || texto_consulta == null)){
                            %>
                            <p>Nenhum funcionário cadastrado no sistema.</p>
                            <%
                        } else if(lista.isEmpty() && (!texto_consulta.equals("") || texto_consulta != null)){
                            %>
                            <p>Nenhum funcionário encontrado com o <%=tipo_consulta_texto%>: "<%=texto_consulta%>"</p>
                            <%
                        }

                        for (Funcionario f : lista) {
                            %>
                            <table id="conteudo">
                                <tr>
                                    <td id="form_lado_direito">
                                        <p>Perfil:</p>
                                    </td>
                                    <td id="form_lado_direito">
                                        <%=f.getPerfil()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="form_lado_direito">
                                        <p>Nome:</p>
                                    </td>
                                    <td id="form_lado_direito">
                                        <%=f.getNome()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="form_lado_direito">
                                        <p>CPF:</p>
                                    </td>
                                    <td id="form_lado_direito">
                                        <%=f.getCpf()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="form_lado_direito">
                                        <p>Telefone Pessoal:</p>
                                    </td>
                                    <td id="form_lado_direito">
                                        <%=f.getTelefonePessoal()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="form_lado_direito">
                                        <p>Telefone para Recado:</p>
                                    </td>
                                    <td id="form_lado_direito">
                                        <%=f.getTelefoneRecado()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="form_lado_direito">
                                        <p>Endereço:</p>
                                    </td>
                                    <td id="form_lado_direito">
                                        <%=f.getEndereco()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="form_lado_direito">
                                        <p>Email:</p>
                                    </td>
                                    <td id="form_lado_direito">
                                        <%=f.getEmail()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="form_lado_direito">
                                        <p>Login:</p>
                                    </td>
                                    <td id="form_lado_direito">
                                        <%=f.getLogin()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="form_lado_esquerdo">
                                        <p><a href="form_alterar_funcionario.jsp?id_funcionario=<%=f.getId_funcionario()%>">
                                                <img width="20px" height="20px" src="imagens/alterar.png" title="Alterar"/>
                                            </a></p>
                                    </td>
                                    <td id="form_lado_direito">
                                        <p><a href="excluir_funcionario.do?confirma=0&id_funcionario=<%=f.getId_funcionario()%>">
                                                <img width="20px" height="20px" src="imagens/excluir.png" title="Excluir"/>
                                            </a></p>
                                    </td>
                                </tr>
                            </table>
                            <hr>
                            <%
                        }
                        fDB.desconectar();
                    } catch (Exception erro) {
                        out.print(erro);
                    }
                %>
            </div>
        </div>
    </body>
</html>
