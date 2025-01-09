// getAllIngredient
// getIngredientById
package model;
import java.sql.*;
import java.util.HashMap;
import java.util.Vector;

/**
 * Ingredients
 */
public class Ingredients {

    private int idIngredients;
    private String nomIngredients;
    private float quantite;
    private String unite;
   private float prix;
    public Ingredients() {

    }

    public Ingredients (int idIngredients  ,   String nomIngredient , float quantite  ,  String unite , float prix ){
        setIdIngredients(idIngredients);
        setNomIngredients(nomIngredient);
        setQuantite(quantite);
        setPrix(prix);
        setUnite(unite);
    }
    public String getNomIngredients() {
        return nomIngredients;
    }

    public void setIdIngredients(int idIngredients) {
        this.idIngredients = idIngredients;
    }

    public void setNomIngredients(String nomIngredients) {
        this.nomIngredients = nomIngredients;
    }

    public void setPrix(float prix) {
        this.prix = prix;
    }

    public void setQuantite(float quantite) {
        this.quantite = quantite;
    }

    public void setUnite(String unite) {
        this.unite = unite;
    }

    public Vector<Ingredients> getAllIngredients(Connection co) throws Exception {
        Vector<Ingredients> allIngredients = new Vector<>();
        String querry = "select * from ingredients";
        Statement stmt = null;
        ResultSet res = null;
        stmt = co.createStatement();
        res = stmt.executeQuery(querry);
        while (res.next()) {
            int idIngredients = res.getInt(1);
            String nomIngredients = res.getString(2);
            float quantite = res.getFloat(3);
            String unite = res.getString(4);
            float prix = res.getFloat(5);
            Ingredients ig = new Ingredients(idIngredients , nomIngredients  , quantite  , unite , prix  );
            allIngredients.add(ig);
        }
        // co.close();
        // stmt.close();
        return allIngredients;

    }

public static String produitIngredient (String produitName , String ingredientName   , Connection connex) throws SQLException {
    String  resp  = "<table>";
    resp +="<tr>"  ;
    resp += "<th>Produit</th>";
    resp += "<th>Ingredient</th>";
    resp+= "</tr>";

    PreparedStatement st = null;
    ResultSet res = null;
    Ingredients ingredient = null;
    Boolean creatingConn = false;
    try {
        if (connex == null) {
            creatingConn = true;
        }
        String sql = "SELECT * FROM getIngredientByFab WHERE nomingredients='"+ingredientName+"' and nomproduit= '"+produitName+"'";
        st = connex.prepareStatement(sql);
        res = st.executeQuery();

        if (res.next()) {
            ingredient = new Ingredients();
            String nomIngredients = res.getString(1);
            String nomProduits = res.getString(2);
            resp+= "<tr>";
            resp +="<td>" + nomProduits + "</td>";
            resp +="<td>" + nomIngredients + "</td>";
            resp+="</tr>";
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (res != null)
            res.close();
        if (st != null)
            st.close();
        if (creatingConn)
            connex.close();
    }
    resp +="</table>";
    return resp;
}       
    public static Ingredients getById(Connection connex, int id) throws SQLException {
        PreparedStatement st = null;
        ResultSet res = null;
        Ingredients ingredient = null;
        Boolean creatingConn = false;
        try {
            if (connex == null) {
                creatingConn = true;
            }
            String sql = "SELECT * FROM ingredients WHERE id = ?";
            st = connex.prepareStatement(sql);
            st.setInt(1, id);
            res = st.executeQuery();
            if (res.next()) {
                ingredient = new Ingredients();
                int idIngredients = res.getInt(1);
                String nomIngredients = res.getString(2);
                float quantite = res.getFloat(3);
                String unite = res.getString(4);
                float prix = res.getFloat(5);
                 ingredient = new Ingredients(idIngredients , nomIngredients  , quantite  , unite , prix  );
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (res != null)
                res.close();
            if (st != null)
                st.close();
            if (creatingConn)
                connex.close();
        }
        return ingredient;
    }

}