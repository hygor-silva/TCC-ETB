<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Midia"%>
<%@page import="modelo.MidiaDAO"%>
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
                formulario = document.form_midia;
                if(formulario.tipo_midia.value==""){
                    alert("O Campo Tipo de Midia deve ser preenchido!!");
                    formulario.tipo_midia.focus();
                    return false;
                }

                return true;
            }
        </script>
        <title>Alterar Midia</title>
    </head>
    <body>
        <div id="div_pagina">
            <%@include file="banner.jsp" %>
            <%@include file="menu_horizontal.jsp"%>
            <%@include file="menu_lateral.jsp"%>
            <div id="div_conteudo">
                <h2>Alterando Midia</h2>
                <form name="form_midia" action="alterar_midia.do" method="post" onsubmit="return validaForm();">
                <table border="0">
                    <%
                        int id_midia = 0;
                        try {
                            id_midia = Integer.parseInt(request.getParameter("id_midia"));
                        }catch(Exception e){
                            %>
                            <script language="javascript">
                                location.href='login.jsp';
                            </script>
                            <%
                        }
                        if (id_midia == 0){
                            %>
                            <script language="javascript">
                                location.href='login.jsp';
                            </script>
                            <%
                        }
                        try {
                            MidiaDAO tDB = new MidiaDAO();
                            tDB.conectar();
                            Midia t = tDB.carregarPorId(id_midia);
                            tDB.desconectar();
                            if (t.getId_midia()>0){
                                %>
                                <tr>
                                    <td id="form_lado_esquerdo">Tipo de Midia:</td>
                                    <td id="form_lado_direito">
                                        <input type="hidden" name="id_midia" value="<%=t.getId_midia()%>">
                                        <input type="text" name="tipo_midia" value="<%=t.getTipo_midia()%>">
                                    </td>
                                </tr>
                                <tr>
                                    <td id="form_lado_esquerdo"></td>
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
