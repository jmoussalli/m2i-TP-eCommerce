<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Fiche produit</title>
</head>
<body>
<%@ include file="WEB-INF/ecommercemenu.jsp" %>

<%
// Récupérer les variables depuis la session
int id = (Integer) session.getAttribute("id");
String nom = (String) session.getAttribute("nom");
Double prix = (Double) session.getAttribute("prix");
int qty = (Integer) session.getAttribute("qty");
%>

<h1>Fiche produit n° ${produit.id} ${produit.nom}</h1>

<form method="POST" action="panier">
    <img src="/images/produit.png" alt="Image du produit">
    <input type="hidden" name="id" value="<%= id %>"/>
    <p><%= nom %></p>
    <p><%= prix %></p>
    <p><input type="number" id="qty" name="qty" value="<%= qty %>" /></p>
    <p>
        <input type="submit" value="Ajouter au panier"/>
    </p>
</form>

</body>
</html>
