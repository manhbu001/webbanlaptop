<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!------ Include the above in your HEAD tag ---------->

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.1.0/mdb.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link href="./css/style.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    </head>
    <body>
        <!-- MDB -->
        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.1.0/mdb.umd.min.js">
        </script>

        
<div class="w3-bar w3-black" style="display: flex; align-items: center; justify-content: space-between;">
    <div style="display: flex; align-items: center;">
        <a href="https://media.discordapp.net/attachments/1153292530796986378/1379381560037343242/Gemini_Generated_Image_wczmutwczmutwczm.png?ex=684008af&is=683eb72f&hm=d0252b4c23149b8ccd34b0b805f7f468b5d2eafa139a0ebb538e5eadf7036ee4&=&format=webp&quality=lossless" class="w3-bar-item w3-button w3-mobile">
            <img src="https://media.discordapp.net/attachments/1153292530796986378/1379381560037343242/Gemini_Generated_Image_wczmutwczmutwczm.png?ex=684008af&is=683eb72f&hm=d0252b4c23149b8ccd34b0b805f7f468b5d2eafa139a0ebb538e5eadf7036ee4&=&format=webp&quality=lossless" alt="Logo" style="height:30px; vertical-align:middle; margin-right:5px;">
        </a>
        <a href="Home.jsp" class="w3-bar-item w3-button w3-mobile w3-green">Home</a>

        <c:if test="${sessionScope.acc.isSell == 1}">
            <a href="managerProduct" class="w3-bar-item w3-button">Quản lý sản phẩm</a>
        </c:if>
        <c:if test="${sessionScope.acc.isAdmin == 1}">
            <a href="#" class="w3-bar-item w3-button" target="blank">Quản lý tài khoản</a>
        </c:if>

        <c:if test="${sessionScope.acc.isAdmin == 1}">
            <a href="manageOrders.jsp" class="w3-bar-item w3-button">Quản lý đơn hàng</a>
        </c:if>    
            
        <c:if test ="${sessionScope.acc != null}">
            <a href="logout" class="w3-bar-item w3-button">Đăng xuất</a>
            <a href="#" class="w3-bar-item w3-button">Xin chào ${sessionScope.acc.user}</a>
        </c:if>
        <c:if test="${sessionScope.acc == null}">
            <a href="login" class="w3-bar-item w3-button">Đăng nhập</a>
        </c:if>
        <!-- Search -->
        <form class="d-flex input-group w3-bar-item" style="width: 300px;" action="search" method="get" name="myformsearch" onsubmit="return validateForm()">
            <input name="txt" type="text" class="form-control w3-input w3-sand" placeholder="Nhập sản phẩm cần tìm" />
            <button id="MyBtn" class="btn btn-outline-primary" type="submit">Tìm kiếm</button>
        </form>
    </div>

    <!-- View Cart bên phải -->
    <a href="./view-cart.jsp" class="w3-bar-item w3-button" title="View Cart">
        <i class="fas fa-shopping-cart"></i>
    </a>

</div>
        
        
        
        <!-- carousel -->
        <div id="carouselExampleCaptions" class="carousel slide carousel-fade" data-mdb-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-mdb-target="#carouselExampleCaptions" data-mdb-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
<!--                <button type="button" data-mdb-target="#carouselExampleCaptions" data-mdb-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-mdb-target="#carouselExampleCaptions" data-mdb-slide-to="2" aria-label="Slide 3"></button>-->
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="https://wallpaperaccess.com/full/1232117.jpg" class="d-block w-100" alt="Wild Landscape" />
                    <div class="mask" style="background-color: rgba(0, 0, 0, 0.4)"></div>
                    <div class="carousel-caption d-none d-sm-block mb-5">
                        <h1 class="mb-4">
                            <strong>TOP SHOP</strong>
                        </h1>
<!--                        <a target="_blank" href="https://mdbootstrap.com/education/bootstrap/" class="btn btn-outline-white btn-lg">Start free tutorial
                            <i class="fas fa-graduation-cap ms-2"></i>
                        </a>-->
                    </div>
                </div>
            </div>
<!--            <button class="carousel-control-prev" type="button" data-mdb-target="#carouselExampleCaptions" data-mdb-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-mdb-target="#carouselExampleCaptions" data-mdb-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>-->
        </div>

        <!--Main Layout-->
        <main>
            <div class="container mt-4">
                <!-- navbar -->
                <nav>

                </nav>
                <!-- navbar -->

                <!-- DetailProduct -->
                <section>
                    <div class="container text-center">
                        <div class="row">
                            <div class="col-sm-5 col-md-6 card">
                                <div class="bg-image hover-zoom ripple ripple-surface ripple-surface-light">
                                    <img src="${detail.image}" />
                                </div>
                            </div>
                            <div class="col-sm-5 offset-sm-2 col-md-6 offset-md-0 card">
                                <h5 class="card-title mb-3" style="text-align: left; font-weight: bold">${detail.title}</h5>
                                <h6 class="mb-3 price" style="text-align: left; color: red">Giá: ${detail.price} Vnđ</h6>
                                <h6 class="mb-3" style="text-align: justify">${detail.description}</h6>
                                <button style="
                                                    background-color: #ff69b4;
                                                    color: white;
                                                    border: none;
                                                    border-radius: 20px;
                                                    padding: 10px 20px;
                                                    font-size: 14px;
                                                    cursor: pointer;
                                                    transition: 0.3s ease;
                                                ">
                                                    💖 Thêm vào giỏ hàng
                                                </button>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- DetailProduct -->
                <!-- Pagination -->
<!--                <nav aria-label="Page navigation example" class="d-flex justify-content-center mt-3">
                    <ul class="pagination">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>-->
                <!-- Pagination -->

            </div>
        </main>
        <!--footer-->
        <footer class="text-center text-white mt-4" style="background-color: #607D8B">

            <hr class="text-dark">

            <div class="container">
                <!-- Section: Social media -->
                <section class="mb-3">

                    <!-- Facebook -->
                    <a class="btn-link btn-floating btn-lg text-white" href="#!" role="button" data-mdb-ripple-color="dark"><i class="fab fa-facebook-f"></i></a>

                    <!-- Twitter -->
                    <a class="btn-link btn-floating btn-lg text-white" href="#!" role="button" data-mdb-ripple-color="dark"><i class="fab fa-twitter"></i></a>

                    <!-- Google -->
                    <a class="btn-link btn-floating btn-lg text-white" href="#!" role="button" data-mdb-ripple-color="dark"><i class="fab fa-google"></i></a>

                    <!-- Instagram -->
                    <a class="btn-link btn-floating btn-lg text-white" href="#!" role="button" data-mdb-ripple-color="dark"><i class="fab fa-instagram"></i></a>

                    <!-- YouTube -->
                    <a class="btn-link btn-floating btn-lg text-white" href="#!" role="button" data-mdb-ripple-color="dark"><i class="fab fa-youtube"></i></a>
                    <!-- Github -->
                    <a class="btn-link btn-floating btn-lg text-white" href="#!" role="button" data-mdb-ripple-color="dark"><i class="fab fa-github"></i></a>
                </section>
                <!-- Section: Social media -->
            </div>
            <!-- Grid container -->

            <!-- Copyright -->
            <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2); text-color: #E0E0E0">
                © 2024 Copyright:
                <a class="text-white" href="Home.jsp">TOPSHOP.COM</a>
            </div>
        </footer>
        <!--footer-->
    </body>
</html>
