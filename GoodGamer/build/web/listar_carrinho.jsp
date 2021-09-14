<%@page import="modelo.Venda"%>
<%@page import="modelo.VendaDAO"%>
<%@page import="modelo.ProdutoVenda"%>
<%@page import="modelo.ProdutoVendaDAO"%>
<%@page import="modelo.Produto"%>
<%@page import="modelo.ProdutoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="layout.css"><script language="javascript" >
        </script>
        <title>Lista de Produtos</title>
    </head>
    <body>
        <div id="div_pagina">
            <%@include file="banner.jsp" %>
            <%@include file="menu_horizontal.jsp"%>
            <%@include file="menu_lateral.jsp"%>
            <div id="div_conteudo">
                <%
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
                    int id_produto_defeituoso = 0;
                    try {
                        id_produto_defeituoso = Integer.parseInt(request.getParameter("id_produto_defeituoso"));
                    } catch (Exception e){
                    }
                    double credito = 0;
                    if (id_produto_defeituoso != 0){
                        %>
                        <h2>Meu Carrinho (<a href="realizar_venda.jsp?id_venda=<%=id_venda%>&id_produto_defeituoso=<%=id_produto_defeituoso%>">Continuar Comprando</a>)</h2>
                        <%
                        ProdutoDAO pDB = new ProdutoDAO();
                        Produto p = new Produto();
                        pDB.conectar();
                        p = pDB.verificarValorCredito(id_produto_defeituoso);
                        pDB.desconectar();
                        credito = p.getPreco();
                        %>
                        <h4 align="right">Crédito do Cliente: R$ <%=credito%></h4>
                        <%
                    } else {
                        %>
                        <h2>Meu Carrinho (<a href="realizar_venda.jsp?id_venda=<%=id_venda%>">Continuar Comprando</a>)</h2>
                        <%
                    }
                %>
                <hr>
                <%
                    double valor_total = 0;
                    try {
                        ProdutoVendaDAO pvDB = new ProdutoVendaDAO();
                        ArrayList<ProdutoVenda> listarProdutoVenda;
                        pvDB.conectar();
                        listarProdutoVenda = pvDB.listarProdutoVenda(id_venda);
                %>

                    <table id="conteudo" border="0">
                        <tr>
                            <td width="290px">
                                <p>Descrição do Produto</p>
                            </td>
                            <td width="70px">
                                <p>Qt Itens</p>
                            </td>
                            <td width="70">
                                <p>Valor</p>
                            </td>
                            <td width="70">
                                <p>Remover</p>
                            </td>
                        </tr>

                        <%
                            for (ProdutoVenda pv : listarProdutoVenda) {
                        %>
                        <form name="remover_item" action="remover_item.do" method="post">
                            <%
                            if (id_produto_defeituoso != 0){
                                %>
                                <input type="hidden" name="id_produto_defeituoso" value="<%=id_produto_defeituoso%>">
                                <%
                            }
                            %>
                            <input type="hidden" name="id_produto" value="<%=pv.getId_produto()%>">
                            <input type="hidden" name="id_venda" value="<%=id_venda%>">
                            <input type="hidden" name="quantidade_itens" value="<%=pv.getQuantidade_itens()%>">
                            <tr>
                                <td>
                                    <p><%=pv.getProduto().getDescricao_produto()%></p>
                                </td>
                                <td>
                                    <%=pv.getQuantidade_itens()%>
                                </td>
                                <td>
                                    <%=pv.getProduto().getPreco()%>
                                </td>
                                <td>
                                    <p><input style="width: 25px; height: 25px;" src="imagens/excluir.png" title="Remover Item" type="image" value="Remover Item"></p>
                                </td>
                            </tr>
                        </form>
                        <%
                                valor_total += pv.getProduto().getPreco() * pv.getQuantidade_itens();
                            }
                            if (id_produto_defeituoso != 0){
                                valor_total -= credito;
                            }
                        %>
                    </table>
                    <hr>
                    <table align="right">
                        <tr>
                            <%
                            if (valor_total >= 0){
                                %>
                                <td>
                                    <p>VALOR TOTAL:</p>
                                </td>
                                <td>
                                    <p style="background-color: greenyellow;">R$ <%=valor_total%></p>
                                </td>
                                <%
                            }
                            else {
                                %>
                                <td>
                                    <p>CRÉDITO:</p>
                                </td>
                                <td>
                                    <p style="background-color: yellow;">R$ <%=valor_total * (-1)%></p>
                                </td>
                                <%
                            }
                            %>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <form name="finalizar_venda" action="finalizar_venda.do" method="post">
                                    <input type="hidden" name="id_venda" value="<%=id_venda%>"/>
                                    <%
                                    if (listarProdutoVenda.isEmpty()){
                                        %>
                                        <input type="hidden" name="vazio" value="1"/>
                                        <%
                                    } else {
                                        %>
                                        <input type="hidden" name="vazio" value="0"/>
                                        <%
                                    }
                                    if (valor_total > 0){
                                        %>
                                        <input type="hidden" name="valor_total" value="<%=valor_total%>"/>
                                        <%
                                    } else {
                                        %>
                                        <input type="hidden" name="valor_total" value="0"/>
                                        <%
                                    }
                                    %>
                                    
                                    <input type="image" src="imagens/finalizar_venda.png" value="Finalizar Venda"/>
                                </form>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <form name="cancelar_venda" action="cancelar_venda.do" method="post">
                                    <input type="hidden" name="id_venda" value="<%=id_venda%>"/>
                                    <input type="image" src="imagens/cancelar_venda.png" value="Cancelar Venda"/>
                                </form>
                            </td>
                        </tr>
                    </table>
                <%
                        pvDB.desconectar();
                    } catch (Exception erro) {
                        out.print(erro);
                    }

                %>
            </div>
        </div>
    </body>
</html>
