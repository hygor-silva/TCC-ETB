<%@page import="modelo.Midia"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.MidiaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd"> 

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="layout.css">
        <script language="javascript">
            function validaForm(){
                formulario = document.form_midia;
                if(formulario.tipo_midia.value==""){
                    alert("O Campo Tipo de Midia deve ser preenchido!");
                    formulario.tipo_midia.focus();
                    return false;
                }

                return true;
            }
        </script>
        <title>Cadastrar Midia</title>
    </head>
    <body>
        <div id="div_pagina">
            <%@include file="banner.jsp" %>
            <%@include file="menu_horizontal.jsp"%>
            <%@include file="menu_lateral.jsp"%>
            <div id="div_conteudo">
                <h2>Formulário de Cadastro de Midia</h2>
                <form name="form_midia" action="cadastrar_midia.do" method="post" onsubmit="return validaForm();" >
                    <table>
                        <tr>
                            <td id="form_lado_esquerdo">Tipo de Midia:</td>
                            <td id="form_lado_direito"><input type="text" name="tipo_midia" size="40" /> </td>
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
