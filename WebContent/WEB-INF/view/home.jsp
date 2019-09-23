<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ru">
<head>
<meta charset="UTF-8">
<title>Определитель грибов</title>
<link rel="stylesheet" href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.min.css" />">
<link href="https://fonts.googleapis.com/css?family=Pacifico&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value="/css/fullpage.css" />">
<script type="text/javascript" src="<c:url value="/webjars/jquery/3.4.1/jquery.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/vendors/scrolloverflow.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/webjars/bootstrap/4.3.1/js/bootstrap.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/fullpage.js" />"></script>

<style>
.section-1 {
	background: url("<c:url value="/img/andrew-ridley-6KCS---7jbc-unsplash(1).jpg" />") no-repeat center center;
	background-size: cover;
}
.btn {
	border-width: 3px;
}
</style>
</head>
<body>

<div id="fullpage">
	<div class="section section-1">
	<div class="container-fluid h-100 row m-0 align-items-center" style="height: 100vh; background-color:rgba(59, 11, 0, 0.5);">
	<div class="container-fluid">
	<h1 class="d-none d-sm-block text-center text-white display-3 mb-5" style="font-family: 'Pacifico', cursive;">Определитель грибов</h1>
	<h1 class="d-block d-sm-none text-center text-white mb-5" style="font-family: 'Pacifico', cursive;">Определитель грибов</h1>
	<div class="text-center">
	<a href="findMushroom"><button type="button" class="btn-lg btn btn-outline-light mb-3 ml-1 mr-1">Определить гриб</button></a> <a href="addMushroom"><button type="button" style="width:197px;" class="btn-lg btn mb-3 btn-outline-light ml-1 mr-1">Добавить новый</button></a>
	</div>
	</div>
	<div class="container-fluid fixed-bottom">
	
	<div class="text-white text-center container-fluid">
	<h5>О программе ⯆</h5>
	</div>
	
	<a style="background-color:black;color:white;text-decoration:none;padding:4px 6px;font-family:-apple-system, BlinkMacSystemFont, &quot;San Francisco&quot;, &quot;Helvetica Neue&quot;, Helvetica, Ubuntu, Roboto, Noto, &quot;Segoe UI&quot;, Arial, sans-serif;font-size:12px;font-weight:bold;line-height:1.2;display:inline-block;border-radius:3px" href="https://unsplash.com/@aridley88?utm_medium=referral&amp;utm_campaign=photographer-credit&amp;utm_content=creditBadge" target="_blank" rel="noopener noreferrer" title="Download free do whatever you want high-resolution photos from Andrew Ridley">Photo by <span style="display:inline-block;padding:2px 3px"><svg xmlns="http://www.w3.org/2000/svg" style="height:12px;width:auto;position:relative;vertical-align:middle;top:-2px;fill:white" viewBox="0 0 32 32"><title>unsplash-logo</title><path d="M10 9V0h12v9H10zm12 5h10v18H0V14h10v9h12v-9z"></path></svg></span><span style="display:inline-block;padding:2px 3px">Andrew Ridley</span></a>
	</div>
	</div>
	</div>
	<div class="section">
	<div class="container text-justify text-white mt-4 mb-4">
	<p>«Не знаешь гриб — не бери!» скажет вам кто-то, но не я. Не знаете гриб — рассмотрите получше или сфотографируйте, а потом опознайте с помощью этого определителя. Наверняка он съедобный, а если все же нет, помойте руки получше и порадуйтесь новым знаниям об окружающем мире.</p> 
	<p></p>
	<p>Это приложение создано для изучения паттерна MVC в великолепный осенний день, когда можно было бы пойти в лес за грибами, но надо было учиться, чтобы опыт программирования поскорее догнал опыт грибника.</p>
	<p>В приложении использовались:</p>
	<ul>
	<li><a href="https://www.java.com/en/" target="_blank" class="text-white">Java</a></li>
	<li><a href="https://spring.io/" target="_blank" class="text-white">Spring 5</a></li>
	<li><a href="https://in.relation.to/" target="_blank" class="text-white">Hibernate 5</a></li>
	<li><a href="https://www.postgresql.org/download/" target="_blank" class="text-white">PostgreSQL</a></li>
	<li><a href="https://getbootstrap.com/" target="_blank" class="text-white">Bootstrap 4</a></li>
	<li><a href="https://alvarotrigo.com/fullPage/" target="_blank" class="text-white">Fullpage.js</a></li>
	</ul>
	<div class="mt-5">
	<p>Если вам нужен Java jonior или вы хотите обсудить удивительное царство грибов, со мной можно связаться:</p>
	<ul>
	<li>hexronimo6@protonmail.com</li>
	<li><a href="https://github.com/Hexronimo?tab=repositories" class="text-white" target="_blank">GitHub</a></li>
	<li><a href="https://www.linkedin.com/in/olga-kashtanova-005a90188/" class="text-white" target="_blank">LinkedIn</a></li>
	</ul>
	</div>
	</div>
	
</div>
</div>

<script>
$(document).ready(function() {
	$('#fullpage').fullpage({
		//options here
		scrollOverflow: true,
		sectionsColor: ['#254400', '#254400', '#7BAABE', 'whitesmoke', '#000'],

	});


});
</script>

</body>
</html>