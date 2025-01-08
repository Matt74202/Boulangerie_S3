 package model;
 import java.sql.Connection;
 import java.sql.DriverManager;
 public class Connect {
      public Connect(){}
      public Connection connect(){
          Connection co = null;
         try {
             Class.forName("org.postgresql.Driver");
             co = DriverManager.getConnection("jdbc:postgresql://localhost:5432/boulangerie","postgres","itu16");
         } catch (Exception e) {e.printStackTrace();
         }		
         if (co==null) {
             System.out.println("tsy mety");
         }
         return co;
     }
 }
 