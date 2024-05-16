<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        /* Your CSS styles here */
        /* Change color for all h elements */
        h1, h2, h3, h4, h5, h6 {
            color: rgb(8, 8, 8); /* Change this to the color you want */
        }
        
        /* Change color for all p elements */
        p {
            color: rgb(9, 9, 9); /* Change this to the color you want */
        }
    </style>
</head>

<body>

    <section class="h-100 gradient-form" style="background-color: #eee;">
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-xl-10">
                    <div class="card rounded-3 text-black">
                        <div class="row g-0">
                            <div class="col-lg-6">
                                <div class="card-body p-md-5 mx-md-4">

                                    <div class="text-center">
                                        <img src="images/NIN travel.png" style="width: 300px;" alt="logo">
                                        
                                    </div>

                                    <form action="ServletLogin" method="post">
                                        <p>Veuillez vous connecter à votre compte</p>

                                        <div data-mdb-input-init class="form-outline mb-4">
                                            <input type="text" id="form2Example11" name="username" class="form-control" placeholder="Entrer votre Username" />
                                            <label class="form-label" for="form2Example11">Username</label>
                                        </div>

                                        <div data-mdb-input-init class="form-outline mb-4">
                                            <input type="password" id="form2Example22" name="password" class="form-control" placeholder="Enterer votre password" />
                                            <label class="form-label" for="form2Example22">Password</label>
                                        </div>

                                        <div class="text-center pt-1 mb-5 pb-1">
                                            <button data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3" type="submit">se connecter</button>
                                           
                                        </div>



                                    </form>

                                </div>
                            </div>
                            <div class="col-lg-6 d-flex align-items-center gradient-custom-2">
                                <div class="text-white px-3 py-4 p-md-5 mx-md-4">
                                    <h4 class="mb-4">Nous sommes plus qu'une simple agencce de voyage</h4>
                                    <p class="small mb-0">Nous sommes une agence de voyage passionnée par la création d'expériences uniques et inoubliables pour nos clients. Que ce soit pour des escapades urbaines, des voyages d'aventure en pleine nature, des séjours culturels ou des vacances en famille, nous mettons tout en œuvre pour répondre aux besoins et aux aspirations de chacun de nos voyageurs.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
   
</body>
</html>
    