<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="BeanPackage.UserBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="SQLPackage.SQLConnector" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>UserFriend Result</title>

    <!-- Custom fonts for this template -->
    <link href="../bootstrap/sb2/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../bootstrap/sb2/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="../bootstrap/sb2/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    
	<script>
		function process() {
		  document.getElementById("hidden").value = document.getElementById("content").value;
		  return true;
		}
	</script>
    

</head>

<body id="page-top">
	
							
							<% UserBean current_user = (UserBean) session.getAttribute("current_user") ;%>
							<% SQLConnector sc = new SQLConnector(); %>
				     	  	<% String str = Integer.toString(current_user.getId()); %>
				     	  	<%  HashMap<Integer, ArrayList<Object>> ajout = new HashMap<Integer, ArrayList<Object>>();  %>
				     	  	<% ajout = sc.CountNotificationReceived(str); %>	
				     	  	<% int taille = ajout.size(); %>
				     	  		
				     	  	
					     	
					     	<%  HashMap<Integer, ArrayList<Object>> mapnotif = new HashMap<Integer, ArrayList<Object>>();  %>
					     	<% mapnotif = sc.getUserCovidNotification(String.valueOf(current_user.getId())); %>
					     	
					     	<% int taille2 = mapnotif.size(); %>
		
				     	  
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                <div class="sidebar-brand-icon ">
                	<i class="fas fa-shield-virus"></i>
                </div>
                <div class="sidebar-brand-text mx-3">DefeatCovid </div>
            </a>

            
            
            <!-- Divider -->
            <hr class="sidebar-divider my-0">
			
            <!-- Nav Item - Dashboard -->
            <li class="nav-item ">
                <a class="nav-link" href="logged.jsp">
                    <i class="fas fa-home" ></i>
                    <span>Home</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">
            
            <!-- Nav Item - Dashboard -->
            <li class="nav-item ">
                <a class="nav-link" href="userprofile.jsp">
                    <i class="far fa-address-card"></i>
                    <span>Profile</span></a>
            </li>
            
            <!-- Divider -->
            <hr class="sidebar-divider my-0">
            
            <!-- Nav Item - Dashboard -->
            <li class="nav-item ">
                <a class="nav-link" href="userfriends.jsp">
                    <i class="fas fa-user-friends"></i>
                    <span>Amis</span></a>
            </li>
            
            
            

			<hr class="sidebar-divider">
			
			

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <form class="form-inline">
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                    </form>

                    

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <!-- Nav Item - Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                <!-- Counter - Alerts -->
                                <span class="badge badge-danger badge-counter"><% out.println(taille2); %></span>
                            </a>
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    Alerts Center
                                </h6>
                                
                                <% for(HashMap.Entry<Integer, ArrayList<Object>> entry : mapnotif.entrySet()) {
				     	  		
				     	  		out.println("<a class=\"dropdown-item d-flex align-items-center\" href=\"#\">");
				     	  		out.println("<div class=\"mr-3\">");
				     	  		out.println("<div class=\"icon-circle bg-danger\">");
				     	  		out.println("<i class=\"fas fa-file-alt text-white\"></i>");
				     	  		out.println(" </div>");
				     	  		out.println(" </div>");
				     	  		out.println("<div>");
				     	  		out.println("<span class=\"font-weight-bold\">"+entry.getValue().get(0)+" "+entry.getValue().get(1)+" est atteint du covid</span>");
				     	  		out.println("</div>");
				     	  		out.println("</a>");
				     	  		
				     	  		
				     	  		
				     	  		}%>
                                
                                <a class="dropdown-item text-center small " href="logged.jsp">Afficher toutes les notifications</a>
                            </div>
                        </li>
                        
                        
                        
                        
                        

                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>
                                <!-- Counter - Messages -->
                                <span class="badge badge-danger badge-counter"><% out.println(taille); %></span>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">
                                    Message Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_1.svg"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div class="font-weight-bold">
                                        <div class="text-truncate">Hi there! I am wondering if you can help me with a
                                            problem I've been having.</div>
                                        <div class="small text-gray-500">Emily Fowler ?? 58m</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_2.svg"
                                            alt="...">
                                        <div class="status-indicator"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">I have the photos that you ordered last month, how
                                            would you like them sent to you?</div>
                                        <div class="small text-gray-500">Jae Chun ?? 1d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_3.svg"
                                            alt="...">
                                        <div class="status-indicator bg-warning"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Last month's report looks great, I am very happy with
                                            the progress so far, keep up the good work!</div>
                                        <div class="small text-gray-500">Morgan Alvarez ?? 2d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Am I a good boy? The reason I ask is because someone
                                            told me that people say this to all dogs, even if they aren't good...</div>
                                        <div class="small text-gray-500">Chicken the Dog ?? 2w</div>
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                            </div>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><% out.print(current_user.getNom()); %> <% out.print(current_user.getPrenom()); %></span>
                                <img class="img-profile rounded-circle"
                                    src="../bootstrap/sb2/img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Resultat de la recherche d'amis :</h1>
                    
                    
					
					
					<div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Utilisateurs trouv??s</h6>
                        </div>
                        <div class="card-body">
                            <div class=>
                                <table class="table table-bordered" id="dataTableadminfriend" width="100%" cellspacing="0">
                                      
                                    <thead>
                                        <tr>
                                            <th>UserID</th>
                                            <th>Nom</th>
                                            <th>Prenom</th>
                                            <th>Ajouter</th>
                                           
                                        </tr>
                                    </thead>
                                   
                                                               <%  
									HashMap<Integer, ArrayList<Object>> utilisateurs = new HashMap<Integer, ArrayList<Object>>();  
									utilisateurs = (HashMap<Integer, ArrayList<Object>>) session.getAttribute("utilisateurs") ;
								
								
									if(utilisateurs.size() == 0){
										System.out.println("arraylist nulle");
									}else{
										
										out.println("<tbody>");
										int i = 0;
										int taillemap = utilisateurs.size();
										
										out.println("<input type=\"hidden\" id=\"taillemap\" name=\"taillemap\" value='"+taillemap+"'\">");
										for (HashMap.Entry<Integer, ArrayList<Object>> entry : utilisateurs.entrySet()) {
										    
											
											out.println("<tr>");
											
											out.println("<td>");
										    out.println(entry.getKey()); 
										    out.println("</td>");
										   
										    out.println("<td>");
										    out.println(entry.getValue().get(0)); 
										    out.println("</td>");
										    
										    out.println("<td>");
										    out.println(entry.getValue().get(1)); 
										    out.println("</td>");
										    
										    
										    out.println("<td style=\"width:15%\">");
										   
										    out.println("<form method=\"post\" id=formadfriend"+i+" class=\"user\" action=\"../addfriendservlet\">");
										    out.println("<div class=\" row\">");
										    out.println("<div class=\"col-sm-12 mb-3 mb-sm-0\">");
										    out.println("<input type=\"hidden\" name=\"idreceive[]\" id=\"idreceive\" value='"+entry.getKey()+"'\">");
										    out.println("<button \"  type=\"submit\" class=\"btn btn-success btn-user btn-block\" id=\"btn-show-toast"+i+"\"> Rajouter cette personne </button>");
										    out.println("<div id=\"toast"+i+"\"></div>");
										    out.println("</div>");
										    out.println("</div>");
										    out.println("</form>");
										    
										    out.println("</td>");
										    
										   
										   out.println("<script>document.addEventListener(\"DOMContentLoaded\", () => { let hasTime = null; ");
										   out.println("document.querySelector('#btn-show-toast"+i+"').addEventListener('click', (e) => {"); 
										   out.println("const toaster = document.querySelector('#toast"+i+"');"); 	    
										   out.println("toaster.innerText = \" La notification a ??t?? envoy??e! \";");
										   out.println("toaster.classList.add('active');"); 
										   out.println("if(hasTime != null) { clearTimeout(hasTime); } ");
										   out.println("hasTime = setTimeout(function() { toaster.classList.remove('active'); }, 2000); }); });</script> ");
										    	
										    /**
										    out.println("</tr>");
										   
										    out.println("<div class=\"toast\" id=\"toastBasic"+String.valueOf(i)+"\" role=\"alert\" aria-live=\"assertive\" aria-atomic=\"true\" data-bs-delay=\"3000\">");
										    out.println("<div class=\"toast-header\">");
										    out.println("<i data-feather=\"bell\"></i>");
										    out.println("<strong class=\"mr-auto\">Toast with Autohide</strong>");
										    
										    out.println("<small class=\"text-muted ml-2\">just now</small>");
										    out.println("<button class=\"ml-2 mb-1 btn-close\" type=\"button\" data-bs-dismiss=\"toast\" aria-label=\"Close\"></button>");
										    out.println("</div>");
										    out.println("<div class=\"toast-body\">This is an example toast alert, it will dismiss automatically, or you can dismiss it manually.</div>");
										    out.println("</div>");
									    
										     out.println("<script>");
										     out.println(" $(\""+i+"\").on(\"click\", function(e) { e.preventDefault(); $(\"#toastBasic"+String.valueOf(i)+"\").toast(\"show\");});");  
											 out.println("</script>");
											    
												**/   
											i = i+1;
										}
										
									
										out.println("</tbody>");
										
									}
								
								%>
												
									
									
				          			
                                    
                                </table>
                            </div>
                        </div>
                    </div>
					
								    
					
					
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">??</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="../bootstrap/sb2/vendor/jquery/jquery.min.js"></script>
    <script src="../bootstrap/sb2/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../bootstrap/sb2/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../bootstrap/sb2/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="../bootstrap/sb2/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="../bootstrap/sb2/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="../bootstrap/sb2/js/demo/datatables-demo.js"></script>
   
</body>

</html>