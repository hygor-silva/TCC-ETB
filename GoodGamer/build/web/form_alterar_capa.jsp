<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Capa"%>
<%@page import="modelo.CapaDAO"%>
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
                formulario = document.form_estampa;
                if(formulario.tipo_capa.value==""){
                    alert("O Campo Tipo de Capa deve ser preenchido!!");
                    formulario.tipo_capa.focus();
                    return false;
                }

                return true;
            }
        </script>
        <title>Alterar Capa</title>
    </head>
    <body>
        <div id="div_pagina">
            <%@include file="banner.jsp" %>
            <%@include file="menu_horizontal.jsp"%>
            <%@include file="menu_lateral.jsp"%>
            <div id="div_conteudo">
                <h2>Alterando Capa</h2>
                <form name="form_capa" action="alterar_capa.do" method="post" onsubmit="return validaForm();">
                <table border="0">
                    <%
                        int id_capa = 0;
                        try {
                            id_capa = Integer.parseInt(request.getParameter("id_capa"));
                        }catch(Exception e){
                            %>
                            <script language="javascript">
                                location.href='login.jsp';
                            </script>
                            <%
                        }
                        if (id_capa == 0){
                            %>
                            <script language="javascript">
                                location.href='login.jsp';
                            </script>
                            <%
                        }
                        try {
                            CapaDAO eDB = new CapaDAO();
                            eDB.conectar();
                            Capa e = eDB.carregarPorId(id_capa);
                            eDB.desconectar();
                            if (e.getId_capa()>0){
                                %>
                                <tr>
                                    <td id="form_lado_esquerdo">Tipo de Capa:</td>
                                    <td id="form_lado_direito">
                                        <input type="hidden" name="id_capa" value="<%=e.getId_capa()%>">
                                        <input type="text" name="tipo_capa" value="<%=e.getTipo_capa()%>">
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
