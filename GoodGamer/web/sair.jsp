<%
    session.removeAttribute("usuario");
    response.sendRedirect("login.jsp");
%>