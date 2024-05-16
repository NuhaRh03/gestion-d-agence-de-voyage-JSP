<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.Voyageur" %>



            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"> </style>

                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap">

                <!-- Boxicons CSS -->
                <link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">

                <!-- jQuery -->
                <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
                <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
                <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
                <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

                <!-- Bootstrap Bundle (JS) -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
                <style>
                     :root {
                        --header-height: 3rem;
                        --nav-width: 68px;
                        --first-color: #4723D9;
                        --first-color-light: #AFA5D9;
                        --white-color: #F7F6FB;
                        --body-font: 'Nunito', sans-serif;
                        --normal-font-size: 1rem;
                        --z-fixed: 100
                    }
                    
                    *,
                     ::before,
                     ::after {
                        box-sizing: border-box
                    }
                    
                    body {
                        position: relative;
                        margin: var(--header-height) 0 0 0;
                        padding: 0 1rem;
                        font-family: var(--body-font);
                        font-size: var(--normal-font-size);
                        transition: .5s
                    }
                    
                    a {
                        text-decoration: none
                    }
                    
                    .header {
                        width: 100%;
                        height: var(--header-height);
                        position: fixed;
                        top: 0;
                        left: 0;
                        display: flex;
                        align-items: center;
                        justify-content: space-between;
                        padding: 0 1rem;
                        background-color: var(--white-color);
                        z-index: var(--z-fixed);
                        transition: .5s
                    }
                    
                    .header_toggle {
                        color: var(--first-color);
                        font-size: 1.5rem;
                        cursor: pointer
                    }
                    
                    .header_img {
                        width: 35px;
                        height: 35px;
                        display: flex;
                        justify-content: center;
                        border-radius: 50%;
                        overflow: hidden
                    }
                    
                    .header_img img {
                        width: 40px
                    }
                    
                    .l-navbar {
                        position: fixed;
                        top: 0;
                        left: -30%;
                        width: var(--nav-width);
                        height: 100vh;
                        background-color: var(--first-color);
                        padding: .5rem 1rem 0 0;
                        transition: .5s;
                        z-index: var(--z-fixed)
                    }
                    
                    .nav {
                        height: 100%;
                        display: flex;
                        flex-direction: column;
                        justify-content: space-between;
                        overflow: hidden
                    }
                    
                    .nav_logo,
                    .nav_link {
                        display: grid;
                        grid-template-columns: max-content max-content;
                        align-items: center;
                        column-gap: 1rem;
                        padding: .5rem 0 .5rem 1.5rem
                    }
                    
                    .nav_logo {
                        margin-bottom: 2rem
                    }
                    
                    .nav_logo-icon {
                        font-size: 1.25rem;
                        color: var(--white-color)
                    }
                    
                    .nav_logo-name {
                        color: var(--white-color);
                        font-weight: 700
                    }
                    
                    .nav_link {
                        position: relative;
                        color: var(--first-color-light);
                        margin-bottom: 1.5rem;
                        transition: .3s
                    }
                    
                    .nav_link:hover {
                        color: var(--white-color)
                    }
                    
                    .nav_icon {
                        font-size: 1.25rem
                    }
                    
                    .show {
                        left: 0
                    }
                    
                    .body-pd {
                        padding-left: calc(var(--nav-width) + 1rem)
                    }
                    
                    .active {
                        color: var(--white-color)
                    }
                    
                    .active::before {
                        content: '';
                        position: absolute;
                        left: 0;
                        width: 2px;
                        height: 32px;
                        background-color: var(--white-color)
                    }
                    
                    .height-100 {
                        display: flex;
                        justify-content: center;
                        /* Vertically center */
                        height: 100vh;
                        /* Adjust height as needed */
                        padding: 100px;
                    }
                    
                    @media screen and (min-width: 768px) {
                        body {
                            margin: calc(var(--header-height) + 1rem) 0 0 0;
                            padding-left: calc(var(--nav-width) + 2rem)
                        }
                        .header {
                            height: calc(var(--header-height) + 1rem);
                            padding: 0 2rem 0 calc(var(--nav-width) + 2rem)
                        }
                        .header_img {
                            width: 40px;
                            height: 40px
                        }
                        .header_img img {
                            width: 45px
                        }
                        .l-navbar {
                            left: 0;
                            padding: 1rem 1rem 0 0
                        }
                        .show {
                            width: calc(var(--nav-width) + 156px)
                        }
                        .body-pd {
                            padding-left: calc(var(--nav-width) + 188px)
                        }
                    }
                </style>


                <title>Voyageur</title>
            </head>

            <body id="body-pd">
                <header class="header" id="header">
                    <div class="header_toggle"> <i class='bx bx-menu' id="header-toggle"></i> </div>
                    <div class="header_img"> <img src="images\NIN travel.png" alt=""> </div>
                </header>
                <div class="l-navbar" id="nav-bar">
                    <nav class="nav">

                        <div>
                            <a href="#" class="nav_logo"> <i class='bx bx-layer nav_logo-icon'></i> <span class="nav_logo-name">Menu Tableau de Bord</span> </a>
                            <div class="nav_list">
                                <a href="#" class="nav_link "> <i class='bx bx-world nav_icon'></i> <span class="nav_name">Ajouter Voyage</span> </a>
                                <a href="#" class="nav_link "> <i class='bx bx-group nav_icon'></i> <span class="nav_name">Ajouter Voyageur</span> </a>
                                <a href="#" class="nav_link active"> <i class='bx bx-user-plus nav_icon'></i> <span class="nav_name">Ajouter Moderateur</span> </a>
                                <a href="#" class="nav_link"> <i class='bx bx-map-pin nav_icon'></i> <span class="nav_name">Afficher Voyage </span> </a>
                                <a href="#" class="nav_link"> <i class='bx bx-briefcase nav_icon'></i> <span class="nav_name">Afficher Voyageur</span> </a>
                                <a href="#" class="nav_link"> <i class='bx bx-list-ul nav_icon'></i> <span class="nav_name">Afficher Moderateur</span> </a>
                                <a href="#" class="nav_link"> <i class='bx bx-search nav_icon'></i> <span class="nav_name">Chercher Voyageur</span> </a>
                            </div>
                        </div>
                        <a href="#" class="nav_link"> <i class='bx bx-log-out nav_icon'></i> <span class="nav_name">SignOut</span> </a>
                    </nav>
                </div>
                <!--Container Main start-->
                <div class="height-100 bg-light">

                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">

                                <h4>Liste des Moderateurs</h4>
                                <div class="btn" float: right;>
                                    <button type="button" class="btn btn-primary">ajouter </button>
                                    <button type="button" class="btn btn-secondary">modifier</button>
                                    <button type="button" class="btn btn-success">afichier</button>
                                    <button type="button" class="btn btn-danger">suprimmer</button>
                                    <button type="button" class="btn btn-warning">Warning</button>
                                    <button type="button" class="btn btn-info">Info</button>
                                    <br>
                                </div>
                                <h2>All Voyages</h2>
                                <table id="mytable" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th>num voyageur</th>
                                            <th>Nom</th>
                                            <th>Prénom</th>
                                            <th>Passport</th>
                                            <th>Email</th>
                                            <th>Id Voyage</th>
                                            <th>Téléphone</th>
                                            <th>Modifier</th>
                                            <th>Suprimmer</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% 
                                    // Retrieve data from the database
                                    try {
                                        // Connect to the database
                                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8080/agancevoyage", "root", "221086@Nouha");
                                        
                                        // Query to select all voyageurs
                                        String query = "SELECT * FROM voyageur";
                                        PreparedStatement pstmt = conn.prepareStatement(query);
                                        ResultSet rs = pstmt.executeQuery();
                    
                                        // Iterate through the result set and display each voyageur
                                        while (rs.next()) {
                                            int id = rs.getInt("id");
                                            String nom = rs.getString("nom");
                                            String prenom = rs.getString("prenom");
                                            String passport = rs.getString("passport");
                                            String email = rs.getString("email");
                                            int id_voyage = rs.getInt("id_voyage");
                                            String tele = rs.getString("tele");
                                            
                    
                                            // Create a Voyageur object
                                            Voyageur voyageur = new Voyageur( id,nom, prenom, passport, email, id_voyage, tele);
                                %>
                                            <tr>
                                                <td>
                                                    <%= voyageur.getId() %>
                                                </td>

                                                <td>
                                                    <%= voyageur.getNom() %>
                                                </td>
                                                <td>
                                                    <%= voyageur.getPrenom() %>
                                                </td>
                                                <td>
                                                    <%= voyageur.getPassport() %>
                                                </td>
                                                <td>
                                                    <%= voyageur.getEmail() %>
                                                </td>
                                                <td>
                                                    <%= voyageur.getId_voyage() %>
                                                </td>
                                                <td>
                                                    <%= voyageur.getTele() %>
                                                </td>
                                                <td>
                                                    <p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit"><span class="glyphicon glyphicon-pencil"></span></button></p>
                                                </td>
                                                <td>
                                                    <p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs delete-row" data-title="Delete" data-toggle="modal" data-target="#delete"><span class="glyphicon glyphicon-trash"></span></button></p>
                                                </td>
                                            </tr>
                                            <% 
                                        }
                                        // Close the database connections
                                        rs.close();
                                        pstmt.close();
                                        conn.close();
                                    } catch (SQLException e) {
                                        e.printStackTrace();
                                    }
                                %>
                                    </tbody>
                                </table>
                            </div>
                            <div class="clearfix"></div>
                            <ul class="pagination pull-right">
                                <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
                                <li class="active"><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                </div>

                <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
                    <!-- Modal content removed -->
                </div>

                <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
                    <!-- Modal content removed -->
                </div>


                </div>
                <script>
                    $(document).ready(function() {
                        // Add event listener to delete button
                        $('.delete-row').click(function() {
                            // Get the parent row and remove it
                            $(this).closest('tr').remove();
                        });
                    });
                </script>
                <script type="text/javascript">
                    document.addEventListener("DOMContentLoaded", function(event) {

                        const showNavbar = (toggleId, navId, bodyId, headerId) => {
                            const toggle = document.getElementById(toggleId),
                                nav = document.getElementById(navId),
                                bodypd = document.getElementById(bodyId),
                                headerpd = document.getElementById(headerId)

                            // Validate that all variables exist
                            if (toggle && nav && bodypd && headerpd) {
                                toggle.addEventListener('click', () => {
                                    // show navbar
                                    nav.classList.toggle('show')
                                        // change icon
                                    toggle.classList.toggle('bx-x')
                                        // add padding to body
                                    bodypd.classList.toggle('body-pd')
                                        // add padding to header
                                    headerpd.classList.toggle('body-pd')
                                })
                            }
                        }

                        showNavbar('header-toggle', 'nav-bar', 'body-pd', 'header')

                        const linkColor = document.querySelectorAll('.nav_link')

                        function colorLink() {
                            if (linkColor) {
                                linkColor.forEach(l => l.classList.remove('active'))
                                this.classList.add('active')
                            }
                        }
                        linkColor.forEach(l => l.addEventListener('click', colorLink))


                    });
                </script>

            </body>

            </html>