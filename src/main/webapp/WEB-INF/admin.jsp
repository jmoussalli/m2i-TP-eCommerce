<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des produits</title>
</head>
<body>
<%@ include file="ecommercemenu.jsp" %>

<h1>Administration</h1>

<table border="solid">
<caption>Liste des produits disponibles</caption>
    <tr>
        <th>Nom</th>
        <th>Prix</th>
        <th colspan="2">Actions</th>
    </tr>
    <c:forEach items="${produits}" var="produit">
        <tr>
            <td>${produit.nom}</td>
            <td>${produit.prix}</td>
            <td><button>Action vide</button></td>
            <td><button>Action vide</button></td>
        </tr>
    </c:forEach>
</table>
<hr>
<h2>Ajouter un produit</h2>
<form action="admin" method="post">
    <label for="nom">Nom du produit :</label>
    <input type="text" id="nom" name="nom" required><br><br>
    <label for="prix">Prix du produit :</label>
    <input type="number" id="prix" name="prix" required><br><br>
    <input type="submit" value="Ajouter le produit">
</form>

</body>
</html>
