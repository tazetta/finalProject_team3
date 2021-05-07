
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>우리 집 자랑</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</head>
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

	
</style>
</head>
<body>
    <div class="container" style="text-align: center; padding-top: 10px;">
        <input type="text" size="75" style="border-radius: 5px; border: 2px solid rgb(203, 228, 248); "
           id="keywordForTotalSearch" name="keyword" placeholder="검색어를 입력해주세요.">
        &nbsp;
        <button id="btnForTotalSearch"
            style="border-radius: 5px; background-color: rgb(203, 228, 248); border: 2px solid rgb(203, 228, 248); font-weight: bold; color: white;">검색</button>
        <a href="" style="font-size:small; float: right; color: gray; padding-left: 5px;  font-weight: bold;">|<span
                style="padding-left: 5px; font-weight: bold; ">고객센터</span></a>
        <a href="" style="font-size:small; float: right; color: gray; padding-left: 5px; font-weight: bold;">|<span
                style="padding-left: 5px;  font-weight: bold;">회원가입</span></a>
        <a href="" style="font-size:small; float: right; color: gray;  font-weight: bold; "><span>로그인</span></a>
       </div>
   <br/>
   
   <br/>
    <div class="container" style="text-align: center;">
        <select name="idx" id="orderBy" style="border-radius: 5px; border: 2px solid gray; ">
            
            <option value="recent">최신순</option>
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
            <option value="1">1백만원미만</option>
            <option value="2">1백만원대</option>
            <option value="3">2백만원대</option>
            <option value="4">3백만원대</option>
            <option value="5">4백만원대</option>
            <option value="6">5백만원대</option>
            <option value="7">1천만원대</option>
            <option value="8">그 이상</option>
        </select>
        <label>평수</label>
        <input type="range" id="roomsize" min="1" max="100" step="1" oninput="document.getElementById('value').innerHTML=this.value;" onchange="console.log(this.value);">
        <span id="value"></span>평
        
   
       <div style="float: right;">
        <button id="btn"
        style="border-radius: 5px; background-color: rgb(95, 176, 241); border: 2px solid rgb(203, 228, 248); font-weight: bold; color: white;" onclick="location.href='boardWriteForm?boardCtgIdx=2'">글쓰기</button>
        </div>

    </div>
    <br/>
   
    <div class="container" style="font-size: large; font-weight: bold; padding-left: 40px;">
        <br />
        <h4  style=" font-weight: bold;">우리 집 자랑</h4>
        <div class="container" style="padding-top: 100px;">


            <div style="display: flex;  justify-content: center; border: 1px solid rgb(255, 255, 255);">
               <div id="totaldiv" class="container" style="font-size: large; font-weight: bold; padding-left: 40px;">
			<div id="list" style="display: flex; flex-flow: wrap;  justify-content: center; border: 1px solid rgb(255, 255, 255);">

			</div> 
				</div>
				<div id="list" style="display: flex; flex-flow: wrap;  justify-content: center; border: 1px solid rgb(255, 255, 255);">

			</div> 
               <!--  <div style="border-radius:20px; border: 5px solid white; margin-right: 90px; box-shadow:0 0 5px lightslategray;">
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

                </div>-->
            </div>




        </div>
    </div>  
</body>
<script>
$(document).ready(function(){
	function getList(pageNum,keyword,orderBy,formcategory,budget,roomsize){
		var pageNum =  1 
		var keyword = '' 
		var orderBy = !orderBy ? 'recent' : orderBy;
		var formcategory = !formcategory ? '0' :formcategory;
		var budget =  ! budget ? '' : budget;
		var roomsize = ! roomsize ? '0' : roomsize; 
		var hdata = {
				pageNum : pageNum,
				keyword : keyword,
				orderBy : orderBy,
				formcategory : formcategory,
				budget : budget,
				roomsize : roomsize
	};
console.log(hdata);
	$.ajax({
		url: '/main/api/homemain',
		type : 'GET',
		data : hdata,
		dataType : 'JSON',
		success : function(data){
			appendList(data.list);
			
		},
		error : function(error){
			console.log('에러');
		}
		
	});
				}


	function appendList(list) {
		console.log("appendList실행");
		
		var content = "";
		$.each(list,function(index, info) {

			content += "<div style='border-radius:20px; border: 5px solid white; margin: 20px; box-shadow:0 0 5px lightslategray;'>"
			content += "<img src='resources/images/interior1.jpg' width='250' height='250' style=' border-radius:20px;'>"
			content += "<table class='table'>"
			content += "<tr>"
			content += "<th style='border-color: white;'><a href='homeDetail?BOARDIDX="
					+ info.BOARDIdX + "'>" + info.subject + "</a></th>"
			content += "</tr>"
			content += "<tr>"
			content += "<td><a href='homeDetail?ID=" + info.ID + "'>"
					+ info.ID + "</a></td>"
			content += "</tr>"
			content += "</table>"
			content += "</div>"
		
	});
		
		$('#list').empty();
		$('#list').append(content);
	}

	$('button#btnForSearch').click(function() {
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
			
			
	
			
	});
</script>
</html>


