<%@page import="modelo.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.PerfilDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="layout.css">
        <script language="javascript" >
            function validaForm(){
                formulario = document.form_perfil;
                if(formulario.perfil.value==""){
                    alert("O Campo Perfil deve ser preenchido!");
                    formulario.nome.focus();
                    return false;
                }

                return true;
            }
        </script>
        <title>Cadastrar Perfil</title>
    </head>
    <body>
        <div id="div_pagina">
            <%@include file="banner.jsp" %>
            <%@include file="menu_horizontal.jsp"%>
            <%@include file="menu_lateral.jsp"%>
            <div id="div_conteudo">
                <h2>Formulário de Cadastro de Perfil</h2>
                <form name="form_perfil" action="cadastrar_perfil.do" method="post" onsubmit="return validaForm();">
                    <table>
                        <tr>
                            <td id="form_lado_esquerdo">Perfil:</td>
                            <td id="form_lado_direito"><input type="text" name="perfil" size="30" /> </td>
                        </tr>
                        <tr>
                            <td id="form_lado_esquerdo"></td>
                            <td id="form_lado_direito"><input type="submit" value="Salvar" /> </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>
