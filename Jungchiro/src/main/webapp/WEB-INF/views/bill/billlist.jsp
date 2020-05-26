<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정치로</title>
</head>
<!-- START :: CSS -->
<style type="text/css">

	span{
		cursor: pointer;
	}
	
	li {
		list-style: none;
		float: left;
		padding: 6px;
	}


</style>
<!-- END :: CSS -->

<!-- START :: JAVASCRIPT -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript" src="/poli/resources/js/ajaxCommon.js"></script>
<script type="text/javascript">
	
	/* 
	* bill 즐겨찾기 등록 
	*/
	
	function isFav(board_id){
		
		var member_seq = $("#member_seq").val().trim();
		var bill_id = board_id;
		
		console.log("member_seq : " + member_seq + " bill_id : " + bill_id);
		
		
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
	
	function isDeleteFav(board_id){
		
		var member_seq = $("#member_seq").val().trim();
		var bill_id = board_id;
		
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
				
				if(confirmFav){
					insertBillFav(member_seq, board_id);
				} else {
					return false;
				}
				
			} else {
				insertBillFav(member_seq, bill_id);
			}
		});
		
		ajax02.call();		
		
	}
	


</script>
<!-- END :: JAVASCRIPT -->

<body>
	<%@ include file="/WEB-INF/views/form/header.jsp"%>
	
	<input type="hidden" id="member_seq" value="${principal.member_seq }"/>

	<h1>의안게시판</h1>
	<table border="1">
		<colgroup>
			<col width="100">
			<col width="100">
			<col width="500">
			<col width="100">
			<col width="100">
			<col width="100">
			<col width="100">
			<col width="100">
			<col width="100">
			<col width="100">
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
						<tr id="isFav">
							<td>${bill.bill_id}</td>
							<td>${bill.bill_type}</td>
							<td>${bill.bill_name}</td>
							<td>${bill.bill_proposer}</td>
							<td>${bill.propose_date}</td>
							<td>${bill.decide_date}</td>
							<td>${bill.decide_result}</td>
							<td><a href="${bill.content_address}">${bill.bill_content}</a></td>
							<td>${bill.bill_status}</td>
							<td><span onclick="isFav(${bill.bill_id});">등록</span>&nbsp;|&nbsp;<span id="${bill.bill_id }" onclick="isDeleteFav(${bill.bill_id});">취소</span></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
		<tfoot>

			<tr>
				<td colspan="10">
				
					<ul>
						<c:if test="${pageMake.prev}">
							<li><a style="color: black"
								href="/poli/billlist.do${pageMake.makeQuery(pageMake.startPage - 1)}">이전</a></li>
						</c:if>

						<c:forEach begin="${pageMake.startPage}"
							end="${pageMake.endPage}" var="idx">
							<li><a href="/poli/billlist.do${pageMake.makeQuery(idx)}">${idx}</a></li>
						</c:forEach>

						<c:if test="${pageMake.next && pageMake.endPage > 0}">
							<li><a
								href="/poli/billlist.do${pageMake.makeQuery(pageMake.endPage + 1)}">다음</a></li>
						</c:if>
					</ul>
				</td>
			</tr>
		</tfoot>
	</table>

	<%@ include file="/WEB-INF/views/form/footer.jsp"%>
</body>
</html>