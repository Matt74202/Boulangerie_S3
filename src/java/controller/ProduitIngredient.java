package controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.util.Vector;
import model.Connect;
import model.Ingredients;
import model.Produit;


public class ProduitIngredient extends HttpServlet {
      protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            String ingredientName = request.getParameter("ingredient");
            String produitName = request.getParameter("produit");

            Connect co=new Connect();
            Connection conn=co.connect();
            Vector<Produit> produits = new Vector<Produit>();
            Vector<Ingredients> ingredients = new Vector<Ingredients>();
            Produit produit=new Produit();
            Ingredients  ingredient = new Ingredients();
            ingredients = ingredient.getAllIngredients(conn);
            produits= produit.listeProduit(conn);           
            System.out.println(ingredientName  + " "  + produitName);

            String produitIngredient = ingredient.produitIngredient(produitName  , ingredientName , conn);
            request.setAttribute("produits", produits);
            request.setAttribute("produitIngredient", produitIngredient);
            request.setAttribute("ingredients", ingredients);
            RequestDispatcher dispatcher = request.getRequestDispatcher("ProduitIngredient.jsp");
            dispatcher.forward(request, response);
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
    }
}
