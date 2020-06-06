<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-164964981-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-164964981-1');
</script>
<meta charset="UTF-8">
<title>정치로</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

</head>


<link rel="stylesheet" type="text/css"
	href="/poli/resources/css/board.css" />

<!-- START :: CSS -->
<style type="text/css">
span {
	cursor: pointer;
}

li {
	list-style: none;
	float: left;
	padding: 6px;
}

.bill {
	padding-left: 5%;
	padding-right: 5%;
}
</style>
<!-- END :: CSS -->

<!-- START :: JAVASCRIPT -->
<script type="text/javascript"
   src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/poli/resources/js/ajaxCommon.js"></script>
<script type="text/javascript">
   
   /* 
   * bill 즐겨찾기 등록 
   */
   
   function isFav(bill_id){
      
      var member_seq = $("#member_seq").val().trim();
      var bill_id = bill_id;
      
      console.log("member_seq : " + member_seq + " bill_id : " + bill_id);
      
      
      //////////////////추가/////////////////
      if(member_seq == null || member_seq == ""){
         var loginFirst = window.confirm("로그인을 하셔야 등록 가능합니다. \n 로그인을 하러 가시겠습니까?");
         if(loginFirst){
            location.href="/poli/loginPage.do"
         } else {
            return false;
         }
      }
      
      var Fav = {
            "member_seq" : member_seq,
            "bill_id" : bill_id
      }
      
      console.log(Fav);
      
      
      var ajax = new ComAjax();
      ajax.url("/poli/isBillFav.do");
      ajax.param(Fav);
      
      ajax.success(function(msg){
         console.log(msg);
         
         if(msg.isBillFav == true){
            alert("이미 즐겨찾기 된 의안입니다.");
            return false;
         } else {
            insertBillFav(member_seq, bill_id);
         }
      });
      
      ajax.call();      
      
   }
   
   /* 
   * bill 즐겨찾기 등록 
   */
   
   function insertBillFav(member_seq, bill_id){
      
      var BillFav = {
            "member_seq" : member_seq,
            "bill_id" : bill_id
      }
      
      var ajax01 = new ComAjax();
      ajax01.url("/poli/insertBillFav.do");
      ajax01.param(BillFav);
      
      ajax01.success(function(msg){
         
         if(msg.isInsert == true){
            var confirm = window.confirm("즐겨찾기에 등록되었습니다. \n 마이페이지로 이동하시겠습니까?");
            
            if(confirm){
               location.href="/poli/mypage.do?member_seq=" + member_seq;
            } else {
               return false;
            }
         }
      })
      
      ajax01.call();
   }
   
   /* 
   * bill 즐겨찾기 취소 
   */
   
   function isDeleteFav(bill_id){
      
      var member_seq = $("#member_seq").val().trim();
      var bill_id = bill_id;
      
      console.log("member_seq : " + member_seq + " bill_id : " + bill_id);
      
      
      var Fav = {
            "member_seq" : member_seq,
            "bill_id" : bill_id
      }
      
      console.log(Fav);      
      
      var ajax02 = new ComAjax();
      ajax02.url("/poli/isBillFav.do");
      ajax02.param(Fav);
      
      ajax02.success(function(msg){
         console.log(msg);
         
         if(msg.isBillFav == false){            
            var cofirmIsFav = window.confirm("즐겨찾기 등록되어 있지 않은 의안입니다. \n 즐겨찾기 등록 하시겠습니까?");
            
            if(cofirmIsFav){
               insertBillFav(member_seq, bill_id);
            } else {
               return false;
            }
            
         } else {
            cancleBillFav(bill_id, member_seq);
         }
      });
      
      ajax02.call();      
      
   }
   
   function cancleBillFav(bill_id, member_seq){
      console.log(bill_id, member_seq);
      
      var Cancle = {
            "bill_id" : bill_id,
            "member_seq" : member_seq            
      }
      
      var ajax03 = new ComAjax();
      ajax03.url("/poli/cancleBillFav.do");
      ajax03.param(Cancle);
      
      ajax03.success(function(res){
         console.log(res);
         
         if(res.isCancle == true){
            alert("성공적으로 즐겨찾기 취소가 완료되었습니다.");
         }
      })
      
      ajax03.call();

   }
	


</script>
<!-- END :: JAVASCRIPT -->

<body>
	<%@ include file="/WEB-INF/views/form/header.jsp"%>

	<input type="hidden" id="member_seq" value="${principal.member_seq }" />

	<div class="nanum_m">
		<div class="bill">
			<h1 class="nanum" align="center">의안 현황</h1>
			<br />
			<table class="table table-hover">
				<colgroup>
					<col width="100">
					<col width="150">
					<col width="700">
					<col width="150">
					<col width="150">
					<col width="150">
					<col width="200">
					<col width="150">
					<col width="200">
					<col width="150">
				</colgroup>
				<thead>
					<tr>
						<th>의안번호</th>
						<th>의안구분</th>
						<th>의안명</th>
						<th>제안자 구분</th>
						<th>제안일자</th>
						<th>의결일자</th>
						<th>의결결과</th>
						<th>주요내용</th>
						<th>심사진행상태</th>
						<th>즐겨찾기</th>

					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list} ">
							<tr>
								<td colspan="10">-------------의안이 없습니다.------------</td>
							</tr>
						</c:when>
						<c:otherwise>
							<!-- 모든 조건이 거짓일때 -->
							<c:forEach items="${list }" var="bill">
								<tr>
									<td>${bill.bill_id}</td>
									<td>${bill.bill_type}</td>
									<td>${bill.bill_name}</td>
									<td>${bill.bill_proposer}</td>
									<td>${bill.propose_date}</td>
									<td>${bill.decide_date}</td>
									<td>${bill.decide_result}</td>
									<td><a href="#"
										onclick="window.open('${bill.content_address}','의안 상세', 'width=590, height=500, top=250, left=500, resizable=yes, scrollbars=yes, status=no');"
										style="cursor: pointer">${bill.bill_content}</a></td>
									<td>${bill.bill_status}</td>

									<td><span onclick="isFav(${bill.bill_id});">등록</span>&nbsp;|&nbsp;<span
										id="${bill.bill_id }" onclick="isDeleteFav(${bill.bill_id});">취소</span></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div class="text-center">
				<ul class="pagination">
					<c:if test="${pageMake.prev}">
						<li class="page-item"><a class="page-link"
							href="/poli/billlist.do${pageMake.makeQuery(pageMake.startPage - 1)}">이전</a></li>
					</c:if>

					<c:forEach begin="${pageMake.startPage}" end="${pageMake.endPage}"
						var="idx">
						<li class="page-item"><a class="page-link"
							href="/poli/billlist.do${pageMake.makeQuery(idx)}">${idx}</a></li>
					</c:forEach>

					<c:if test="${pageMake.next && pageMake.endPage > 0}">
						<li class="page-item"><a class="page-link"
							href="/poli/billlist.do${pageMake.makeQuery(pageMake.endPage + 1)}">다음</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>




	<%@ include file="/WEB-INF/views/form/footer.jsp"%>
</body>
</html>