
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>우리 집 자랑</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<script src="resources/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
<style>
 #comment{
    border-radius: 5px; 
    background-color:rgb(99, 126, 224) ; 
    font-weight: bold; 
    font-size: small; 
    color: white;
 }
 a {

	text-decoration: none;
}

span:hover {
        color: black;
    }

    #btn:hover {
        color: rgb(143, 201, 248);
        box-shadow: rgb(143, 201, 248) 0 0px 0px 40px inset;
    }
    #btn2:hover {
        color: rgb(143, 201, 248);
        box-shadow: rgb(143, 201, 248) 0 0px 0px 40px inset;
    }
#totaldiv {
	
}

	
</style>
</head>

<body>
        <jsp:include page="mainnavi.jsp" />
   <br/>
   
   <br/>
    <div class="container" style="text-align: center;">
        <select name="idx" id="orderBy" style="border-radius: 5px; border: 2px solid gray; ">
            
            <option value="reg_date">최신순</option>
            <option value="cntreco">추천순</option>
        </select>
        <select name="idx" id="formcategory" style="border-radius: 5px; border: 2px solid gray;">
            <option value="0">주거형태</option>
            <option value="1">원룸&오피스텔</option>
            <option value="2">아파트</option>
            <option value="3">단독주택</option>
            <option value="4">기타</option>
        </select>
      
        <select name="idx" id="budget" style="border-radius: 5px; border: 2px solid gray;">
            <option value="0">예산</option>
            <option value="100">100만원 미만</option>
            <option value="200">100만원 이상 ~ 200만원 미만</option>
            <option value="300">200만원 이상 ~ 300만원 미만</option>
            <option value="400">300만원 이상 ~ 400만원 미만</option>
            <option value="500">400만원 이상 ~ 500만원 미만</option>
            <option value="600">500만원 이상 ~ 1000만원 미만</option>
            <option value="1000">1000만원 이상</option>
        </select>
        <label>평수</label>
        <input type="range" id="roomsize" min="1" max="100" step="1" oninput="document.getElementById('value').innerHTML=this.value;" onchange="console.log(this.value);">
        <span id="value"></span>평
        
   
       <div style="float: right; padding-right:10%;">
        <button id="btn"style="border-radius: 5px; background-color: rgb(95, 176, 241); border: 2px solid rgb(203, 228, 248); font-weight: bold; color: white;" onclick="location.href='boardWriteForm?boardCtgIdx=2'">글쓰기</button>
        </div>

    </div>
    <br/>
   
    <div class="container" style="font-size: large; font-weight: bold; padding-left: 40px;">
        <br />
        <h4  style=" font-weight: bold; padding-left:200px;">우리 집 자랑</h4>
        <div class="container" style="padding-top: 50px; ">


           <div id="totaldiv" class="container" style="font-size: large; font-weight: bold; padding-left: 40px;">
			<div id="list" style="display: flex; flex-flow: wrap; justify-content: center; border: 1px solid rgb(255, 255, 255);">

			</div> 
		</div>
           
           	<div id="pagination-div" style="padding-left:40%; margin-top:15px;"></div>
           
            <!--<div style="display: flex;  justify-content: center; border: 1px solid rgb(255, 255, 255);">
               <div id="totaldiv" class="container" style="font-size: large; font-weight: bold; padding-left: 40px;">
			<div id="list" style="display: flex; flex-flow: wrap;  justify-content: center; border: 1px solid rgb(255, 255, 255);">

			</div> 
				</div>
				</div>
				
               <div style="border-radius:20px; border: 5px solid white; margin-right: 90px; box-shadow:0 0 5px lightslategray;">
                    <img src="C:\Users\user\Desktop\BootStrap\interior1.jpg" width="250" height="250" style=" border-radius:20px;">
                    <table class="table">
                        <tr>
                            <th style="border-color: white;">새로운글</th>
                        </tr>
                        <tr>
                            <td>중수 아이디 날짜 조회 댓글 추천</td>
                        </tr>
                    </table>
                </div>

                </div>
            </div>-->




        </div>
    </div>  
</body>
<script>


var msg = "${msg}";
if(msg != ""){
	alert(msg);
}
	
$(document).ready(function() {
	// 목록을 조회하는 함수.
	function getList(pageNum, orderBy,formcategory,budget,roomsize) {
		/*
		 * pageNum, opt, keyword
		 * 값이 없으면 초기값 사용.
		 * 값이 있으면 입력받은 값 사용.
		 */
		var pageNum = !pageNum ? 1 : pageNum;
		
		var orderBy = !orderBy ? 'reg_date' : orderBy 
		var formcategory = !formcategory ? '0': formcategory
		var budget = ! budget ? '0' : budget
		var roomsize = ! roomsize ? '0' : roomsize
		var oData = {
			pageNum : pageNum,
			orderBy : orderBy,
			formcategory :formcategory,
			budget : budget,
			roomsize : roomsize
		};
			
			console.log(oData);

		$.ajax({
			url : '/main/api/homemain',
			type : 'GET',
			data : oData,
			dataType : 'JSON',
			success : function(data) {
				appendList(data.list); //화면에 뿌려주기 위함
				createPagination(data.total_page, pageNum);
			},
			error : function(error) {
				console.log(error);
			}
		});
	}

	// 목록을 UI에 추가하는 함수.
	function appendList(aList) {
		// jquery의 반복문을 사용.
		var sHtml = '';
		if(aList.length > 0){
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
							
							sHtml += "<div style='border-radius:20px; border: 5px solid white; margin: 20px; box-shadow:0 0 5px lightslategray;'>"
							sHtml += "<img  src='${pageContext.request.contextPath}+ oInfo.newFileList;' width='250' height='250' style=' border-radius:20px;'>"
							sHtml += "<table class='table'>"
							sHtml += '<tr>';
							sHtml += '	<td><a href="boarddetail?boardIdx=' + oInfo.boardIdx +'">'
									+ oInfo.subject
									+ '</a></td>';
							sHtml += '	<td>' + oInfo.id
									+ '</td>';
							sHtml += '	<td>' + oInfo.cntreco
									+ '</td>';
							sHtml += '</tr>';
							sHtml += "</table>"
							sHtml += "</div>"
						
						});
		} else {
			sHtml += "<div style='border-radius:20px; border: 5px solid white; margin: 20px; box-shadow:0 0 5px lightslategray;'>"
			sHtml += "해당하는 게시물이 없습니다.</div>"
		}
	
		
	
		$("#list").empty();
		$("#list").append(sHtml);
	}
	
	
	var orderBy = '';
	var formcategory ='';
	var budget ='';
	var roomsize = '';
	

	function createPagination(iTotalPage, iStartPage) {
		console.log('iTotalPage : ' + iTotalPage);
		$('#pagination-div').twbsPagination('destroy');
		$('#pagination-div').twbsPagination({
			totalPages : iTotalPage, // 총 페이지 번호 수 TODO:
			visiblePages : 5, // 하단에서 한번에 보여지는 페이지 번호 수
			startPage : iStartPage, // 시작시 표시되는 현재 페이지
			initiateStartPageClick : false, // 플러그인이 시작시 페이지 버튼 클릭 여부 (default : true)
			first : '<span aria-hidden="true"><<</span>', // 페이지네이션 버튼중 처음으로 돌아가는 버튼에 쓰여 있는 텍스트
			prev : "이전", // 이전 페이지 버튼에 쓰여있는 텍스트
			next : "다음", // 다음 페이지 버튼에 쓰여있는 텍스트
			last : '<span aria-hidden="true">>></span>', // 페이지네이션 버튼중 마지막으로 가는 버튼에 쓰여있는 텍스트
			// nextClass : "page-item next",	// 이전 페이지 CSS class
			// prevClass : "page-item prev",	// 다음 페이지 CSS class
			lastClass : "", // 마지막 페이지 CSS calss
			firstClass : "", // 첫 페이지 CSS class
			pageClass : "page-item", // 페이지 버튼의 CSS class
			activeClass : "active", // 클릭된 페이지 버튼의 CSS class
			disabledClass : "disabled", // 클릭 안된 페이지 버튼의 CSS class
			anchorClass : "page-link", //버튼 안의 앵커에 대한 CSS class

			onPageClick : function(event, page) {
				getList(page,orderBy,formcategory,budget,roomsize);
			}
		});
	}
	
	//정렬이 변경 된 경우
	
	$('#orderBy').on('change', function(){
		orderBy =$(this).val();
		$('#formcategory').off('change');
		getList(1,orderBy);
	});
	
	$('#formcategory').on('change', function(){
		formcategory = $(this).val();
		getList(1,orderBy,formcategory);
	});
	
	$('#budget').on('change', function(){
		budget = $(this).val();
		getList(1,orderBy,formcategory, budget);
	});
	$('#roomsize').on('change', function(){
		roomsize = $(this).val();
		getList(1,orderBy,formcategory, budget,roomsize);
	});
	
	
	
	
	
	
	
	
	getList();
});



	
	/*$('button#btnForSearch').click(function() {
		if ($('#keywordForSearch').val() == '') {
			alert("검색어를 입력해주세요2.");
			$('#keywordForSearch').focus();
		} else {
			keyword = $('#keywordForSearch').val();
			getList(2, keyword);
		}
	});
	$('#orderBy').on('change', function(){
		orderBy = $(this).val();
		
		getList(2, orderBy);
	});
	$('#formcategory').on('change', function(){
		formcategory = $(this).val();
		getList(2, formcategory);
	});
	$('#budget').on('budget', function(){
		budget = $(this).val();
		getList(2, budget);
	});
	$('#roomsize').on('roomsize', function(){
		roomsize = $(this).val();
		getList(2, roomsize);
	});
			
	*/		
	
			

</script>
</html>


