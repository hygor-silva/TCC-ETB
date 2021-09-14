<%@page import="modelo.Funcionario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.FuncionarioDAO"%>
<%@page import="modelo.Perfil"%>
<%@page import="modelo.PerfilDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd"> 

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="layout.css">
        <script language="javascript">
            function validaForm(){
                formulario = document.form_funcionario;
                if(formulario.id_perfil.value==""){
                    alert("O Campo Perfil deve ser preenchido!");
                    formulario.id_perfil.focus();
                    return false;
                }
                if(formulario.nome.value==""){
                    alert("O Campo Nome deve ser preenchido!");
                    formulario.nome.focus();
                    return false;
                }
                if(formulario.cpf.value==""){
                    alert("O Campo CPF deve ser preenchido!");
                    formulario.cpf.focus();
                    return false;
                }
                if(formulario.telefonePessoal.value==""){
                    alert("O Campo Telefone Pessoal deve ser preenchido!");
                    formulario.telefonePessoal.focus();
                    return false;
                }
                if(formulario.telefoneRecado.value==""){
                    alert("O Campo Telefone para Recado deve ser preenchido!");
                    formulario.telefoneRecado.focus();
                    return false;
                }
                if(formulario.endereco.value==""){
                    alert("O Campo Endereço deve ser preenchido!");
                    formulario.endereco.focus();
                    return false;
                }
                if(formulario.email.value==""){
                    alert("O Campo Email deve ser preenchido!");
                    formulario.email.focus();
                    return false;
                }
                if(formulario.login.value==""){
                    alert("O Campo Login deve ser preenchido!");
                    formulario.login.focus();
                    return false;
                }
                if(formulario.senha.value==""){
                    alert("O Campo Senha deve ser preenchido!");
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
        <title>Cadastrar Funcionario</title>
    </head>
    <body>
        <div id="div_pagina">
            <%@include file="banner.jsp" %>
            <%@include file="menu_horizontal.jsp"%>
            <%@include file="menu_lateral.jsp"%>
            <div id="div_conteudo">
                <h2>Formulário de Cadastro de Funcionario</h2>
                <form name="form_funcionario" action="cadastrar_funcionario.do" method="post" onsubmit="return validaForm();" >
                    <table>
                        <tr>
                            <td id="form_lado_esquerdo">Perfil:</td>
                            <td id="form_lado_direito">
                                <select name="id_perfil" size="1">
                                    <option value="">Escolha um Perfil</option>
                                    <%
                                        try {
                                            PerfilDAO pDB = new PerfilDAO();
                                            ArrayList<Perfil> lista;
                                            pDB.conectar();
                                            lista = pDB.listar();
                                            Funcionario f = new Funcionario();
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
                        </tr>
                        <tr>
                            <td id="form_lado_esquerdo">Nome:</td>
                            <td id="form_lado_direito"><input type="text" name="nome" size="40" /> </td>
                        </tr>
                        <tr>
                            <td id="form_lado_esquerdo">CPF:</td>
                            <td id="form_lado_direito"><input type="text" name="cpf" size="40" /> </td>
                        </tr>
                        <tr>
                            <td id="form_lado_esquerdo">Telefone Pessoal:</td>
                            <td id="form_lado_direito"><input type="text" name="telefonePessoal" size="40" /> </td>
                        </tr>
                        <tr>
                            <td id="form_lado_esquerdo">Telefone para Recado:</td>
                            <td id="form_lado_direito"><input type="text" name="telefoneRecado" size="40" /> </td>
                        </tr>
                        <tr>
                            <td id="form_lado_esquerdo">Endereço:</td>
                            <td id="form_lado_direito"><input type="text" name="endereco" size="40" /> </td>
                        </tr>
                        <tr>
                            <td id="form_lado_esquerdo">Email:</td>
                            <td id="form_lado_direito"><input type="text" name="email" size="40" /> </td>
                        </tr>
                        <tr>
                            <td id="form_lado_esquerdo">Login:</td>
                            <td id="form_lado_direito"><input type="text" name="login" size="40" /> </td>
                        </tr>
                        <tr>
                            <td id="form_lado_esquerdo">Senha:</td>
                            <td id="form_lado_direito"><input type="password" name="senha" size="40" /> </td>
                        </tr>
                        <tr>
                            <td id="form_lado_esquerdo">Confirmar Senha:</td>
                            <td id="form_lado_direito"><input type="password" name="confirmar_senha" size="40" /> </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td id="form_lado_direito"><input type="submit" value="Salvar" /> </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>
