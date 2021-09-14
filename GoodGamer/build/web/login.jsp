<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="layout.css">
        <!--link rel="icon" type="image/png" href="imagens/favicon.ico" /-->
        <title>Acesso Restrito</title>
        <script language="javascript" >
            function validaForm(){
                formulario = document.form_login;
                if(formulario.login.value==""){
                    alert("O Campo login deve ser preenchido!!");
                    formulario.login.focus();
                    return false;
                }
                if(formulario.senha.value==""){
                    alert("O Campo senha deve ser preenchido!!");
                    formulario.senha.focus();
                    return false;
                }


                return true;
            }
        </script>
    </head>
    <body>
        <div id="div_pagina">
            <%@include file="banner.jsp" %>
            <div>
                <h3>Faça Login para ter acesso aos menus.</h3>
            </div>
            <div id="div_menu_lateral">
                <p>Área Restrita!</p>
                <p>Faça login para continuar.</p>
            </div>
            <div id="div_conteudo">
                <form action="efetuar_login.do" method="post" name="form_login" onsubmit="return validaForm();">
                    <table  style="margin-top: 140px; width: 300px; height: 100px; border: 0px">
                        <tr>
                            <td rowspan="4" width="150"><br>
                                <img style="margin-top: -30px;" src="imagens/cadeado.jpg">
                            </td>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            Usuário:
                                        </td>
                                        <td>
                                            <input type="text" name="login" size="20">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Senha:
                                        </td>
                                        <td>
                                            <input type="password" name="senha" size="20">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <input type="submit" value="Entrar">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>
