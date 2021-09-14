<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Funcionario"%>
<%@page import="modelo.FuncionarioDAO"%>
<%@page import="modelo.Perfil"%>
<%@page import="modelo.PerfilDAO"%>
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
                formulario = document.form_funcionario;
                if(formulario.id_perfil.value==""){
                    alert("O Campo Perfil deve ser preenchido!!");
                    formulario.id_perfil.focus();
                    return false;
                }
                if(formulario.nome.value==""){
                    alert("O Campo Nome deve ser preenchido!!");
                    formulario.nome.focus();
                    return false;
                }
                if(formulario.cpf.value==""){
                    alert("O Campo CPF deve ser preenchido!!");
                    formulario.cpf.focus();
                    return false;
                }
                if(formulario.telefone_pessoal.value==""){
                    alert("O Campo Telefone Pessoal deve ser preenchido!!");
                    formulario.telefone_pessoal.focus();
                    return false;
                }
                if(formulario.telefone_recado.value==""){
                    alert("O Campo Telefone para Contato deve ser preenchido!!");
                    formulario.telefone_recado.focus();
                    return false;
                }
                if(formulario.endereco.value==""){
                    alert("O Campo Endereço deve ser preenchido!!");
                    formulario.endereco.focus();
                    return false;
                }
                if(formulario.email.value==""){
                    alert("O Campo E-mail deve ser preenchido!!");
                    formulario.email.focus();
                    return false;
                }
                if(formulario.login.value==""){
                    alert("O Campo Login deve ser preenchido!!");
                    formulario.login.focus();
                    return false;
                }
                if(formulario.senha.value==""){
                    alert("O Campo Senha deve ser preenchido!!");
                    formulario.senha.focus();
                    return false;
                }
                if (formulario.confirmar_senha.value==""){
                    alert("O Campo Confirmar Senha deve ser preenchido.");
                    formulario.confirmar_senha.focus();
                    return false;
                }
                if (formulario.confirmar_senha.value != formulario.senha.value){
                    alert("Senhas não conferem!\nDigite a mesma senha nos campos de senha.");
                    formulario.senha.focus();
                    return false;
                }

                return true;
            }
        </script>
        <title>Alterar Funcionario</title>
    </head>
    <body>
        <div id="div_pagina">
            <%@include file="banner.jsp" %>
            <%@include file="menu_horizontal.jsp"%>
            <%@include file="menu_lateral.jsp"%>
            <div id="div_conteudo">
                <h2>Alterando Funcionario</h2>
                <form name="form_funcionario" action="alterar_funcionario.do" method="post" onsubmit="return validaForm();">
                    <table border="0">
                        <%
                            int id_funcionario = 0;
                            try {
                                id_funcionario = Integer.parseInt(request.getParameter("id_funcionario"));
                            }catch(Exception e){
                                %>
                                <script language="javascript">
                                    location.href='login.jsp';
                                </script>
                                <%
                            }
                            if (id_funcionario == 0){
                                %>
                                <script language="javascript">
                                    location.href='login.jsp';
                                </script>
                                <%
                            }




                            try {
                                FuncionarioDAO fDB = new FuncionarioDAO();
                                fDB.conectar();
                                Funcionario f = fDB.carregarPorId(id_funcionario);
                                fDB.desconectar();
                                if (f.getId_funcionario()>0){
                                    %>
                                    <input type="hidden" name="id_funcionario" value="<%=f.getId_funcionario()%>">
                                    </tr>
                                    <tr>
                                        <td id="form_lado_esquerdo">Perfil:</td>
                                            <%
                                            if (f.getId_funcionario() == 1){
                                                %>
                                                <td id="form_lado_direito" style="color: red;">
                                                    <input type="hidden" name="id_perfil" value="1"/>
                                                    Administrador
                                                </td>
                                                <%
                                            } else {
                                                %>
                                                <td id="form_lado_direito">
                                                    <select name="id_perfil" size="1">
                                                        <option value="">Selecione um Perfil</option>
                                                        <%
                                                        try {
                                                            PerfilDAO pDB = new PerfilDAO();
                                                            ArrayList<Perfil> lista;
                                                            pDB.conectar();
                                                            lista = pDB.listar();
                                                            for(Perfil p:lista){
                                                                if(p.getId_perfil()== f.getId_perfil()){
                                                                    %>
                                                                    <option value="<%=p.getId_perfil()%>" selected><%=p.getPerfil() %></option>
                                                                    <%
                                                                }else{
                                                                    %>
                                                                    <option value="<%=p.getId_perfil()%>"><%=p.getPerfil() %></option>
                                                                    <%
                                                                }
                                                            }
                                                            pDB.desconectar();
                                                        } catch (Exception erro) {
                                                            out.print(erro);
                                                        }
                                                        %>
                                                    </select>
                                                </td>
                                                <%
                                            }
                                            %>
                                    </tr>
                                    <tr>
                                        <td id="form_lado_esquerdo">Nome:</td>
                                        <%
                                        if (f.getId_funcionario() == 1){
                                            %>
                                            <td id="form_lado_direito" style="color: red;">
                                                <input type="hidden" name="nome" value="Administrador do Sistema"/>
                                                Administrador do Sistema
                                            </td>
                                            <%
                                        } else {
                                            %>
                                            <td id="form_lado_direito">
                                                <input type="text" name="nome" value="<%=f.getNome() %>" size="40"/>
                                            </td>
                                            <%
                                        }
                                        %>
                                    </tr>
                                    <tr>
                                        <td id="form_lado_esquerdo">CPF:</td>
                                        <td id="form_lado_direito">
                                            <input type="text" name="cpf" value="<%=f.getCpf()%>" size="40"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="form_lado_esquerdo">Telefone Pessoal:</td>
                                        <td id="form_lado_direito">
                                            <input type="text" name="telefone_pessoal" value="<%=f.getTelefonePessoal()%>" size="40"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="form_lado_esquerdo">Telefone para Contato:</td>
                                        <td id="form_lado_direito">
                                            <input type="text" name="telefone_recado" value="<%=f.getTelefoneRecado()%>" size="40"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="form_lado_esquerdo">Endereço:</td>
                                        <td id="form_lado_direito">
                                            <input type="text" name="endereco" value="<%=f.getEndereco()%>" size="40"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="form_lado_esquerdo">E-mail:</td>
                                        <td id="form_lado_direito">
                                            <input type="text" name="email" value="<%=f.getEmail()%>" size="40"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="form_lado_esquerdo">Login:</td>
                                        <%
                                        if (f.getId_funcionario() == 1){
                                            %>
                                            <td id="form_lado_direito" style="color: red;">
                                                <input type="hidden" name="login" value="admin"/>
                                                admin
                                            </td>
                                            <%
                                        } else {
                                            %>
                                            <td id="form_lado_direito">
                                                <input type="text" name="login" value="<%=f.getLogin()%>" size="40"/>
                                            </td>
                                            <%
                                        }
                                        %>
                                    </tr>
                                    <tr>
                                        <td id="form_lado_esquerdo">Senha:</td>
                                        <td id="form_lado_direito">
                                            <input type="password" name="senha" size="40"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="form_lado_esquerdo">Confirmar Senha:</td>
                                        <td id="form_lado_direito">
                                            <input type="password" name="confirmar_senha" size="40" />
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
