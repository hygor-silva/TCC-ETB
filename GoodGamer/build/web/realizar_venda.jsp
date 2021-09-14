<%@page import="modelo.Produto"%>
<%@page import="modelo.ProdutoDAO"%>
<%@page import="modelo.Capa"%>
<%@page import="modelo.CapaDAO"%>
<%@page import="modelo.Midia"%>
<%@page import="modelo.MidiaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="layout.css">
        <title>Lista de Produtos</title>
        <script language="javascript" >
            function validaForm() {
                formulario = document.consulta_produto;
                if (formulario.texto_consulta.value == "") {
                    alert("Digite algum texto para buscar produtos!");
                    formulario.texto_consulta.focus();
                    return false;
                }
                return true;
            }
            function validaForm2() {
                formulario = document.carrinho;
                if (formulario.quantidade_itens.value < 1) {
                    alert("Digite uma quantidade válida de itens!");
                    formulario.quantidade_itens.focus();
                    return false;
                }
                if (formulario.quantidade_itens.value > formulario.quantidade_estoque.value){
                    alert("Quantidade de itens maior que quantidade disponível em estoque.");
                    formulario.quantidade_itens.focus();
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
                <%
                    int id_produto_defeituoso = 0;
                    int id_venda = 0;
                    try {
                        id_venda = Integer.parseInt(request.getParameter("id_venda"));
                    }catch(Exception e){
                        %>
                        <script language="javascript">
                            location.href='login.jsp';
                        </script>
                        <%
                    }
                    if (id_venda == 0){
                        %>
                        <script language="javascript">
                            location.href='login.jsp';
                        </script>
                        <%
                    }
                    try {
                        id_produto_defeituoso = Integer.parseInt(request.getParameter("id_produto_defeituoso"));
                    } catch (Exception e){
                    }
                    
                    
                    if (id_produto_defeituoso != 0){
                        %>
                        <h2>Venda (<a href="listar_carrinho.jsp?id_venda=<%=id_venda%>&id_produto_defeituoso=<%=id_produto_defeituoso%>">Meu Carrinho</a>)</h2>
                        <%
                    } else {
                        %>
                        <h2>Venda (<a href="listar_carrinho.jsp?id_venda=<%=id_venda%>">Meu Carrinho</a>)</h2>
                        <%
                    }
                %>
                <div id="consulta" align="right">
                    <form name="consulta_produto" action="realizar_venda.jsp" method="post" onsubmit="return validaForm();">
                        <table>
                            <tr>
                                <td>
                                    <p>DESCRIÇÃO:</p>
                                </td>
                                <td>
                                    <input type="hidden" name="id_venda" value="<%=id_venda%>"/>
                                    <p><input type="text" name ="texto_consulta" size="20" style="margin-left: 20px; margin-right: 10px;"/></p>
                                </td>
                                <td>
                                    <p><input type="submit" value="Consultar"/></p>
                                </td>
                            </tr>
                        </table>
                    </form>
                    <p style="margin-top: 0px; color: red; font-weight: bold;">Obs.: Não utilize acentuações no campo de busca!</p>
                </div>
                <hr>
                <%
                    String texto_consulta = "";
                    try {
                        if (!request.getParameter("texto_consulta").isEmpty()) {
                            texto_consulta = request.getParameter("texto_consulta");
                        }
                    } catch (Exception e) {
                    }
                    try {
                        ProdutoDAO pDB = new ProdutoDAO();
                        ArrayList<Produto> lista;
                        pDB.conectar();
                        lista = pDB.listar(texto_consulta);
                        if (lista.isEmpty()){
                            %>
                            <p>Nenhum produto cadastrado no sistema.</p>
                            <%
                        } else {
                            for (Produto p : lista) {
                                %>
                                <form name="carrinho" action="add_to_carrinho.do" method="post" onsubmit="return validaForm2();">
                                    <%
                                        if (id_produto_defeituoso != 0){
                                            %>
                                            <input type="hidden" name="id_produto_defeituoso" value="<%=id_produto_defeituoso%>"/>
                                            <%
                                        }
                                    %>
                                    <input type="hidden" name="id_venda" value="<%=id_venda%>">
                                    <table id="conteudo" border="0">
                                        <tr>
                                            <td id="form_lado_direito">
                                                <p>ID do Produto</p>
                                            </td>
                                            <td id="form_lado_direito">
                                                <input type="hidden" name="id_produto" value="<%=p.getId_produto()%>"><%=p.getId_produto()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td id="form_lado_direito">
                                                <p>Descrição do Produto</p>
                                            </td>
                                            <td id="form_lado_direito">
                                                <p><%=p.getDescricao_produto()%></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td id="form_lado_direito">
                                                <p>Preço</p>
                                            </td>
                                            <td id="form_lado_direito">
                                                <%=p.getPreco()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td id="form_lado_direito">
                                                <p>Quantidade em estoque</p>
                                            </td>
                                            <td id="form_lado_direito">
                                                <input type="hidden" name="quantidade_estoque" value="<%=p.getQuantidade_estoque()%>"><%=p.getQuantidade_estoque()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td id="form_lado_direito">
                                                <p>Tipo de Capa</p>
                                            </td>
                                            <td id="form_lado_direito">
                                                <%=p.getCapa().getTipo_capa()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td id="form_lado_direito">
                                                <p>Tipo de Midia</p>
                                            </td>
                                            <td id="form_lado_direito">
                                                <%=p.getMidia().getTipo_midia()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td id="form_lado_direito">
                                                <p><input type="text" name="quantidade_itens" value="1" size="3"></p>
                                            </td>
                                            <td id="form_lado_direito">
                                                <p><input type="image" src="imagens/add_to_carrinho.png" name="Adicionar ao Carrinho" title="Adicionar ao Carrinho"/></p>
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                                <hr>
                                <%
                            }
                        }
                        pDB.desconectar();
                    } catch (Exception erro) {
                        out.print(erro);
                    }
                %>
            </div>
        </div>
    </body>
</html>
