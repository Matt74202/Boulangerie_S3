<%@page import="java.util.Vector"%>
<%@page import="model.Produit"%>
<% 
    Vector<Produit> produits= (Vector<Produit>) request.getAttribute("produits"); 
    out.print(produits);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<form method="post" action="./FabricationController">
    <label for="idProduit">Sélectionner un produit :</label>
    <select name="idProduit">
        <% for(int i=0; i<produits.size(); i++){ %>
         <option value="<%= produits.get(i).getId() %>"><%= produits.get(i).getNom() %></option>
                             <% } %>
    </select>

    <label for="quantiteProduit">Quantité :</label>
    <input type="number" name="quantiteProduit" required>

    <input type="submit" value="Fabriquer">
</form>

    </body>
</html>
