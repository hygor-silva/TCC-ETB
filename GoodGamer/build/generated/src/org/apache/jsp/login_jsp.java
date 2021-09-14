package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/banner.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"layout.css\">\n");
      out.write("        <!--link rel=\"icon\" type=\"image/png\" href=\"imagens/favicon.ico\" /-->\n");
      out.write("        <title>Acesso Restrito</title>\n");
      out.write("        <script language=\"javascript\" >\n");
      out.write("            function validaForm(){\n");
      out.write("                formulario = document.form_login;\n");
      out.write("                if(formulario.login.value==\"\"){\n");
      out.write("                    alert(\"O Campo login deve ser preenchido!!\");\n");
      out.write("                    formulario.login.focus();\n");
      out.write("                    return false;\n");
      out.write("                }\n");
      out.write("                if(formulario.senha.value==\"\"){\n");
      out.write("                    alert(\"O Campo senha deve ser preenchido!!\");\n");
      out.write("                    formulario.senha.focus();\n");
      out.write("                    return false;\n");
      out.write("                }\n");
      out.write("\n");
      out.write("\n");
      out.write("                return true;\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div id=\"div_pagina\">\n");
      out.write("            ");
      out.write("<div id=\"div_banner\">\r\n");
      out.write("    <a href=\"index.jsp\"><img width=\"740px\" height=\"200px\" src=\"imagens/banner.jpg\"/></a>\r\n");
      out.write("</div>");
      out.write("\n");
      out.write("            <div>\n");
      out.write("                <h3>Faça Login para ter acesso aos menus.</h3>\n");
      out.write("            </div>\n");
      out.write("            <div id=\"div_menu_lateral\">\n");
      out.write("                <p>Área Restrita!</p>\n");
      out.write("                <p>Faça login para continuar.</p>\n");
      out.write("            </div>\n");
      out.write("            <div id=\"div_conteudo\">\n");
      out.write("                <form action=\"efetuar_login.do\" method=\"post\" name=\"form_login\" onsubmit=\"return validaForm();\">\n");
      out.write("                    <table  style=\"margin-top: 140px; width: 300px; height: 100px; border: 0px\">\n");
      out.write("                        <tr>\n");
      out.write("                            <td rowspan=\"4\" width=\"150\"><br>\n");
      out.write("                                <img style=\"margin-top: -30px;\" src=\"imagens/cadeado.jpg\">\n");
      out.write("                            </td>\n");
      out.write("                            <td>\n");
      out.write("                                <table>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td>\n");
      out.write("                                            Usuário:\n");
      out.write("                                        </td>\n");
      out.write("                                        <td>\n");
      out.write("                                            <input type=\"text\" name=\"login\" size=\"20\">\n");
      out.write("                                        </td>\n");
      out.write("                                    </tr>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td>\n");
      out.write("                                            Senha:\n");
      out.write("                                        </td>\n");
      out.write("                                        <td>\n");
      out.write("                                            <input type=\"password\" name=\"senha\" size=\"20\">\n");
      out.write("                                        </td>\n");
      out.write("                                    </tr>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td>\n");
      out.write("                                        </td>\n");
      out.write("                                        <td>\n");
      out.write("                                            <input type=\"submit\" value=\"Entrar\">\n");
      out.write("                                        </td>\n");
      out.write("                                    </tr>\n");
      out.write("                                </table>\n");
      out.write("                            </td>\n");
      out.write("                        </tr>\n");
      out.write("                    </table>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
