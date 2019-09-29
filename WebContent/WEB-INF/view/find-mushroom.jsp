<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored ="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ru">
<head>
<meta charset="UTF-8">
<title>Определитель грибов</title>
<link href="https://fonts.googleapis.com/css?family=Pacifico&amp;display=swap" rel="stylesheet">
<link rel="stylesheet" href='<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.min.css" /> '>
<link rel="stylesheet" href='<c:url value="/css/fullpage.css" /> '>

<script type="text/javascript" src="<c:url value="/webjars/jquery/3.4.1/jquery.min.js" /> "></script>
	<script type="text/javascript" src="<c:url value="/js/vendors/scrolloverflow.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/fullpage.extensions.min.js" /> "></script>
<script type="text/javascript" src="<c:url value="/webjars/bootstrap/4.3.1/js/bootstrap.min.js" /> "></script>



<style>
.sqr-image {
width:250px;
height:200px;
border-radius: 9px;

}
.imgAsRadio {
	position:absolute;
	width:100%;
	height:100%;
	top:0;
	left:0;
	opacity:0;
	cursor:pointer;
}

.imgAsRadio+img {
	border-radius: 13px;
}

.imgAsRadio:checked+img {
	border: 6px solid #dc3545;
}
.imgAsRadio:checked+.color {
	border: 6px solid #c8b7b7;
}
.color {
width: 64px;
height: 64px;
border-radius: 32px;
}
.btn {
	border-width: 3px;
}

.icon {
	border: 6px solid #c8b7b7;
	border-radius: 13px;
}
</style>
</head>


<body style="background-color: #f5f3f1;">
<div id="fullpage">
<form method="post" action="finding" id="finding">
<div class="section pt-5 section-1">
<div class="container-fluid p-0 bg-danger mb-5 text-white fixed-top">
<div class="container pt-4 pb-4">
<a href="./" class="text-white h5 d-inline-block mr-4 mt-1 mb-1 font-weight-bold">На главную</a>
</div>
</div>

<div class="container mt-5 pt-5 pb-5">
<h1 style="font-family: 'Pacifico', cursive;" class="pb-3">Определитель грибов</h1>
<div class="container-fluid p-0 text-justify">
В этом разделе вы сможете найти грибы наиболее подходящие под те признаки, что вы запомнили. Отметьте характеристики, в которых вы наиболее уверены, для остальных выберите "Не учитывать в поиске".
</div>

<h1 class="mt-5 mb-5" style="font-family: 'Pacifico', cursive;">Шляпка</h1>	
<div class="row">
	<c:forEach items="${caps}" var="cap">				
		<div class="col-lg-2 col-md-4 col-6">
			<div class="w-100 position-relative">
			<input type="radio" class="imgAsRadio" id="capID" name="capID" value='<c:out value="${cap.id}" />' required>
			<img class="img-fluid icon mb-1" src="data:image/svg+xml;base64,<c:out value="${cap.fileAsString}" />">
			</div>
			<p class="text-center text-uppercase" style="line-height:1;"><small class="font-weight-bold"><c:out value="${cap.name}" /></small></p>
		</div>
	</c:forEach>
	</div>
	<br>
	<p>
		Можно выбрать несколько наиболее подходящих цветов.
		</p>
		<div class="row colorsrow">
		<c:forEach items="${colors}" var="clr">
		<div class="col-lg-3">
		<div class="media mb-3">
		<div class="position-relative">
		<input type="checkbox" class="imgAsRadio" id="capColorID" name="capColorID" value='<c:out value="${clr.id}" />'>
		<div class="mr-3 color" style="background-image: linear-gradient(#<c:out value='${clr.hex1}' />, #<c:out value='${clr.hex2}' />);">
		</div>
		</div>
		<div class="media-body align-self-center">
    	<p class="text-uppercase" style="line-height:1;"><small class="font-weight-bold"><c:out value="${clr.name}" /></small></p>
    	</div>
		</div>
		</div>
		</c:forEach>
		</div>

</div>
</div>

<div class="section section-2">
<div class="container mt-5 mb-5">
<h1 class="mt-5 mb-5" style="font-family: 'Pacifico', cursive;">Обратная сторона шляпки</h1>	
<div class="row">
	<c:forEach items="${gills}" var="gill">				
		<div class="col-lg-2 col-md-4 col-6">
			<div class="w-100 position-relative">
			<input type="radio" class="imgAsRadio" id="gillID" name="gillID" value='<c:out value="${gill.id}" />' required>
			<img class="img-fluid icon mb-1" src="data:image/svg+xml;base64,<c:out value="${gill.fileAsString}" />">
			</div>
			<p class="text-center text-uppercase" style="line-height:1;"><small class="font-weight-bold"><c:out value="${gill.name}" /></small></p>
		</div>
	</c:forEach>
</div>
<br>
<p>
		Можно выбрать несколько наиболее подходящих цветов.
		</p>
		<div class="row colorsrow">
		<c:forEach items="${colors}" var="clr">
		<div class="col-lg-3">
		<div class="media mb-3">
		<div class="position-relative">
		<input type="checkbox" class="imgAsRadio" id="gillColorID" name="gillColorID" value='<c:out value="${clr.id}" />'>
		<div class="mr-3 color" style="background-image: linear-gradient(#<c:out value='${clr.hex1}' />, #<c:out value='${clr.hex2}' />);">
		</div>
		</div>
		<div class="media-body align-self-center">
    	<p class="text-uppercase" style="line-height:1;"><small class="font-weight-bold"><c:out value="${clr.name}" /></small></p>
    	</div>
		</div>
		</div>
		</c:forEach>
		</div>
		</div>
		</div>

<div class="section section-3">
<div class="container mt-5 mb-5">
<h1 class="mt-5 mb-5" style="font-family: 'Pacifico', cursive;">Узор на шляпке</h1>	
<div class="row">
	<c:forEach items="${scales}" var="scale">				
		<div class="col-lg-2 col-md-4 col-6">
			<div class="w-100 position-relative">
			<input type="radio" class="imgAsRadio" id="scaleID" name="scaleID" value='<c:out value="${scale.id}" />' required>
			<img class="img-fluid icon mb-1" src="data:image/svg+xml;base64,<c:out value="${scale.fileAsString}" />">
			</div>
			<p class="text-center text-uppercase" style="line-height:1;"><small class="font-weight-bold"><c:out value="${scale.name}" /></small></p>
		</div>
	</c:forEach>
</div>	
</div>
</div>

<div class="section section-3">
<div class="container mt-5 mb-5">
	<h1 class="mt-5 mb-5" style="font-family: 'Pacifico', cursive;">Ножка</h1>	
<div class="row">
	<c:forEach items="${stipes}" var="stipe">				
		<div class="col-lg-2 col-md-4 col-6">
			<div class="w-100 position-relative">
			<input type="radio" class="imgAsRadio" id="stipeID" name="stipeID" value='<c:out value="${stipe.id}" />' required>
			<img class="img-fluid icon mb-1" src="data:image/svg+xml;base64,<c:out value="${stipe.fileAsString}" />">
			</div>
			<p class="text-center text-uppercase" style="line-height:1;"><small class="font-weight-bold"><c:out value="${stipe.name}" /></small></p>
		</div>
	</c:forEach>
</div>
<br>
<p>
		Можно выбрать несколько наиболее подходящих цветов.
		</p>
		<div class="row colorsrow">
		<c:forEach items="${colors}" var="clr">
		<div class="col-lg-3">
		<div class="media mb-3">
		<div class="position-relative">
		<input type="checkbox" class="imgAsRadio" id="stipeColorID" name="stipeColorID" value='<c:out value="${clr.id}" />'>
		<div class="mr-3 color" style="background-image: linear-gradient(#<c:out value='${clr.hex1}' />, #<c:out value='${clr.hex2}' />);">
		</div>
		</div>
		<div class="media-body align-self-center">
    	<p class="text-uppercase" style="line-height:1;"><small class="font-weight-bold"><c:out value="${clr.name}" /></small></p>
    	</div>
		</div>
		</div>
		</c:forEach>
		</div>
</div>
</div>


<div class="section section-4">
<div class="container mt-5 mb-5">
<h1 class="mt-5 mb-5" style="font-family: 'Pacifico', cursive;">Юбочка</h1>	
<div class="row">
	<c:forEach items="${skirts}" var="skirt">				
		<div class="col-lg-2 col-md-4 col-6">
			<div class="w-100 position-relative">
			<input type="radio" class="imgAsRadio" id="skirtID" name="skirtID" value='<c:out value="${skirt.id}" />' required>
			<img class="img-fluid icon mb-1" src="data:image/svg+xml;base64,<c:out value="${skirt.fileAsString}" />">
			</div>
			<p class="text-center text-uppercase" style="line-height:1;"><small class="font-weight-bold"><c:out value="${skirt.name}" /></small></p>
		</div>
	</c:forEach>
</div>
</div>
</div>

<div class="section section-4">
<div class="container mt-5 mb-5">
<h1 class="mt-5 mb-5" style="font-family: 'Pacifico', cursive;">Размер</h1>	
<div class="row">
	<c:forEach items="${sizes}" var="size">				
		<div class="col-lg-2 col-md-4 col-6">
			<div class="w-100 position-relative">
			<input type="radio" class="imgAsRadio" id="sizeID" name="sizeID" value='<c:out value="${size.id}" />' required>
			<img class="img-fluid icon mb-1" src="data:image/svg+xml;base64,<c:out value="${size.fileAsString}" />">
			</div>
			<p class="text-center text-uppercase" style="line-height:1;"><small class="font-weight-bold"><c:out value="${size.name}" /></small></p>
		</div>
	</c:forEach>
</div>
</div>
</div>

<div class="section section-5">
<div class="container-fluid text-center">
<button class="mt-5 mb-5 btn btn-lg btn-success" type="button" id="submit">Искать</button>

<div class="container mt-3" id="result">
<div class="row">
<c:forEach items="${mushrooms}" var="mushroom">
<div class="col-lg-3 text-center col-md-4 col-xs-2">

<button type="button" class="imgAsRadio" data-toggle="modal" data-target="#modal" onclick="toModalFunction('${mushroom.key.id}')"></button>
<div class="sqr-image img-fluid  m-auto mb-1" style="background:url('data:image/jpeg;base64,<c:out value="${mushroom.value}" />')no-repeat top center; background-size: cover;"></div>
<small class="font-weight-bold text-uppercase"><c:out value="${mushroom.key.name}" /></small>
</div>
</c:forEach>

</div>
</div>
</div>
</div>
</form>



</div>

<!-- Modal -->
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div id="modalbody" class="modal-body">
      <img class="img-fluid" src="data:image/jpeg;base64,<c:out value="${mainPhoto}" />"><br><br>
      <c:if test="${not empty mushroom}">
      <div class="row">
      <c:forEach items="${photos}" var="p">
      <div class="col-4">
      <a href="<c:url value="/img/mushrooms/" /><c:out value="${p}" />" target="_blank">
      <div class="sqr-image img-fluid  m-auto mb-1" style="background:url('data:image/jpeg;base64,<c:out value="${p}" />')no-repeat top center; background-size: cover;"></div>
      </a>
      </div>
      </c:forEach>
      </div>
      <br>
      <h5 class="font-weight-bold"><c:out value="${mushroom.name}" /></h5>
      <c:out value="${mushroom.family.name}" /><br><br>
      <div class="text-justify"><c:out value="${mushroom.description}" /></div>
      <br><br>
      <c:if test="${mushroom.eatable = true}">
      <div class="text-success">Съедобный</div>
      </c:if>
      <c:if test="${mushroom.eatable = false}">
      <div class="text-danger">Несъедобный</div>
      </c:if>
      <div class="text-justify"><c:out value="${mushroom.eatableDesc}" /></div>
      </c:if>
      <br>
      Растёт в: 
      <div class="row">
      <c:forEach items="${forests}" var="f">
      <div class="col-4 mb-2">
      <img class="img-fluid" src='data:image/jpeg;base64,${f.fileAsString}'>
      <c:out value="${f.name}" />
      </div>
      </c:forEach>
      </div>
      </div>
    
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Закрыть</button>
      </div>

    </div>
  </div>
</div>

<script>

	$(document).ready(function() {

		$('#submit').on('click', function (){
			var formElement = document.querySelector('form');
			var dataForm = new FormData(formElement);
			
		    $.ajax({
		        type     : 'POST',
		        url      : 'finding',
		        data     : dataForm,
		        processData: false,
		        contentType: false,
		        success  : function(mushrooms) {
		        	
		        	$('#result').load(' #result', function() {});
		        }
		    });
			});
		
$('#fullpage').fullpage({
	//options here
	scrollOverflow : true,
	fixedElements : '.fixed-top, .modal',
	scrollOverflowReset : true,
	navigation: true,
	navigationPosition: 'right'
});
	});

	function toModalFunction(id) {
	    $.ajax({
	        type     : 'POST',
	        url      : 'getMushroom',
	        data     : {
		        "id" : id
	        },

	        success  : function(mushroom, photos, forests) {
	        	
	        	$('#modalbody').load(' #modalbody', function() {});
	        }
	    });
	}
</script>

</body>
</html>
