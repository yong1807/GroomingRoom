<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="resources/css/profileCommon.css" type="text/css">
<style>

h1{
	position: absolute;
	right: 600px;
	top: 80px;
	font-size: 40px;
}

.arrowBtn{
	position: absolute;
	border: none;
	background-color: white;
	font-size: 40px;
	right: 830px;
	top: 105px;
}

.detailBox{
	width: 800px;
	height: 400px;
	border: 1px solid black;
	border-radius: 50px;
}

th, td{
	border: none;
	border-collapse: collapse;
	padding: 5px 10px;
}

.topRow{
	height: 50px;
	border-bottom: 1px solid black;
	text-align: center;
}

table{
	border-collapse: collapse;
	width: 700px;
	table-layout: fixed;
	border: none;
	position: relative;
	left: 45px;
}

.sentSubject{
	width: 350px;
}

.sentContent {
	border: 1px solid black;
	height: 250px;
	font-size: 16px;
}


.delBtn{
	position: relative;
	left: 80%;
	top: 10%;
	height: 35px;
	width: 80px;
	background-color: rgb(94, 94, 94);
	border: none;
	border-radius: 10px;
	color: white;
}

</style>
</head>
<body>
	<nav>
		<div class="logo">
			<img src="resources/img/logo.jpg" alt="logoImage" width=150 height=120/>
		</div>
		<button onclick="location.href='./pfNoteList'" class="arrowBtn"> ← </button>
		<h1>내가 쓴 쪽지</h1>
	</nav>
	<main>
		<div class="profButtonBox">
			<button onclick="location.href='./pfNormal'" class="profButton">내 프로필</button>
			<button onclick="location.href='./pfNoteList'" class="profButton">쪽지함</button>
			<button onclick="location.href='./pfWrite'" class="profButton">내가 쓴 글</button>
			<button onclick="location.href='./pfNotiList'" class="profButton">알림함</button>
			<button onclick="location.href='./pfReportList'" class="profButton">신고 내역</button>
		</div>
		<div class="detailBox">
			<table>
				<tr class="topRow">
					<td class="sentSubject">제목</td>
					<td>|&nbsp;&nbsp;&nbsp;날짜</td>
					<td>|&nbsp;&nbsp;&nbsp;받는 사람</td>
				</tr>
				<tr>
					<td colspan="3" class="sentContent">내용</td>
				</tr>
			</table>
			<button onclick="del()" class="delBtn">삭제하기</button>
		</div>
	</main>
</body>
<script>
</script>
</html>