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
    <!--  <br/>
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
    </div>-->
    <div class="flexBox" style="padding-bottom : 300px;">
    
       
        <div>
           
         
            <div class="container">
            <div style="min-height: 210px;">
	            <jsp:include page="mainnavi.jsp"></jsp:include> 
            </div>
              
                <br/>
                <div class="container">
                <h3 style="font-weight:bold;padding-bottom:50px;">오늘의 땃쥐 룸</h3>
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
                <div class="container" style="padding-top:20px;">
                    <h4 style="font-weight:bold;">자유게시판</h4>
                    <br/>
                    <table class="table table-hover" style="min-width: 500; ">
                        <thead style="background-color: rgb(170, 187, 247); color: white;">
                            <tr>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>조회수</th>
                            </tr>
                        </thead>
                       
			<tbody id="list">
				<!--
				<c:forEach var="board" items="${boardList}" begin="0" end="9"
					step="1" varStatus="status">
					<tr>
						<td><a href="boarddetail/${board.boardIdx}">${board.subject}</a></td>
						<td>${board.id}</td>
						<td>${board.bhit}</td>
						<td>${board.reg_date}</td>
					</tr>
				</c:forEach>
				-->
			</tbody>
                    </table>
                </div>
                <div class="container" style="padding-top:20px;">
                    <h4 style="font-weight:bold;">꿀팁</h4>
                    <br/>
                    <table class="table table-hover" style="min-width: 500;">
                        <thead style="background-color: rgb(170, 187, 247); color: white;">
                            <tr>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>조회수</th>
                            </tr>
                        </thead>
                                   
			<tbody id="tlist">
				<!--
				<c:forEach var="board" items="${boardList}" begin="0" end="9"
					step="1" varStatus="status">
					<tr>
						<td><a href="boarddetail/${board.boardIdx}">${board.subject}</a></td>
						<td>${board.id}</td>
						<td>${board.bhit}</td>
						<td>${board.reg_date}</td>
					</tr>
				</c:forEach>
				-->
			</tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
<script>

var msg ="${msg}";
if(msg!=''){
	
	alert(msg);
}

$(document).ready(function() {
	// 목록을 조회하는 함수.
	function getList(pageNum, opt, keyword) {
		/*
		 * pageNum, opt, keyword
		 * 값이 없으면 초기값 사용.
		 * 값이 있으면 입력받은 값 사용.
		 */
		var pageNum = !pageNum ? 1 : pageNum;
		var opt = !opt ? 'all' : opt;
		var keyword = !keyword ? '' : keyword;
		var oData = {
			pageNum : pageNum,
			opt : opt,
			keyword : keyword
		};
		console.log(oData);

		$.ajax({
			url : '/main/api/freelist',
			type : 'GET',
			data : oData,
			dataType : 'JSON',
			success : function(data) {
				appendList(data.list);
				createPagination(data.total_page,pageNum);
			},
			error : function(error) {
				console.log('에러 났음...');
			}
		});
	}

	// 목록을 UI에 추가하는 함수.
	function appendList(aList) {
		// jquery의 반복문을 사용.
		var sHtml = '';
		$.each(aList,function(index, oInfo) {
							/*
							행 html 소스
							<tr>
								<td><a href="boarddetail/${board.boardIdx}">${board.subject}</a></td>
								<td>${board.id}</td>
								<td>${board.bhit}</td>
								<td>${board.reg_date}</td>
							</tr>
							 */
							sHtml += '<tr>';
							sHtml += '	<td><a href="boarddetail?boardIdx=' + oInfo.boardIdx +'">'
									+ oInfo.subject
									+ '</a></td>';
							sHtml += '	<td>' + oInfo.id
									+ '</td>';
							sHtml += '	<td>' + oInfo.bhit
									+ '</td>';
							
							sHtml += '</tr>';
						});

		$("#list").empty();
		$("#list").append(sHtml);
	}
	// 페이지 진입시 초기에 목록 조회.
	getList();
});

$(document).ready(function() {
	// 목록을 조회하는 함수.
	function getList(pageNum, opt, keyword, orderBy) {
		/*
		 * pageNum, opt, keyword
		 * 값이 없으면 초기값 사용.
		 * 값이 있으면 입력받은 값 사용.
		 */
		var pageNum = !pageNum ? 1 : pageNum;
		var opt = !opt ? 'all' : opt;
		var keyword = !keyword ? '' : keyword;
		var orderBy = !orderBy ? 'recent' : orderBy 
		var oData = {
			pageNum : pageNum,
			opt : opt,
			keyword : keyword,
			orderBy : orderBy
		};

		$.ajax({
			url : '/main/api/tip',
			type : 'GET',
			data : oData,
			dataType : 'JSON',
			success : function(data) {
				appendList(data.list); //화면에 뿌려주기 위함
				createPagination(data.total_page, pageNum); //페이징 처리
			},
			error : function(error) {
				console.log('에러 났음...');
			}
		});
	}

	// 목록을 UI에 추가하는 함수.
	function appendList(aList) {
		// jquery의 반복문을 사용.
		var sHtml = '';
		$.each(aList,function(index, oInfo) {
							/*
							행 html 소스
							<tr>
								<td><a href="boarddetail/${board.boardIdx}">${board.subject}</a></td>
								<td>${board.id}</td>
								<td>${board.bhit}</td>
								<td>${board.reg_date}</td>
							</tr>
							 */
							sHtml += '<tr>';
							sHtml += '	<td><a href="boarddetail?boardIdx=' + oInfo.boardIdx +'">'
									+ oInfo.subject
									+ '</a></td>';
							sHtml += '	<td>' + oInfo.id
									+ '</td>';
							sHtml += '	<td>' + oInfo.cntreco
									+ '</td>';
							
							sHtml += '</tr>';
						});
	
		

		$("#tlist").empty();
		$("#tlist").append(sHtml);
	}

	getList();
});






















</script>
</html>