<%@page import="java.util.Vector"%>
<%@page import="java.util.HashMap"%>
<%@page import="model.Produit"%>
<%@page import="model.Ingredients"%>


<% 
    Vector<Produit> produits= (Vector<Produit>) request.getAttribute("produits"); 
    Vector<Ingredients> ingredients= (Vector<Ingredients>) request.getAttribute("ingredients"); 
    String produitIngredient  = request.getAttribute("produitIngredient").toString(); 
%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <title>Boulangerie</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <link rel="icon" href="images/fevicon.png" type="image/png" />
      <link rel="stylesheet" href="./assets/css/bootstrap.min.css" />
       <link rel="stylesheet" href="./assets/css/ListeFabrication.css">
      <link rel="stylesheet" href="./assets/style.css" />
      <link rel="stylesheet" href="./assets/css/responsive.css" />
      <link rel="stylesheet" href="./assets/css/colors.css" />
      <link rel="stylesheet" href="./assets/css/bootstrap-select.css" />
      <link rel="stylesheet" href="./assets/css/perfect-scrollbar.css" />
      <link rel="stylesheet" href="./assets/css/custom.css" />
   </head>
   <body class="dashboard dashboard_1">
      <div class="full_container">
         <div class="inner_container">
            <nav id="sidebar">
               <div class="sidebar_blog_1">
                  <div class="sidebar_user_info">
                     <div class="icon_setting"></div>
                     <div class="user_profle_side">
                        <div class="user_img"><img class="img-responsive" src="images/layout_img/user_img.jpg" alt="#" /></div>
                        <div class="user_info">
                           <h6>Admin</h6>
                           <p><span class="online_animation"></span> Online</p>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="sidebar_blog_2">
                  <h4>General</h4>
                  <ul class="list-unstyled components">
                     <li><a href="./FabricationController"><i class="fa fa-cog yellow_color"></i> <span>Fabrication</span></a></li>
                  </ul>
                  <ul class="list-unstyled components">
                     <li><a href="charts.html"><i class="fa fa-bar-chart-o green_color"></i> <span>Charts</span></a></li>
                  </ul>
               </div>
               
            </nav>
            <div id="content">
               <div class="topbar">
                  <nav class="navbar navbar-expand-lg navbar-light">
                     <div class="full">
                        <button type="button" id="sidebarCollapse" class="sidebar_toggle"><i class="fa fa-bars"></i></button>
                        <div class="logo_section">
                        </div>
                        <div class="right_topbar">
                           <div class="icon_info">
                              <ul>
                                 <li><a href="#"><i class="fa fa-bell-o"></i><span class="badge">2</span></a></li>
                                 <li><a href="#"><i class="fa fa-question-circle"></i></a></li>
                                 <li><a href="#"><i class="fa fa-envelope-o"></i><span class="badge">3</span></a></li>
                              </ul>
                              <ul class="user_profile_dd">
                                 <li>
                                    <a class="dropdown-toggle" data-toggle="dropdown"><img class="img-responsive rounded-circle" src="images/layout_img/user_img.jpg" alt="#" /><span class="name_user">John David</span></a>
                                    <div class="dropdown-menu">
                                       <a class="dropdown-item" href="profile.html">My Profile</a>
                                       <a class="dropdown-item" href="settings.html">Settings</a>
                                       <a class="dropdown-item" href="help.html">Help</a>
                                       <a class="dropdown-item" href="#"><span>Log Out</span> <i class="fa fa-sign-out"></i></a>
                                    </div>
                                 </li>
                              </ul>
                           </div>
                        </div>
                     </div>
                  </nav>
               </div>
               <div class="midde_cont">
                  <div class="container-fluid">
                     <div class="row column_title">
                        <div class="col-md-12">
                           <div class="page_title">
                              <h2>Dashboard</h2>
                           </div>
                        </div>
                     </div>
                      <div class="container">
        <form action="./ProduitIngredient" >
            <div class="form-group">
                <label for="select1">Produits</label>
                <select id="select1" name="produit">
                    <%  
                    for (int i  = 0 ; i < produits.size() ; i++){ %>
                        <option value="<%= produits.get(i).getNom()  %>"><%= produits.get(i).getNom()  %></option>
                <%    }
                    %>
                </select>
            </div>
            <div class="form-group">
                <label for="select2">Ingredients</label>
                <select id="select2" name="ingredient">
                     <%  
                    for (int i  = 0 ; i < ingredients.size() ; i++){ %>
                        <option value="<%= ingredients.get(i).getNomIngredients()  %>"><%= ingredients.get(i).getNomIngredients()  %></option>
                <%    }
                    %>
                </select>
            </div>
            <button type="submit" class="submit-btn">Voir</button>
        </form>
        <%= produitIngredient  %>
    </div>
    <br>    

      <script src="./assets/js/jquery.min.js"></script>
      <script src="./assets/js/popper.min.js"></script>
      <script src="./assets/js/bootstrap.min.js"></script>
     
      <script src="./assets/js/animate.js"></script>
     
      <script src="./assets/js/bootstrap-select.js"></script>
      <script src="./assets/js/owl.carousel.js"></script> 
      <script src="./assets/js/Chart.min.js"></script>
      <script src="./assets/js/Chart.bundle.min.js"></script>
      <script src="./assets/js/utils.js"></script>
      <script src="./assets/js/analyser.js"></script>
      <script src="./assets/js/perfect-scrollbar.min.js"></script>
      <script>
         var ps = new PerfectScrollbar('#sidebar');
      </script>
      <script src="./assets/js/custom.js"></script>
      <script src="./assets/js/chart_custom_style1.js"></script>
   </body>
</html>