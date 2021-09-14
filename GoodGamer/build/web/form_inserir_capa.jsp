<%@page import="modelo.Capa"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.CapaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd"> 

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="layout.css">
        <script language="javascript">
            function validaForm(){
                formulario = document.form_capa;
                if(formulario.tipo_capa.value==""){
                    alert("O Campo Tipo de Capa deve ser preenchido!");
                    formulario.tipo_capa.focus();
                    return false;
                }

                return true;
            }
        </script>
        <title>Cadastrar Capa</title>
    </head>
    <body>
        <div id="div_pagina">
            <%@include file="banner.jsp" %>
            <%@include file="menu_horizontal.jsp"%>
            <%@include file="menu_lateral.jsp"%>
            <div id="div_conteudo">
                <h2>Formulário de Cadastro de Capa</h2>
                <form name="form_capa" action="cadastrar_capa.do" method="post" onsubmit="return validaForm();" >
                    <table>
                        <tr>
                            <td id="form_lado_esquerdo">Tipo de Capa:</td>
                            <td id="form_lado_direito"><input type="text" name="tipo_capa" size="40" /> </td>
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
