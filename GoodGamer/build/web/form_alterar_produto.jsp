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
        <script language="javascript" >
            function validaForm(){
                formulario = document.form_produto;
                if(formulario.descricao_produto.value==""){
                    alert("O Campo Descricao Produto deve ser preenchido!!");
                    formulario.descricao_produto.focus();
                    return false;
                }
                
                else if(formulario.preco.value==""){
                    alert("O Campo Preço Pessoal deve ser preenchido!!");
                    formulario.preco.focus();
                    return false;
                }
                else if(formulario.quantidade_estoque.value==""){
                    alert("O Campo Quantidade em Estoque para Contato deve ser preenchido!!");
                    formulario.quantidade_estoque.focus();
                    return false;
                }
                else if(formulario.id_capa.value==""){
                    alert("O Campo Tipo de Estampa deve ser preenchido!!");
                    formulario.id_capa.focus();
                    return false;
                }
                else if(formulario.id_midia.value==""){
                    alert("O Campo Tipo de Midia deve ser preenchido!!");
                    formulario.id_midia.focus();
                    return false;
                }

                return true;
            }
        </script>
        <title>Alterar Produto</title>
    </head>
    <body>
        <div id="div_pagina">
            <%@include file="banner.jsp" %>
            <%@include file="menu_horizontal.jsp"%>
            <%@include file="menu_lateral.jsp"%>
            <div id="div_conteudo">
                <h2>Alterando Produto</h2>
                <form name="form_produto" action="alterar_produto.do" method="post" onsubmit="return validaForm();">
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
                                            <td></td>
                                            <td>
                                                <input type="hidden" name="id_produto" value="<%=p.getId_produto()%>">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td id="form_lado_esquerdo">Descrição do Produto:</td>
                                            <td id="form_lado_direito">
                                                <input type="text" name="descricao_produto" value="<%=p.getDescricao_produto()%>" size="40"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td id="form_lado_esquerdo">Preço <b style="color: red;">*</b>:</td>
                                            <td id="form_lado_direito">
                                                <input type="text" name="preco" value="<%=p.getPreco()%>" size="40"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td id="form_lado_esquerdo">Quantidade em Estoque:</td>
                                            <td id="form_lado_direito">
                                                <input type="text" name="quantidade_estoque" value="<%=p.getQuantidade_estoque()%>" size="40"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td id="form_lado_esquerdo">
                                                Tipo de Capa
                                            </td>
                                            <td id="form_lado_direito">
                                                <select name="id_capa" size="1">
                                                    <%
                                                        try {
                                                            CapaDAO eDB = new CapaDAO();
                                                            ArrayList<Capa> lista;
                                                            eDB.conectar();
                                                            lista = eDB.listar();
                                                            for(Capa e:lista){
                                                                if(e.getId_capa()== p.getId_capa()){
                                                                    %>
                                                                    <option value="<%=e.getId_capa()%>" selected><%=e.getTipo_capa()%></option>
                                                                    <%
                                                                }else{
                                                                    %>
                                                                    <option value="<%=e.getId_capa()%>"><%=e.getTipo_capa()%></option>
                                                                    <%
                                                                }
                                                            }
                                                            eDB.desconectar();
                                                        } catch (Exception erro) {
                                                            out.print(erro);
                                                        }
                                                    %>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td id="form_lado_esquerdo">
                                                Tipo de Midia
                                            </td>
                                            <td id="form_lado_direito">
                                                <select name="id_midia" size="1">
                                                    <%
                                                        try {
                                                            MidiaDAO tDB = new MidiaDAO();
                                                            ArrayList<Midia> lista;
                                                            tDB.conectar();
                                                            lista = tDB.listar();
                                                            for(Midia t:lista){
                                                                if(t.getId_midia()== p.getId_midia()){
                                                                    %>
                                                                    <option value="<%=t.getId_midia()%>" selected><%=t.getTipo_midia() %></option>
                                                                    <%
                                                                }else{
                                                                    %>
                                                                    <option value="<%=t.getId_midia()%>"><%=t.getTipo_midia() %></option>
                                                                    <%
                                                                }
                                                            }
                                                            tDB.desconectar();
                                                        } catch (Exception erro) {
                                                            out.print(erro);
                                                        }
                                                    %>
                                                </select>
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
                    <b style="color: red;">* Usar . (ponto) para separar REAL de CENTAVO, no campo Preço.</b>
                </form>
            </div>
        </div>
    </body>
</html>
