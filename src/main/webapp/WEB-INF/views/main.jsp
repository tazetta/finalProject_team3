<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>

<head>
    <meta charset="UTF-8">
    <title>메인페이지</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
        crossorigin="anonymous"></script>
    <!-- CSS boot -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <style>
        a {
            text-decoration: none;
            font-weight: bold;
        }

        span:hover {
            color: black;
        }

        .flexBox {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        #btn:hover{
            color: rgb(143, 201, 248);
	        box-shadow: rgb(143, 201, 248) 0 0px 0px 40px inset;
        }
   
    </style>
</head>

<body>
    <br/>
    <div class="container" style="text-align: center;">
        <input type="text" size="75" style="border-radius: 5px; border: 2px solid rgb(203, 228, 248);"
            placeholder="검색어를 입력해주세요.">
        <button id="btn"
            style="border-radius: 5px;background-color: rgb(203, 228, 248); border: 2px solid rgb(203, 228, 248); font-weight: bold; color: white;">검색</button>
        <a href="" style="font-size:small; float: right; color: gray; padding-left: 5px;">|<span
                style="padding-left: 5px;">고객센터</span></a>
        <a href="" style="font-size:small; float: right; color: gray; padding-left: 5px;">|<span
                style="padding-left: 5px;">회원가입</span></a>
        <a href="" style="font-size:small; float: right; color: gray; "><span>로그인</span></a>
    </div>
    <div class="flexBox">
        <br />
        <div>
            <br />
            <jsp:include page=""></jsp:include>
            <div class="container">
                <h4>오늘의 땃쥐 룸</h4>
                <br/>
                <div class="container">
                    <div style="display: flex;  justify-content: center; border: 1px solid rgb(255, 255, 255); height: 100%;">
                        <div style="border: 5px solid white; margin-right: 90px; box-shadow:0 0 5px lightslategray;" >
                            <img src="C:\Users\user\Desktop\BootStrap\interior1.jpg" width="250" height="250">
                        </div>
                        <div style="border: 5px solid white; margin-right: 90px; box-shadow:0 0 5px lightslategray;" >
                            <img src="C:\Users\user\Desktop\BootStrap\interior2.jpg" width="250" height="250">
                        </div>
                        <div style="border: 5px solid white; margin-right: 90px; box-shadow:0 0 5px lightslategray;" >
                            <img src="C:\Users\user\Desktop\BootStrap\interior3.jpg" width="250" height="250">
                        </div>
                    </div>
                </div>
                <br/>
                <hr/>
            </div>
            <br />
            <br />
            <div style="display: flex; max-width: 1300; justify-content: center;">
                <div class="container">
                    <h4>자유게시판</h4>
                    <table class="table table-hover" style="min-width: 500;">
                        <thead style="background-color: rgb(170, 187, 247); color: white;">
                            <tr>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>조회수</th>
                            </tr>
                        </thead>
                        <tr>
                            <td>ㅇ</td>
                            <td>ㅇ</td>
                            <td>ㅇ</td>
                        </tr>
                        <tr>
                            <td>ㅇ</td>
                            <td>ㅇ</td>
                            <td>ㅇ</td>
                        </tr>
                        <tr>
                            <td>ㅇ</td>
                            <td>ㅇ</td>
                            <td>ㅇ</td>
                        </tr>
                    </table>
                </div>
                <div class="container">
                    <h4>꿀팁</h4>
                    <table class="table table-hover" style="min-width: 500;">
                        <thead style="background-color: rgb(170, 187, 247); color: white;">
                            <tr>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>조회수</th>
                            </tr>
                        </thead>
                        <tr>
                            <td>ㅇ</td>
                            <td>ㅇ</td>
                            <td>ㅇ</td>
                        </tr>
                        <tr>
                            <td>ㅇ</td>
                            <td>ㅇ</td>
                            <td>ㅇ</td>
                        </tr>
                        <tr>
                            <td>ㅇ</td>
                            <td>ㅇ</td>
                            <td>ㅇ</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>

</html>