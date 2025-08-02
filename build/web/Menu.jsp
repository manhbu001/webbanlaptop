<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- MDB -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.1.0/mdb.umd.min.js">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">


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
            <a href="ManagerAcc.jsp" class="w3-bar-item w3-button">Quản lý tài khoản</a>
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
<!--        <button type="button" data-mdb-target="#carouselExampleCaptions" data-mdb-slide-to="1" class="active1" aria-label="Slide 2"></button>
        <button type="button" data-mdb-target="#carouselExampleCaptions" data-mdb-slide-to="2" class="active2" aria-label="Slide 3"></button>-->
    </div>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="https://wallpaperaccess.com/full/1232117.jpg" class="d-block w-100" alt="Wild Landscape" />
            <div class="mask" style="background-color: rgba(0, 0, 0, 0.4)"></div>
            <div class="carousel-caption d-none d-sm-block mb-5">
                <h1 class="mb-4">
                    <strong>TOP SHOP</strong>
                </h1>
<!--                <a target="_blank" href="https://mdbootstrap.com/education/bootstrap/" class="btn btn-outline-white btn-lg">Start free tutorial
                    <i class="fas fa-graduation-cap ms-2"></i>
                </a>-->
            </div>
        </div>
        
        
    </div>
<!--    <button class="carousel-control-prev" type="button" data-mdb-target="#carouselExampleCaptions" data-mdb-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-mdb-target="#carouselExampleCaptions" data-mdb-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>-->


  <!-- Navbar -->
<div class="container">
    <nav class="navbar navbar-expand-lg navbar-dark mt-0 mb-0 p-0" style="background-color: #ffffff">
        <!-- Container wrapper -->
        <div class="container-fluid">

            <!-- Navbar brand -->
            <a class="navbar-brand text-dark" href="home">Sản phẩm:</a><!-- href="home" là việc chúng ta chuyển qua servlet [home] sau khi click vào Categories trên menu-->

            <!-- Toggle button -->
            <button class="navbar-toggler" type="button" data-mdb-toggle="collapse" data-mdb-target="#navbarSupportedContent2" aria-controls="navbarSupportedContent2" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fas fa-bars"></i>
            </button>

            <!-- Collapsible wrapper -->
            <div class="collapse navbar-collapse" id="navbarSupportedContent2">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                    <!-- Link -->
                    <c:forEach items="${listC}" var="obj_category">
                        <li class="nav-item ${tag == obj_category.cid ? "menulink":""}"> <!-- sử dụng toán tử 3 ngôi: nếu đúng id được chọn thì giá trị trả về class là menulink ngược là rỗng-->
                            <a class="nav-link text-dark" href="category?cateID=${obj_category.cid}">${obj_category.cname}</a>
                        </li>
                    </c:forEach>
                </ul>

                
            </div>
        </div>
        <!-- Container wrapper -->
    </nav>

</div>



