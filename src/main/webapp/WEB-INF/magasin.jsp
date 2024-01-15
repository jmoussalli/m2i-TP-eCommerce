<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>Magasin</title>
</head>
<body>
<%@ include file="ecommercemenu.jsp" %>

<h1>Magasin</h1>

<form action="../ficheproduit.jsp" method="get">
    <table border="solid">
        <caption>Magasin</caption>
        <tr>
            <th>id</th>
            <th>Nom</th>
            <th>Prix</th>
            <th>Qté</th>
            <th colspan="2">Actions</th>
        </tr>
        <c:forEach items="${produits}" var="produit">
            <tr>
                <td>${produit.id}</td>
                <td>${produit.nom}</td>
                <td>${produit.prix}</td>
                <td><input type="number" id="qty" name="qty" value="0"
                           onchange="updateQty(${produit.id})"/></td>
                <td>
                        <input type="hidden" name="id" value="${produit.id}" />
                        <input type="hidden" name="nom" value="${produit.nom}" />
                        <input type="hidden" name="prix" value="${produit.prix}" />
                        <button type="submit">Ouvrir Fiche</button>
                </td>
            </tr>
        </c:forEach>
    </table>
</form>

</body>
</html>
<script>
    function updateQty(productId) {
        var qtyInput = document.getElementById("qty" + productId);
        var qtyValue = qtyInput.value;
        var ficheProduitLink = document.getElementById("link" + productId);
        var originalHref = ficheProduitLink.getAttribute('href').split('&qty=')[0]; // Remove old qty if present
        ficheProduitLink.href = originalHref + "&qty=" + qtyValue; // Add new qty to href
    }
</script>
