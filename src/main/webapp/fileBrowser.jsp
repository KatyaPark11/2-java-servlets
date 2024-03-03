<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>File Browser</title>
    </head>
    <body>
        <p><%= request.getAttribute("timestamp") %></p>
        <h2><%= ((java.io.File) request.getAttribute("currentDirectory")).getPath() %></h2>
        <%
            java.io.File currentDirectory = (java.io.File) request.getAttribute("currentDirectory");
            if (currentDirectory != null && currentDirectory.getParent() != null) {
            %>
            <a href="file-browser?path=<%= currentDirectory.getParent() %>">Вверх</a><br><br>
            <%
            }
            %>
        <ul>
        <%
        java.io.File[] files = (java.io.File[]) request.getAttribute("files");
        if (files != null) {
            for (java.io.File file : files) {
                %>
                <li>
                <% if (file.isDirectory()) { %>
                    &#128194;
                <% } else { %>
                    &#128190;
                <% } %>
                <% if (file.isDirectory()) { %>
                    <a href="file-browser?path=<%= file.getPath() %>"><%= file.getName() %></a>
                <% } %>
                <% if (!file.isDirectory()) { %>
                    <a href="download?file=<%= file.getPath() %>"><%= file.getName() %></a>
                <% } %>
                </li>
                <%
            }
        }
        %>
        </ul>
    </body>
</html>