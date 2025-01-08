<%-- 
    Document   : huhu
    Created on : 7 janv. 2025, 10:45:36
    Author     : Matthew
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
<div class="col-md-6 col-lg-3">
                            <form method="post" action="./ListeProduit">
                                 <% for(int i=0; i<produits.size(); i++){ %>
                           <div class="full counter_section margin_bottom_30">
                              
                         
                              <div class="couter_icon">
                                 <div> 
                                    <i class="fa fa-user yellow_color"></i>
                                 </div>
                              </div>
                              <div class="counter_no">
                                 <div>
                                    <p><%= produits.get(i).getNom() %></p>
                                    <p><%= produits.get(i).getQuantite() %></p>
                                    <p><%= produits.get(i).getPrixVente() %></p>
                                 </div>
                                  <%  } %>
                              </div>
                           </div>
                        </div>