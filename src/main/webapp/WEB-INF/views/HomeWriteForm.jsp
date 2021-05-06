
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta  charset= "UTF-8">
<title>우리 집 자랑 글쓰기</title>

    
<!-- 부트스트랩 사용 -->
<meta name="viewport" content="width=device-width, initial-scale=1">


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

<style>
    th{
        text-align: center;
        color: rgb(107, 105, 105);
    }
   
        
        
    a {
	text-decoration: none;
    border-radius: 10px;
    }
    table{
        margin-top: 150px;
      
    }
    .table-bordered{
        width: 100%;
        border: 3px solid rgb(204, 203, 203);
    }
        
       
    ul{
        list-style: none;
    }
    a.button {
	color: rgba(30, 22, 54, 0.6);
    background-color: rgb(230, 226, 224);
	box-shadow: rgb(230, 226, 224) 0 0px 0px 2px inset;
}

a.button:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgb(230, 226, 224) 0 0px 0px 40px inset;
}

a.button2 {
	color: rgba(30, 22, 54, 0.6);
    background-color: rgb(194, 191, 243);
	box-shadow: rgb(194, 191, 243) 0 0px 0px 2px inset;
}

a.button2:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgb(194, 191, 243) 0 0px 0px 40px inset;
}
</style>
</head>

<body>
    <div class="container" style="text-align: center; padding-top: 10px;">
        <input type="text" size="75" style="border-radius: 5px; border: 2px solid rgb(203, 228, 248); " placeholder="검색어를 입력해주세요.">
        &nbsp;
        <button id="btn" style="border-radius: 5px; background-color: rgb(203, 228, 248); border: 2px solid rgb(203, 228, 248); font-weight: bold; color: white;">검색</button>
        <span><a href="" style="font-size:small; float: right; color: gray; font-weight: bold;">|고객센터</a></span>
        <span><a href="" style="font-size:small; float: right; color: gray; font-weight: bold;" >|회원가입</a></span>
        <span><a href="" style="font-size:small; float: right; color: gray; font-weight: bold;">로그인</a></span>
    </div>
   <br/>
<form method="post" action="">
    <div class="container">
        <table class="table table-bordered">
            <thead>
                <tr> 
                    <th class="list" style="vertical-align: top; border: 3px solid rgb(204, 203, 203);">필수항목</th>
                
                    <td>
                        <ul>
                            <li>
                                <select name="idx" id="idx"style="border-radius: 5px; margin: 5px; ">
                                <option>주거형태</option>
                                <option value="">원룸&오피스텔</option>
                                <option value="1">아파트</option>
                                <option value="2">단독주택</option>
                                <option value="3">기타</option>
                                </select>
                            </li>
                            <br/>
                         
                                <li>
                                    평수<input type="text" style="border-radius: 5px; border-color:  rgb(162, 163, 163); width: 50px;">평
    
                                </li>
                                <br/>
                           
                            <li>

                                예산<input type="text" style="border-radius: 5px;border-color:  rgb(162, 163, 163);  width: 50px;">만원
                            </li>

                        </ul>
                    </td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th  style=" border: 3px solid rgb(204, 203, 203);">제목</th>
                    <td  style=" border: 3px solid rgb(204, 203, 203);"><input type="text" style="width: 100%; " placeholder="제목을 입력해주세요."></td>
                </tr>
                <tr>
                    <th  style=" border: 3px solid rgb(204, 203, 203);">내용</th>
                    <td  style=" border: 3px solid rgb(204, 203, 203);"><textarea style="width: 100%;"cols="30" rows="10" placeholder="내용을 입력해주세요."></textarea></td>
                </tr>
                <tr>
                    <th  style=" border: 3px solid rgb(204, 203, 203);">아이템</th>
                    <td style=" border: 3px solid rgb(204, 203, 203);"><textarea style="width: 100%;" cols="30" rows="5" placeholder="ex)1.이케아 가구"></textarea></td>
                </tr>
            </tbody>
        </table>
       
        <div class="container">
            <a href="#" class="button" style="max-width: 75; margin: 10px ; padding: 10px 20px; font-weight: bold; ">첨부파일</a>
            <div class="row" style="float: right;">
                <a href="#" class="button2" style="max-width: 75; margin: 10px ; padding: 10px 20px; font-weight: bold; ">저장</a>
            </div>
            <a href="#" class="button" style="max-width: 75; margin: 10px ; padding: 10px 20px; font-weight: bold; float: right;">취소</a>
        </div>
        </div>
       

    </form>
    </body>
    </html>