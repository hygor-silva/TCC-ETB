<%@page import="modelo.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd"> 

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="layout.css">
        <script language="javascript">
            function validaForm(){
                formulario = document.form_cliente;
                if(formulario.nome.value==""){
                    alert("O Campo Nome deve ser preenchido!");
                    formulario.nome.focus();
                    return false;
                }
                else if(formulario.cpf.value==""){
                    alert("O Campo CPF deve ser preenchido!");
                    formulario.cpf.focus();
                    return false;
                }
                else if(formulario.telefonePessoal.value==""){
                    alert("O Campo Telefone Ressoal deve ser preenchido!");
                    formulario.telefonePessoal.focus();
                    return false;
                }
                else if(formulario.telefoneRecado.value==""){
                    alert("O Campo Telefone para Recado deve ser preenchido!");
                    formulario.telefoneRecado.focus();
                    return false;
                }
                else if(formulario.email.value==""){
                    alert("O Campo E-mail deve ser preenchido!");
                    formulario.email.focus();
                    return false;
                }

                return true;
            }
        </script>
        <title>Cadastrar Cliente</title>
    </head>
    <body>
        <div id="div_pagina">
            <%@include file="banner.jsp" %>
            <%@include file="menu_horizontal.jsp"%>
            <%@include file="menu_lateral.jsp"%>
            <div id="div_conteudo">
                <h2>Formulário de Cadastro de Cliente</h2>
                <form name="form_cliente" action="cadastrar_cliente.do" method="post" onsubmit="return validaForm();" >
                    <table>
                        <tr>
                            <td id="form_lado_esquerdo">Nome:</td>
                            <td id="form_lado_direito"><input type="text" name="nome" size="40" /> </td>
                        </tr>
                        <tr>
                            <td id="form_lado_esquerdo">CPF:</td>
                            <td id="form_lado_direito"><input type="text" name="cpf" size="40" /> </td>
                        </tr>
                        <tr>
                            <td id="form_lado_esquerdo">Telefone Pessoal:</td>
                            <td id="form_lado_direito"><input type="text" name="telefonePessoal" size="40" /> </td>
                        </tr>
                        <tr>
                            <td id="form_lado_esquerdo">Telefone para Recado:</td>
                            <td id="form_lado_direito"><input type="text" name="telefoneRecado" size="40" /> </td>
                        </tr>
                        <tr>
                            <td id="form_lado_esquerdo">E-mail:</td>
                            <td id="form_lado_direito"><input type="text" name="email" size="40" /> </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td id="form_lado_direito"><input type="submit" value="Salvar" /> </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>
