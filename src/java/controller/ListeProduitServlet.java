/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.util.Vector;
import model.Connect;
import model.Produit;

/**
 *
 * @author Matthew
 */
public class ListeProduitServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            Connect co=new Connect();
            Connection conn=co.connect();
            Vector<Produit> produits = new Vector<Produit>();
            Produit produit=new Produit();
            produits= produit.listeProduit(conn);           
          request.setAttribute("produits", produits);
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
    }



}
