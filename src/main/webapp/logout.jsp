<%-- 
    Document   : logout
    Created on : 17/04/2019, 16:44:33
    Author     : Wandes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.invalidate();
    response.sendRedirect("index.jsp");
%>