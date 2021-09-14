<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Perfil"%>
<%@page import="modelo.PerfilDAO"%>
<%@page import="modelo.Funcionario"%>
<%@page import="modelo.FuncionarioDAO"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="layout.css">
        <script language="javascript">
            function validaForm(){
                formulario = document.form_perfil;
                if(formulario.perfil.value==""){
                    alert("Escolha uma opção do Campo Perfil!");
                    formulario.perfil.focus();
                    return false;
                }

                return true;
            }
        </script>
        <title>Alterar Perfil</title>
    </head>
    <body>
        <div id="div_pagina">
            <%@include file="banner.jsp" %>
            <%@include file="menu_horizontal.jsp"%>
            <%@include file="menu_lateral.jsp"%>
            <div id="div_conteudo">
                <h2>Alterando Perfil</h2>
                <%
                    int id_perfil = 0;
                    try {
                        id_perfil = Integer.parseInt(request.getParameter("id_perfil"));
                    }catch(Exception e){
                        %>
                        <script language="javascript">
                            location.href='login.jsp';
                        </script>
                        <%
                    }
                    if (id_perfil == 0){
                        %>
                        <script language="javascript">
                            location.href='login.jsp';
                        </script>
                        <%
                    }
                    
                    
                    
                    try {
                        PerfilDAO pDB = new PerfilDAO();
                        pDB.conectar();
                        Perfil p = pDB.carregarPorId(id_perfil);
                        pDB.desconectar();
                %>
                <form name="form_perfil" action="alterar_perfil.do?id_perfil=<%=p.getId_perfil()%>" method="post" onsubmit="return validaForm();">
                <table>
                    <%       
                        if (p.getId_perfil()>0){
                            %>
                            <tr>
                                <td id="form_lado_esquerdo">Perfil:</td>
                                <td id="form_lado_direito">
                                    <input type="text" value="<%=p.getPerfil()%>" name="perfil">
                                </td>
                            </tr>
                            <tr>
                                <td id="form_lado_esquerdo"></td>
                                <td id="form_lado_direito"><input type="submit" value="Alterar"></td>
                            </tr>
                            <%
                        }
                    %>
                </table>
                </form>
                <%
                    } catch (Exception erro) {
                        out.print(erro);
                    }
                %>
            </div>
        </div>
    </body>
</html>
