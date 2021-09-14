<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Produto"%>
<%@page import="modelo.ProdutoDAO"%>
<%@page import="modelo.Capa"%>
<%@page import="modelo.CapaDAO"%>
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
        <title>Atualizar Mercadoria</title>
        <script language="javascript" >
            function validaForm(){
                formulario = document.form_produto;
                if(formulario.atualizar_mercadoria.value==""){
                    alert("O Campo Atualizar Mercadoria deve ser preenchido!!");
                    formulario.atualizar_mercadoria.focus();
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
                <h2>Atualizar Mercadoria</h2>
                <form name="form_produto" action="atualizar_mercadoria.do" method="post" onsubmit="return validaForm();">
                    <table border="0">
                        <%
                            int id_produto = 0;
                            try {
                                id_produto = Integer.parseInt(request.getParameter("id_produto"));
                            }catch(Exception e){
                                %>
                                <script language="javascript">
                                    location.href='login.jsp';
                                </script>
                                <%
                            }
                            if (id_produto == 0){
                                %>
                                <script language="javascript">
                                    location.href='login.jsp';
                                </script>
                                <%
                            }
                            try {
                                ProdutoDAO pDB = new ProdutoDAO();
                                pDB.conectar();
                                Produto p = pDB.carregarPorId(id_produto);
                                pDB.desconectar();
                                if (p.getId_produto() > 0){
                                    %>
                                        <tr>
                                            <td id="form_lado_esquerdo">Atualizar mercadoria:</td>
                                            <td id="form_lado_direito">
                                                <p><input type="text" name="atualizar_mercadoria"/></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <p><input type="hidden" name="id_produto" value="<%=p.getId_produto()%>"/></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td id="form_lado_esquerdo">Descrição do Produto:</td>
                                            <td id="form_lado_direito">
                                                <p><%=p.getDescricao_produto()%></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td id="form_lado_esquerdo">Preço:</td>
                                            <td id="form_lado_direito">
                                                <p><%=p.getPreco()%></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td id="form_lado_esquerdo">Quantidade em Estoque:</td>
                                            <td id="form_lado_direito">
                                                <p><%=p.getQuantidade_estoque()%></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td id="form_lado_esquerdo">
                                                Tipo de Capa
                                            </td>
                                            <td id="form_lado_direito">
                                                <%
                                                    try {
                                                        CapaDAO eDB = new CapaDAO();
                                                        ArrayList<Capa> lista;
                                                        eDB.conectar();
                                                        lista = eDB.listar();
                                                        for(Capa e:lista){
                                                            if(e.getId_capa()== p.getId_capa()){
                                                                %>
                                                                    <p><%=e.getTipo_capa()%></p>
                                                                <%
                                                            }
                                                        }
                                                        eDB.desconectar();
                                                    } catch (Exception erro) {
                                                        out.print(erro);
                                                    }
                                                %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td id="form_lado_esquerdo">
                                                Tipo de Midia
                                            </td>
                                            <td id="form_lado_direito">
                                                <%
                                                    try {
                                                        MidiaDAO tDB = new MidiaDAO();
                                                        ArrayList<Midia> lista;
                                                        tDB.conectar();
                                                        lista = tDB.listar();
                                                        for(Midia t:lista){
                                                            if(t.getId_midia()== p.getId_midia()){
                                                                %>
                                                                    <p><%=t.getTipo_midia() %></p>
                                                                <%
                                                            }
                                                        }
                                                        tDB.desconectar();
                                                    } catch (Exception erro) {
                                                        out.print(erro);
                                                    }
                                                %>
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
