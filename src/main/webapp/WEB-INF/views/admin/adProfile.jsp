<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
table, th, td {
	margin: 10px;
	border-bottom: 1px solid black;
	border-collapse: collapse;
	padding: 5px 10px;
	height: 80px;
}

table {
	float: left;
}

button {
	float: left;
	display: flex;
	align-items: left;
}

::-webkit-scrollbar {
	display: none;
}

.profile {
	width: 30%;
	height: 300px;
	float: left;
	border: solid;
	padding: 10px;
}

.animalprofile {
	width: 30%;
	height: 300px;
	float: left;
	border: solid;
	float: left;
}

</style>
</head>
<body>
	<div class="logo">
		<img src="/gudi/resources/img/logo.jpg" alt="logoImage" width=150 height=120 />
	</div>
	<table>
		<tr>
			<th>
				<button
					onclick="location.href='adProfile?ad_id=${sessionScope.ad_id}'"
					class="button">내 프로필</button>
			</th>
		</tr>
		<tr>
			<th>
				<button
					onclick="location.href='adWrite?ad_id=${sessionScope.ad_id}'"
					class="button">내가 쓴 글</button>
			</th>
		</tr>
		<tr>
			<th>
				<button
					onclick="location.href='adUserManage?ad_id=${sessionScope.ad_id}'"
					class="button">회원 관리</button>
			</th>
		</tr>
		<tr>
			<th>
				<button
					onclick="location.href='adReservationManage?ad_id=${sessionScope.ad_id}'"
					class="button">회원 예약 관리</button>
			</th>
		</tr>
		<tr>
			<th>
				<button
					onclick="location.href='adInquiry?ad_id=${sessionScope.ad_id}'"
					class="button">일반 문의 관리</button>
			</th>
		</tr>
		<tr>
			<th>
				<button
					onclick="location.href='adReport?ad_id=${sessionScope.ad_id}'"
					class="button">신고 문의 관리</button>
			</th>
		</tr>
	</table>
	<table>
		<tr>
			<th>ID</th>
			<th>${admin.ad_id}</th>
		</tr>
		<tr>
			<th>PW</th>
			<th>${admin.ad_pw}</th>
		</tr>
		<tr>
			<th>이름</th>
			<th>${admin.ad_name}</th>
		</tr>
		<tr>
			<th>e-mail</th>
			<th>${admin.ad_email}</th>
		</tr>
		<tr>
			<th>전화번호</th>
			<th>${admin.ad_phone}</th>
		</tr>
		<tr>
			<th>직급</th>
			<th>${admin.ad_position}</th>
		</tr>
		<tr>
			<th colspan="2"><button onclick="location.href='adminprofileUpdateForm?ad_id=${sessionScope.ad_id}'" class = "button">프로필 수정</button></th>
		</tr>
	</table>
		<select id="positionsearch" name="positionsearch">
			<option value="Boss">사장</option>
			<option value="headofdepartment">부장</option>
			<option value="Teamleader">팀장</option>
			<option value="AssistantManager">대리</option>
			<option value="Employee">사원</option>
		</select>
	<div style = "width : 45%; height : 500px; overflow : auto">
	<table width = "45%" border = "0" cellspacing = "0" cellpadding = "0" >
		<tr>
			<th>ID</th>
			<th>이름</th>
			<th>직급</th>
		</tr>
		<tbody id="adminlist">

		</tbody>
	</table>
	</div>
</body>
<script>
adminlistCall();

	
	function adminlistCall(){
		$.ajax({
			type : 'get',
			url : 'adminlistCall',
			data : {},
			dataType : 'json',
			success : function(data) {
				console.log(data);
				
					console.log("어드민 리스트 : "+ data.adminlist);
					drawList(data.adminlist);
				
			},
			error : function(e) {
				console.log(e);
			}
		});
	}
	
	function drawList(adminlist) {
		console.log("drawList : " + adminlist);
		var content = '';
		adminlist.forEach(function(item, ad_id) {
					content += '<tr>';
					content += '<th>'+item.ad_id+'</th>';
					content += '<th>'+item.ad_name+'</th>';
					content += '<th>'+item.ad_position+'</th>';
					content += '<th><button id="adpfdetail" onclick='+'"location.href='+"'adpfdetail?ad_id="+item.ad_id+"'"+'">상세보기</button></th>';
					content += '<tr>';
				});
		$('#adminlist').empty();
		$('#adminlist').append(content);
	}
	
	console.log(adminlistCall);

</script>
</html>


