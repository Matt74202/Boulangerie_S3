package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Vector;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Connect;
import model.Produit;

/**
 * FabricationController
 */
public class FabricationController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            Connect connex = new Connect();
            Connection co = connex.connect();

            // Récupérer la liste des produits
            Produit produit = new Produit();
            Vector<Produit> produits = produit.listeProduit(co);
            request.setAttribute("produits", produits);

            // Vérifier si la requête contient un formulaire de fabrication
            String action = request.getParameter("action");

            if ("fabriquer".equals(action)) {
                // Récupérer les paramètres de fabrication
                int idProduit = Integer.parseInt(request.getParameter("idProduit"));
                int quantiteFabriquee = Integer.parseInt(request.getParameter("quantiteFabriquee"));

                // Appeler la méthode fabriquerProduit
                Produit.fabriquerProduit(idProduit, quantiteFabriquee, co);

                // Ajouter un message de succès
                request.setAttribute("message", "Fabrication réussie de " + quantiteFabriquee + " unités.");
            }

            // Fermer la connexion
            if (co != null) {
                co.close();
            }

            // Rediriger vers la page JSP
            RequestDispatcher dispat = request.getRequestDispatcher("fabrication.jsp");
            dispat.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "Erreur de connexion à la base de données.");
            RequestDispatcher dispat = request.getRequestDispatcher("fabrication.jsp");
            dispat.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ServletException | IOException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } // Appelle processRequest pour les requêtes GET
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ServletException | IOException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } // Appelle processRequest pour les requêtes POST
    }
}
