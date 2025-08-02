<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Home</title>
        <!------ Include the above in your HEAD tag ---------->

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.1.0/mdb.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link href="./css/style.css" rel="stylesheet" type="text/css">
        <script>
            function validateForm() {
                var y = document.getElementById("productname").innerHTML;
                let x = document.forms["myformsearch"]["txt"].value;
                if (x == "") {
                    alert("Bạn hãy nhập tên sản phẩm cần tìm kiếm!");
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <!--Main layout-->
            <main>
                <div class="container">

                    <!-- Products -->
                    <section>
                        <div class="text-center">
                            <div class="row">
                            <c:forEach items="${listP}" var="obj_product">
                                
                                <div class="col-lg-3 col-md-6 mb-4">
                                    <div class="card">
                                        <div class="bg-image hover-zoom ripple ripple-surface ripple-surface-light" data-mdb-ripple-color="light">
                                            <img src="${obj_product.image}" class="w-100 myImg" />
                                            <a href="detail?pid=${obj_product.id}">
                                                <div class="mask">
                                                    <div class="d-flex justify-content-start align-items-end h-100">
                                                        <h5><span class="badge bg-dark ms-2">NEW</span></h5>
                                                    </div>
                                                </div>
                                                <div class="hover-overlay">
                                                    <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="card-body">
                                            <a href="detail?pid=${obj_product.id}" class="text-reset" style="text-decoration: none">
                                                <h5 class="card-title mb-2" id="productname">${obj_product.name}</h5>
                                            </a>
                                            <a href="ProductCart?action=AddCart&id=${obj_product.id}" class="text-reset ">
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

                                            </a>
                                            <h6 class="mb-3 price">${obj_product.price} Vnđ</h6>
                                        </div>
                                    </div>
                                </div>
                                        
                            </c:forEach>
                            
                        </div>
                    </div>
                </section>

                <!-- Pagination -->
                <nav aria-label="Page navigation example" class="d-flex justify-content-center mt-3">
                    <ul class="pagination">
<!--                        <li class="page-item disabled">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>-->
                    </ul>
                </nav>
                <!-- Pagination -->
            </div>
        </main>
        <!--Main layout-->
        <!--Footer-->
        <jsp:include page="Footer.jsp"></jsp:include>
        <!--Footer-->
    </body>
</html>

