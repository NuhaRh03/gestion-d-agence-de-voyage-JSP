<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"> </style>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Boxicons CSS -->
    <link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">

    <!-- jQuery -->
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
    justify-content: center; /* Horizontally center */
    align-items: center; /* Vertically center */
    height: 100vh; /* Adjust height as needed */
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


    <title>Interface voyage</title>
</head>

<body id="body-pd">
    <header class="header" id="header">
        <div class="header_img"> <img src="images\NIN travel.png" alt=""> </div>
    </header>
    <div class="l-navbar" id="nav-bar">
        <nav class="nav">
            <div>
                <a href="#" class="nav_logo"> <i class='bx bx-layer nav_logo-icon'></i> <span class="nav_logo-name">BBBootstrap</span> </a>
                <div class="nav_list">
                        <a href="#" class="nav_link active "> <i class='bx bx-grid-alt nav_icon'></i> <span class="nav_name">VOYAGEUR</span> </a>
                        <a href="#" class="nav_link "> <i class='bx bx-user nav_icon'></i> <span class="nav_name">Users</span> </a>
                        <a href="#" class="nav_link"> <i class='bx bx-message-square-detail nav_icon'></i> <span class="nav_name">Messages</span> </a>
                        <a href="#" class="nav_link"> <i class='bx bx-bookmark nav_icon'></i> <span class="nav_name">ListeDesVoyageur</span> </a>
                        <a href="#" class="nav_link"> <i class='bx bx-folder nav_icon'></i> <span class="nav_name">Files</span> </a>
                        <a href="#" class="nav_link"> <i class='bx bx-bar-chart-alt-2 nav_icon'></i> <span class="nav_name">Stats</span> </a>
                    </div>
            </div>
            <a href="#" class="nav_link"> <i class='bx bx-log-out nav_icon'></i> <span class="nav_name">SignOut</span> </a>
        </nav>
    </div>
   <!--Container Main start-->
<div style="text-align: center;">
    <h1>Voyage Management</h1>
</div>
<div class="height-100 bg-light">
    <form class="row g-3 needs-validation" action="VoyageServlet" method="post" novalidate>
        <div class="col-md-4">
            <label for="id" class="form-label">N'Voyage</label>
            <input type="number" class="form-control" id="id" name="id" required>
            <div class="valid-feedback">
                Looks good!
            </div>
        </div>
        <div class="col-md-4">
            <label for="date_depart" class="form-label">Date Depart</label>
            <input type="date" class="form-control" id="date_depart" name="date_depart" required>
            <div class="valid-feedback">
                Looks good!
            </div>
        </div>
        <div class="col-md-4">
            <label for="date_retour" class="form-label">Date Retour</label>
            <input type="date" class="form-control" id="date_retour" name="date_retour" required>
            <div class="valid-feedback">
                Looks good!
            </div>
        </div>
        <div class="col-md-4">
            <label for="nb_places" class="form-label">Nombre des Places</label>
            <div class="input-group has-validation">
                <input type="int" class="form-control" id="nb_places" name="nb_places" aria-describedby="inputGroupPrepend" required>
                <div class="invalid-feedback">
                    Entrez le Nombre des Places.
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <label for="hotel" class="form-label">Nom de l'hotel</label>
            <input type="text" class="form-control" id="hotel" name="hotel" required>
            <div class="invalid-feedback">
                Entrez un nom d'hotel.
            </div>
        </div>
        <div class="col-md-4">
            <label for="typev" class="form-label">Type de Voyage</label>
            <select class="form-select" id="typev" name="typev" required>
                <option selected disabled value="">Choisir...</option>
                <option>Aumra</option>
                <option>Turkie</option>
                <option>Organise</option>
            </select>
            <div class="invalid-feedback">
                Veuillez choisir un type de voyage valide.
            </div>
        </div>
        <div class="col-md-4">
            <label for="moy_transport" class="form-label">Moyenne de Transport</label>
            <input type="text" class="form-control" id="moy_transport" name="moy_transport" required>
            <div class="invalid-feedback">
                Entrez une moyenne de transport.
            </div>
        </div>
        <div class="col-12">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                <label class="form-check-label" for="invalidCheck">
                    Accepter les conditions
                </label>
                <div class="invalid-feedback">
                    Vous devez accepter avant l'envoi.
                </div>
            </div>
        </div>
        <div class="col-12">
            <button class="btn btn-primary" type="submit">Ajouter Voyage</button>
        </div>
    </form>
</div>

    <!--Container Main end-->
    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function(event) {
               
            const showNavbar = (toggleId, navId, bodyId, headerId) =>{
            const toggle = document.getElementById(toggleId),
            nav = document.getElementById(navId),
            bodypd = document.getElementById(bodyId),
            headerpd = document.getElementById(headerId)
    
            // Validate that all variables exist
            if(toggle && nav && bodypd && headerpd){
            toggle.addEventListener('click', ()=>{
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
    
            showNavbar('header-toggle','nav-bar','body-pd','header')
    
            /===== LINK ACTIVE =====/
            const linkColor = document.querySelectorAll('.nav_link')
    
            function colorLink(){
            if(linkColor){
            linkColor.forEach(l=> l.classList.remove('active'))
            this.classList.add('active')
            }
            }
            linkColor.forEach( l=> l.addEventListener('click', colorLink))
    
             // Your code to run since DOM is loaded and ready
            });
        </script>
</body>

</html>