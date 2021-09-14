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
        </script>
    </head>
    <body>
        <div id="div_pagina">
            <%@include file="banner.jsp" %>
            <%@include file="menu_horizontal.jsp"%>
            <%@include file="menu_lateral.jsp"%>
            <div id="div_conteudo">
                <h2>Lista de Produtos (<a href="form_inserir_produto.jsp">Novo Produto</a>)</h2>
                <div id="consulta" align="right">
                    <form name="consulta_produto" action="listar_produto.jsp" method="post" onsubmit="return validaForm();">
                        <table>
                            <tr>
                                <td>
                                    <p>DESCRIÇÃO:</p>
                                </td>
                                <td>
                                    <p><input type="text" name ="texto_consulta" size="20" style="margin-left: 20px; margin-right: 10px;"/></p>
                                </td>
                                <td>
                                    <p><input type="image" title="Consultar" src="imagens/consultar.png" width="30px" height="30px" value="Consultar"/></p>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
                <hr>
                <%
                    String texto_consulta = "";
                    try {
                        if (!request.getParameter("texto_consulta").isEmpty()) {
                            texto_consulta = new String(request.getParameter("texto_consulta").getBytes("ISO-8859-1"),"UTF-8");
                        }
                    } catch (Exception e) {
                    }
                    try {
                        ProdutoDAO pDB = new ProdutoDAO();
                        ArrayList<Produto> lista;
                        pDB.conectar();
                        lista = pDB.listar(texto_consulta);
                        if (lista.isEmpty() && (texto_consulta.equals("") || texto_consulta == null)){
                            %>
                            <p>Nenhum produto cadastrado no sistema.</p>
                            <%
                        } else if(lista.isEmpty() && (!texto_consulta.equals("") || texto_consulta != null)){
                            %>
                            <p>Nenhum produto encontrado com a DESCRIÇÃO: "<%=texto_consulta%>"</p>
                            <%
                        }
                        for (Produto p : lista) {
                            %>
                            <table id="conteudo" border="0">
                                <tr>
                                    <td id="form_lado_direito">
                                        <p>ID do Produto</p>
                                    </td>
                                    <td id="form_lado_direito">
                                        <%=p.getId_produto()%>
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
                                        <%=p.getQuantidade_estoque()%>
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
                                    <td id="form_lado_esquerdo">
                                        <p><a href="form_alterar_produto.jsp?id_produto=<%=p.getId_produto()%>" style="text-decoration: none;">
                                                <img width="20px" height="20px" src="imagens/alterar.png" title="Alterar"/>
                                            </a></p>
                                    </td>
                                    <td id="form_lado_direito">
                                        <p><a href="excluir_produto.do?confirma=0&id_produto=<%=p.getId_produto()%>" style="text-decoration: none;">
                                                <img width="20px" height="20px" src="imagens/excluir.png" title="Excluir"/>
                                            </a>
                                            <a style="margin-left: 15px; text-decoration: none;" href="form_atualizar_mercadoria.jsp?id_produto=<%=p.getId_produto()%>">
                                                <img title="Atualizar Mercadoria" width="20px" height="20px" src="imagens/atualizar.png"/>
                                            </a></p>
                                    </td>
                                </tr>
                            </table>
                            <hr>
                            <%
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
