<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Panier</title>
</head>
<body>
<%@ include file="ecommercemenu.jsp" %>

<h1>Panier</h1>
<table>
    <tr>
        <th>Produit</th>
        <th>Quantité</th>
        <th>Prix unitaire</th>
        <th>Total</th>
    </tr>
    <c:forEach items="${panier}" var="lignePanier">
        <tr>
            <td>${lignePanier.produit.nom}</td>
            <td>${lignePanier.quantite}</td>
            <td>${lignePanier.produit.prix}</td>
            <td>${lignePanier.produit.prix * lignePanier.quantite}</td>
            <!-- Ajouter le prix total de chaque produit au totalAPayer -->
            <c:set var="totalAPayer" value="${totalAPayer + (lignePanier.produit.prix * lignePanier.quantite)}" />
        </tr>
    </c:forEach>
</table>
<h2>Total à payer : ${totalAPayer}</h2>
</body>
</html>
