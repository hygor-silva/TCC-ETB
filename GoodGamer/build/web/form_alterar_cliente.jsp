<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.ClienteDAO"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="layout.css">
        <script language="javascript" >
            function validaForm(){
                formulario = document.form_cliente;
                if(formulario.nome.value==""){
                    alert("O Campo Nome deve ser preenchido!!");
                    formulario.nome.focus();
                    return false;
                }
                if(formulario.cpf.value==""){
                    alert("O Campo CPF deve ser preenchido!!");
                    formulario.cpf.focus();
                    return false;
                }
                if(formulario.telefonePessoal.value==""){
                    alert("O Campo Telefone Pessoal deve ser preenchido!!");
                    formulario.telefonePessoal.focus();
                    return false;
                }
                if(formulario.telefoneContato.value==""){
                    alert("O Campo Telefone para Contato deve ser preenchido!!");
                    formulario.telefoneContato.focus();
                    return false;
                }
                if(formulario.email.value==""){
                    alert("O Campo E-mail deve ser preenchido!!");
                    formulario.email.focus();
                    return false;
                }

                return true;
            }
        </script>
        <title>Alterar Cliente</title>
    </head>
    <body>
        <div id="div_pagina">
            <%@include file="banner.jsp" %>
            <%@include file="menu_horizontal.jsp"%>
            <%@include file="menu_lateral.jsp"%>
            <div id="div_conteudo">
                <h2>Alterando Cliente</h2>
                <form name="form_cliente" action="alterar_cliente.do" method="post" onsubmit="return validaForm();">
                <table border="0">
                    <%
                        String cpf_antigo = request.getParameter("cpf_cliente");
                        try {
                            ClienteDAO cDB = new ClienteDAO();
                            cDB.conectar();
                            Cliente c = cDB.carregarPorId(cpf_antigo);
                            cDB.desconectar();
                            if (c.getCpf() != null || !c.getCpf().equals("")){
                                %>
                                <tr>
                                    <td id="form_lado_esquerdo">Nome:</td>
                                    <td id="form_lado_direito">
                                        <input type="text" name="nome" value="<%=c.getNome() %>" size="40"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="form_lado_esquerdo">CPF:</td>
                                    <td id="form_lado_direito">
                                        <input type="hidden" name="cpf_antigo" value="<%=cpf_antigo%>" size="40"/>
                                        <input type="text" name="cpf" value="<%=c.getCpf()%>" size="40"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="form_lado_esquerdo">Telefone Pessoal:</td>
                                    <td id="form_lado_direito">
                                        <input type="text" name="telefone_pessoal" value="<%=c.getTelefonePessoal()%>" size="40"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="form_lado_esquerdo">Telefone para Contato:</td>
                                    <td id="form_lado_direito">
                                        <input type="text" name="telefone_recado" value="<%=c.getTelefoneRecado()%>" size="40"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="form_lado_esquerdo">E-mail:</td>
                                    <td id="form_lado_direito">
                                        <input type="text" name="email" value="<%=c.getEmail()%>" size="40"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td id="form_lado_direito">
                                        <input type="submit" value="Alterar">
                                    </td>
                                </tr>
                                <%
                            }
                        } catch (Exception erro) {
                            out.print(erro);
                        }
                    %>
                </table>
                </form>
            </div>
        </div>
    </body>
</html>
