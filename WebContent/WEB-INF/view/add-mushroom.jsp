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
<script type="text/javascript" src="<c:url value="/js/fullpage.js" /> "></script>
<script type="text/javascript" src="<c:url value="/webjars/bootstrap/4.3.1/js/bootstrap.min.js" /> "></script>
<script type="text/javascript" src="<c:url value="/js/bootstrap-combobox.js" />"></script>



<style>
.form-control {
	border: 2px solid #c8b7b7;
	background-color: #fff;
}

.btn {
	border-width: 3px;
}

.icon {
	border: 6px solid #c8b7b7;
	border-radius: 13px;
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

.form-control:focus, .custom-file-input:focus ~ .custom-file-label,
	.custom-file-input:focus {
	color: #495057;
	background-color: #fff;
	border-color: #bea08e;
	outline: 0;
	box-shadow: 0 0 0 .2rem rgb(235, 202, 182);
}

.custom-file-label::after {
	height: auto;
	content: "Выбрать";
	background-color: #dc3545;
	border-left: 0;
	border-radius: 0 3px 3px 0;
	color: #fff;
	top: -2px;
	right: -2px;
	bottom: -2px;
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
.color {
width: 64px;
height: 64px;
border-radius: 32px;
}

.small .color{
width:32px;
height:32px;
}

.section-8 {
	background: url("<c:url value="/img/andrew-ridley-6KCS---7jbc-unsplash(1).jpg" />") no-repeat center center;
	background-size: cover;
}

</style>
</head>


<body>

<div id="fullpage">

<form method="POST" id="mainForm" action="createMushroom" enctype="multipart/form-data">

<div class="section section-1">
<input value="${sid}" name="sid" type="hidden">
<div class="container-fluid p-0 bg-danger text-white fixed-top">
<div class="container pt-4 pb-4">
<a href="./" class="text-white h5 d-inline-block mr-4 mt-1 mb-1 font-weight-bold">На главную</a>
<a href="listMushrooms" class="text-white h5 d-inline-block mt-1 mb-1 font-weight-bold">Посмотреть все</a>
</div>
</div>

<div class="container pt-5 pb-5 mt-5 mb-5">
<h1 class="mb-4" style="font-family: 'Pacifico', cursive;">Добавить гриб</h1>


<div class="row">
<div class="col-lg-6">

  <div class="form-group">
    <label for="mName">Название</label>
    <input type="text" class="form-control" id="mName" name="mName" value='<c:if test="${not empty mName}">${mName}</c:if>'>
  </div>

  <div class="form-group">
    <label for="mOtherNames">Другие названия</label>
    <input type="text" class="form-control" id="mOtherNames" name="mOtherNames" value='<c:if test="${not empty mOtherNames}">${mOtherNames}</c:if>'>
    <small class="form-text text-muted">Можно внести другие названия гриба через запятую</small>
  </div>

  <div class="form-group" style="max-width: 600px;">
    <label for="mDesc">Описание</label>
    <textarea class="form-control" id="mDesc" name="mDesc" rows="6" cols=""><c:if test="${not empty mDesc}">${mDesc}</c:if></textarea>
  </div>
  
  </div>
  <div class="col-lg-6">
  
  
<div class="form-group">
<label for="mFamily">Род или семейство</label>
	<select class="combobox form-control">
		<option	value="" selected="selected">Создать или выбрать</option>
		<c:forEach items="${families}" var="f">
			
				<option value="<c:out value="${f.name}" />"><c:out value="${f.name}" /></option>
			
		</c:forEach>
	</select><input type="hidden" id="theinput_hidden" value="">
	<small class="form-text text-muted">Например: опёнок, боровик, зонтик</small>
</div>
  
  <div class="custom-control mt-3 custom-radio">
    <input type="radio" class="custom-control-input" id="mEatable" name="eatable" value="1" required <c:if test="${eatable = true}">checked</c:if>>
    <label class="custom-control-label" for="mEatable">Съедобен</label>
  </div>
  <div class="custom-control custom-radio">
    <input type="radio" class="custom-control-input" id="mNotEatable" name="eatable" value="0" required <c:if test="${eatable = false}">checked</c:if>>
    <label class="custom-control-label" for="mNotEatable">Несъедобен</label>  
  </div>
  <small class="form-text text-muted mb-3">Влияет на картинку, которая будет отображаться в описании гриба</small>

  <div class="form-group" style="max-width: 600px;">
    <label for="mEatDesc">Подробнее про употребление в пищу</label>
    <textarea class="form-control" id="mEatDesc" name="nEatDesc" rows="6" cols=""><c:if test="${not empty mEatDesc}">${mEatDesc}</c:if></textarea>
  </div>
  
  </div>
  </div>
  </div>

  </div>
  
  <div class="section section-2">
  <div class="container pt-5 pb-5 mt-5 mb-5">
  	<h1 class="mb-5" style="font-family: 'Pacifico', cursive;">Фотографии</h1>
        <div class="custom-file">     
		  <input type="file" class="custom-file-input photos-file-label form-control" accept="image/jpeg, image/jpg" id="photosInput" name="photos" lang="ru" multiple="multiple">
		  <label class="custom-file-label photos-file-label form-control" for="photos">Изображение</label>
		</div>
		<button type="button" class="btn btn-success mt-3 mb-5" id="submitPhotos">Загрузить</button>
		<br>
		<div id="photosrow">
		<c:if test="${not empty thumbs}"><p>Выберите фотографию, которая будет главной</p></c:if>
		<div class="row">
			<c:forEach items="${thumbs}" var="t">
				<div class="col-lg-3 col-md-4 col-6 position-relative">
				<input type="radio" class="imgAsRadio" id="mainPhoto" name="mainPhoto" value='<c:out value="${t}" />' required>
				<img class="img-fluid" src="<c:url value="/img/tmp/thumbs/" /><c:out value="${t}" />" >
				</div>
			</c:forEach>
			</div>
		</div>
		
</div>
	</div>


<!-- Начало секции (Шляпка) -->
<div class="section section-3">
	<div class="container pt-5 mb-5" id="capscont">
		<h1 class="mt-5 mb-5" style="font-family: 'Pacifico', cursive;">Шляпка</h1>	

		<div class="row caps" id="capsrow">
		
	<!-- Кнопка Добавить, которая вызывает модальное окно внизу -->
			<div class="col-lg-2 col-md-4 col-6">
				<div class="w-100 icon" data-toggle="modal" data-target="#modal" onclick="typemPartFunction('Cap')">
					<img class="img-fluid mb-1" src="<c:url value="/img/add.svg" />" alt="">
				</div>
				<p class="text-center text-uppercase" style="line-height: 1;"><small class="font-weight-bold">Добавить</small></p>
			</div>

	<!-- Конец кнопки Добавить -->
	
			<c:forEach items="${caps}" var="cap">				
				<div class="col-lg-2 col-md-4 col-6">
					<div class="w-100 position-relative">
					<input type="radio" class="imgAsRadio" id="capID" name="capID" value='<c:out value="${cap.id}" />' required>
					<img class="img-fluid icon mb-1" src="data:image/jpg;base64,${cap.file}">
	<!-- img src изменен для чтения картинки из БД -->
					</div>
					<p class="text-center text-uppercase" style="line-height:1;"><small class="font-weight-bold"><c:out value="${cap.name}" /></small></p>
				</div>
			</c:forEach>		
		
		</div>

	<p class="clearfix"></p>
		
		<div class="media mb-3" data-toggle="modal" data-target="#modalcp">
		<img class="mr-3 color" src="<c:url value="/img/add.svg" />" alt="" style="border: 6px solid #c8b7b7;">
		<div class="media-body align-self-center">
    	<p class="text-uppercase" style="line-height:1;"><small class="font-weight-bold">Добавить цвет</small></p>
    	</div>
		</div>
		
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
<!-- Конец секции (Шляпка) -->

<!-- Начало секции (Обратная сторона шляпки) -->
<div class="section section-4">
	<div class="container pt-5 mb-5" id="gillscont">
		<h1 class="mb-5 mt-5" style="font-family: 'Pacifico', cursive;">Обратная сторона шляпки</h1>	
	
		
		<div class="row gills" id="gillsrow">
		
	<!-- Кнопка Добавить, которая вызывает модальное окно внизу -->
			<div class="col-lg-2 col-md-4 col-6">
				<div class="w-100 icon" data-toggle="modal" data-target="#modal" onclick="typemPartFunction('Gill')">
					<img class="img-fluid mb-1" src="<c:url value="/img/add.svg" />" alt="">
				</div>
				<p class="text-center text-uppercase" style="line-height: 1;"><small class="font-weight-bold">Добавить</small></p>
			</div>

	<!-- Конец кнопки Добавить -->
	
			<c:forEach items="${gills}" var="gill">				
				<div class="col-lg-2 col-md-4 col-6">
					<div class="w-100 position-relative">
					<input type="radio" class="imgAsRadio" id="gillID" name="gillID" value='<c:out value="${gill.id}" />' required>
					<img class="img-fluid icon mb-1" src="<c:url value="/img/icons/" /><c:out value="${gill.icon}" />">
					</div>
					<p class="text-center text-uppercase" style="line-height:1;"><small class="font-weight-bold"><c:out value="${gill.name}" /></small></p>
				</div>
			</c:forEach>		
		
		</div>
	
	<p class="clearfix"></p>
		
		<div class="media mb-3" data-toggle="modal" data-target="#modalcp">
		<img class="mr-3 color" src="<c:url value="/img/add.svg" />" alt="" style="border: 6px solid #c8b7b7;">
		<div class="media-body align-self-center">
    	<p class="text-uppercase" style="line-height:1;"><small class="font-weight-bold">Добавить цвет</small></p>
    	</div>
		</div>
		
		<div class="row colorsrow">
		<c:forEach items="${colors}" var="clr">
		<div class="col-lg-3">
		<div class="media mb-3">
		<div class="position-relative">
		<input type="radio" class="imgAsRadio" id="gillColorID" name="gillColorID" value='<c:out value="${clr.id}" />' required>
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
<!-- Конец секции (Обратная сторона шляпки) -->

<!-- Начало секции (Чешуйки) -->
<div class="section section-5">
	<div class="container pt-5 mb-5" id="scalescont">
		<h1 class="mb-5 mt-5" style="font-family: 'Pacifico', cursive;">Узор шляпки</h1>	
		<div class="row scales" id="scalesrow">
		
	<!-- Кнопка Добавить, которая вызывает модальное окно внизу -->
			<div class="col-lg-2 col-md-4 col-6">
				<div class="w-100 icon" data-toggle="modal" data-target="#modal" onclick="typemPartFunction('Scale')">
					<img class="img-fluid mb-1" src="<c:url value="/img/add.svg" />" alt="">
				</div>
				<p class="text-center text-uppercase" style="line-height: 1;"><small class="font-weight-bold">Добавить</small></p>
			</div>

	<!-- Конец кнопки Добавить -->
	
			<c:forEach items="${scales}" var="scale">				
				<div class="col-lg-2 col-md-4 col-6">
					<div class="w-100 position-relative">
					<input type="radio" class="imgAsRadio" id="scaleID" name="scaleID" value='<c:out value="${scale.id}" />' required>
					<img class="img-fluid icon mb-1" src="<c:url value="/img/icons/" /><c:out value="${scale.icon}" />">
					</div>
					<p class="text-center text-uppercase" style="line-height:1;"><small class="font-weight-bold"><c:out value="${scale.name}" /></small></p>
				</div>
			</c:forEach>		
		
		</div>

	</div>
</div>
<!-- Конец секции (Чешуйки) -->

<!-- Начало секции (Ножка) -->
<div class="section section-6">
	<div class="container pt-5 mb-5" id="stipescont">
		<h1 class="mb-5 mt-5" style="font-family: 'Pacifico', cursive;">Ножка</h1>	


		<div class="row stipes" id="stipesrow">
		
	<!-- Кнопка Добавить, которая вызывает модальное окно внизу -->
			<div class="col-lg-2 col-md-4 col-6">
				<div class="w-100 icon" data-toggle="modal" data-target="#modal" onclick="typemPartFunction('Stipe')">
					<img class="img-fluid mb-1" src="<c:url value="/img/add.svg" />" alt="">
				</div>
				<p class="text-center text-uppercase" style="line-height: 1;"><small class="font-weight-bold">Добавить</small></p>
			</div>

	<!-- Конец кнопки Добавить -->
	
			<c:forEach items="${stipes}" var="stipe">				
				<div class="col-lg-2 col-md-4 col-6">
					<div class="w-100 position-relative">
					<input type="radio" class="imgAsRadio" id="stipeID" name="stipeID" value='<c:out value="${stipe.id}" />' required>
					<img class="img-fluid icon mb-1" src="<c:url value="/img/icons/" /><c:out value="${stipe.icon}" />">
					</div>
					<p class="text-center text-uppercase" style="line-height:1;"><small class="font-weight-bold"><c:out value="${stipe.name}" /></small></p>
				</div>
			</c:forEach>		
		
		</div>

	<p class="clearfix"></p>
		
		<div class="media mb-3" data-toggle="modal" data-target="#modalcp">
		<img class="mr-3 color" src="<c:url value="/img/add.svg" />" alt="" style="border: 6px solid #c8b7b7;">
		<div class="media-body align-self-center">
    	<p class="text-uppercase" style="line-height:1;"><small class="font-weight-bold">Добавить цвет</small></p>
    	</div>
		</div>
		
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
<!-- Конец секции (Ножка) -->

<!-- Начало секции (Юбочка) -->
<div class="section section-7">
	<div class="container pt-5 mb-5" id="stipescont">
		<h1 class="mb-5 mt-5" style="font-family: 'Pacifico', cursive;">Юбочка</h1>	
		<div class="row skirts" id="skirtsrow">
		
	<!-- Кнопка Добавить, которая вызывает модальное окно внизу -->
			<div class="col-lg-2 col-md-4 col-6">
				<div class="w-100 icon" data-toggle="modal" data-target="#modal" onclick="typemPartFunction('Skirt')">
					<img class="img-fluid mb-1" src="<c:url value="/img/add.svg" />" alt="">
				</div>
				<p class="text-center text-uppercase" style="line-height: 1;"><small class="font-weight-bold">Добавить</small></p>
			</div>

	<!-- Конец кнопки Добавить -->
	
			<c:forEach items="${skirts}" var="skirt">				
				<div class="col-lg-2 col-md-4 col-6">
					<div class="w-100 position-relative">
					<input type="radio" class="imgAsRadio" id="skirtID" name="skirtID" value='<c:out value="${skirt.id}" />' required>
					<img class="img-fluid icon mb-1" src="<c:url value="/img/icons/" /><c:out value="${skirt.icon}" />">
					</div>
					<p class="text-center text-uppercase" style="line-height:1;"><small class="font-weight-bold"><c:out value="${skirt.name}" /></small></p>
				</div>
			</c:forEach>		
		
		</div>
	</div>
</div>
<!-- Конец секции (Юбочка) -->

<!-- Начало секции (Размер) -->
<div class="section section-7">
	<div class="container pt-5 mb-5" id="sizescont">
		<h1 class="mb-5 mt-5" style="font-family: 'Pacifico', cursive;">Размер</h1>	
		<div class="row skirts" id="sizesrow">
		
	<!-- Кнопка Добавить, которая вызывает модальное окно внизу -->
			<div class="col-lg-2 col-md-4 col-6">
				<div class="w-100 icon" data-toggle="modal" data-target="#modal" onclick="typemPartFunction('Size')">
					<img class="img-fluid mb-1" src="<c:url value="/img/add.svg" />" alt="">
				</div>
				<p class="text-center text-uppercase" style="line-height: 1;"><small class="font-weight-bold">Добавить</small></p>
			</div>

	<!-- Конец кнопки Добавить -->
	
			<c:forEach items="${sizes}" var="size">				
				<div class="col-lg-2 col-md-4 col-6">
					<div class="w-100 position-relative">
					<input type="radio" class="imgAsRadio" id="sizeID" name="sizeID" value='<c:out value="${size.id}" />' required>
					<img class="img-fluid icon mb-1" src="<c:url value="/img/icons/" /><c:out value="${size.icon}" />">
					</div>
					<p class="text-center text-uppercase" style="line-height:1;"><small class="font-weight-bold"><c:out value="${size.name}" /></small></p>
				</div>
			</c:forEach>		
		
		</div>
	</div>
</div>
<!-- Конец секции (Размер) -->

<!-- Начало секции (Лес) -->
<div class="section section-7 pt-5 pb-5">
	<div class="container pt-5 mb-5" id="forestscont">
		<h1 class="mb-5 mt-5" style="font-family: 'Pacifico', cursive;">Где растёт</h1>	
		<div class="row forests" id="forestsrow">
		
	<!-- Кнопка Добавить, которая вызывает модальное окно внизу -->
			<div class="col-lg-2 col-6">
				<div class="w-100 icon" data-toggle="modal" data-target="#modal" onclick="typemPartFunction('Forest')">
					<img class="img-fluid mb-1" src="<c:url value="/img/add.svg" />" alt="">
				</div>
				<p class="text-uppercase text-center" style="line-height: 1;"><small class="font-weight-bold">Добавить</small></p>
			</div>

	<!-- Конец кнопки Добавить -->
	
			<c:forEach items="${forests}" var="forest">				
				<div class="col-lg-4 col-md-5 col-12">
					<div class="w-100 position-relative">
					<input type="checkbox" class="imgAsRadio" id="forestID" name="forestID" value='<c:out value="${forest.id}" />' required>
					<img class="img-fluid icon mb-1" src="<c:url value="/img/icons/" /><c:out value="${forest.icon}" />">
					</div>
					<p class="text-center text-uppercase" style="line-height:1;"><small class="font-weight-bold"><c:out value="${forest.name}" /></small></p>
				</div>
			</c:forEach>		
		
		</div>
	</div>
</div>
<!-- Конец секции (Лес) -->

<div class="section section-8">
<div class="container-fluid h-100 row m-0 align-items-center" style="height: 100vh; background-color:rgba(59, 11, 0, 0.5);">
<div class="container-fluid text-center">
<button type="button" class="btn btn-lg btn-outline-light" id="presubmit" data-toggle="modal" data-target="#modalconfirm">Подтвердить и отправить</button>
</div>
</div>
</div>

<!-- Modal подтверждение создания гриба -->

<div class="modal fade" id="modalconfirm" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
<div class="modal-dialog modal-lg" role="document">
<div class="modal-content">
<div class="modal-header">
<h5 class="modal-title">Всё ли верно?</h5>
<button type="button" class="close" data-dismiss="modal" aria-label="Close">
<span aria-hidden="true">&times;</span>
</button>
</div>

<div class="modal-body">

<div class="card">
  <img class="card-img-top" class="img-fluid" id="confirmImage" alt="Card image cap">

<div class="card-body">
    <h5 class="card-title" id="confirmName"></h5>
<div id="confirmFamily"></div>    
<div id="confirmOtherNames"></div>
<div id="confirmDescription"></div>
<div id="confirmEatable"></div>
<div id="confirmFamily"></div>

<div class="row">
<div class="col-12"><h5 class="font-weight-bold mt-3">Шляпка</h5></div>
<div class="col-2 p-2" id="confirmCap"></div>
<div class="col-1 pt-2 small" id="confirmCapColor"></div>
<div class="col-2 p-2" id="confirmGill"></div>
<div class="col-1 pt-2 small" id="confirmGillColor"></div>
<div class="col-2 p-2" id="confirmScale"></div>

<div class="col-12"><h5 class="font-weight-bold mt-3">Ножка</h5></div>
<div class="col-2 p-2" id="confirmStipe"></div>
<div class="col-1 pt-2 small" id="confirmStipeColor"></div>
<div class="col-2 p-2" id="confirmSkirt"></div>

<div class="col-12"><h5 class="font-weight-bold mt-3">Размер</h5></div>
<div class="col-2 p-2" id="confirmSize"></div>
</div>



<div id="confirmForest"></div>
	</div>
</div>
<br>

<div class="modal-footer">
	<button type="button" class="btn btn-danger" data-dismiss="modal">Нет, внести изменения</button>
	<button type="submit" class="btn btn-success" id="submitMushroom">Да, сохранить</button>
</div>
</div>
</div>
</div>
</div>
</form>
</div>
			
<!-- Modal создание частей гриба -->
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Добавить</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>

<form method="post" id="submitMPart" action="createMPart" enctype="multipart/form-data"> 
	<input id="mPartType" name="mPartType" type="hidden">
      <div class="modal-body">   

         <div class="form-group">
    		<label for="mPartName">Название</label>
    		<input type="text" class="form-control" id="mPartName" name="mPartName">
  		</div>
  		 		
        <div class="custom-file">     
		  <input type="file" class="custom-file-input form-control" id="mPartNewIcon" name="mPartNewIcon" lang="ru">
		  <label class="custom-file-label icons-file-label form-control" for="mPartNewIcon">Изображение</label>
		  <small class="form-text text-muted">Файл .svg, квадрат (250x250), прозрачный фон или .jpg для лесов</small>
		</div>
		
      </div>

      
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Закрыть</button>
        <button type="button" class="btn btn-success" id="submitMPartBtn">Добавить</button>
      </div>
</form>
    </div>
  </div>
</div>

<!-- Modal создание цветов -->
<div class="modal fade" id="modalcp" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Добавить цвет</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>

<form method="post" id="submitColor" action="createColor"> 

      <div class="modal-body">   

         <div class="form-group">
    		<label for="colorName">Название</label>
    		<input type="text" class="form-control" id="colorName" name="colorName">
  		</div>
  		
  		<div class="form-group">
    		<label for="color-picker">Цвет 1</label>
    		<input type="color" class="form-control" id="color-picker" name="color1">
  		</div>
  		
  		<div class="form-group">
    		<label for="color-picker-1">Цвет 2</label>
    		<input type="color" class="form-control" id="color-picker-1" name="color2">
  		</div>

      </div>

      
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Закрыть</button>
        <button type="button" class="btn btn-success" id="submitColorBtn">Добавить</button>
      </div>
</form>
    </div>
  </div>
</div>


<script>


	//Для Bootstrap custom file input, чтобы отображалось название файла
	$('#mPartNewIcon').on('change', function() {
		//get the file name
		var fileName = $(this).val();
		var cleanFileName = fileName.replace('C:\\fakepath\\', " ");
		$(this).next('.icons-file-label').html(cleanFileName);
	});

	$(document).ready(function() {
		
		$('#presubmit').on('click', function (){

			$('#confirmImage').empty();
			$('#confirmName').empty();
			$('#confirmOtherNames').empty();
			$('#confirmDescription').empty();
			$('#confirmEatable').empty();
			$('#confirmCap').empty();
			$('#confirmGill').empty();
			$('#confirmScale').empty();
			$('#confirmStipe').empty();
			$('#confirmSkirt').empty();
			$('#confirmSize').empty();
			$('#confirmGillCOlor').empty();
			$('#confirmCapColor').empty();
			$('#confirmStipeColor').empty();
			$('#confirmForest').empty();
			$('#confirmFamily').empty();
			
			$('#confirmImage').attr('src', '<c:url value="/img/tmp/" />' + $('input[name=mainPhoto]:checked').val());
			$('#confirmName').append('<h3 class="font-weight-bold">' + $('#mName').val() + '</h3>');
			$('#confirmFamily').append($('#family').val() + '<br>');
			$('#confirmOtherNames').append('<p>Также известен как: ' + $('#mOtherNames').val() + '</p>');
			$('#confirmDescription').append('<p>' + $('#mDesc').val() + '</p>');
			if ($('input[name=eatable]:checked', '#mainForm').val() == 1){
				$('#confirmEatable').append('<p>Съедобный</p>');	
			}
			else {
				$('#confirmEatable').append('<p>Несъедобный</p>');
			}
			$('#confirmCap').append('<img class="img-fluid icon" src="' + $('input[name=capID]:checked + img').attr('src') + '">');
			$('#confirmGill').append('<img class="img-fluid icon" src="' + $('input[name=gillID]:checked + img').attr('src') + '">');
			$('#confirmScale').append('<img class="img-fluid icon" src="' + $('input[name=scaleID]:checked + img').attr('src') + '">');
			$('#confirmStipe').append('<img class="img-fluid icon" src="' + $('input[name=stipeID]:checked + img').attr('src') + '">');
			$('#confirmSkirt').append('<img class="img-fluid icon" src="' + $('input[name=skirtID]:checked + img').attr('src') + '">');
			$('#confirmSize').append('<img class="img-fluid icon" src="' + $('input[name=sizeID]:checked + img').attr('src') + '">');

			$('#confirmGillColor').append($('input[name=gillColorID]:checked').next());
			$('#confirmCapColor').append($('input[name=capColorID]:checked').eq(0).next());
			$('#confirmCapColor').append($('<br>'));
			$('#confirmCapColor').append($('input[name=capColorID]:checked').eq(1).next());
			$('#confirmStipeColor').append($('input[name=stipeColorID]:checked').eq(0).next());
			$('#confirmStipeColor').append($('<br>'));
			$('#confirmStipeColor').append($('input[name=stipeColorID]:checked').eq(1).next());

			$('#confirmForest').append('<br><span class="font-weight-bold">Растёт в:</span> ');
			$('input[name="forestID"]:checked').each(function() {
				$('#confirmForest').append($(this).parent().next().children().first().text() + '; ');
				});
		});

	$('#submitPhotos').on('click', function (){
	
	var dataForm = new FormData();
	var fileInput = document.getElementById('photosInput');

	var photoList = [];

		for (var i = 0; i < fileInput.files.length; i++) {
			dataForm.append('photos',fileInput.files[i])
		}

    $.ajax({
        type     : 'POST',
        cache    : false,
        url      : 'submitPhotos',
        data     : dataForm,
        processData: false,
        contentType: false,
        success  : function(thumbs) {
        	
        	$('#photosrow').load(' #photosrow', function() {});
        }
    });
	});	


	$('#submitColorBtn').on('click', function (){
		var dataForm = new FormData();
		 dataForm.append('colorName', $('#colorName').val());
		 dataForm.append('color1', $('#color-picker').val());
		 dataForm.append('color2', $('#color-picker-1').val());

		    $.ajax({
		        type     : 'POST',
		        cache    : false,
		        url      : 'createColor',
		        data     : dataForm,
		        processData: false,
		        contentType: false,
		        success  : function() {

			        $('.colorsrow').load(' .colorsrow', function() {});
				    $('#modalcp').modal('toggle');
		            $('#submitColor').trigger("reset");
		        }
		    });
	});

	$('#submitMushroom').on('click',function(){
	     $('#mainForm').submit();
	 });

		
				// модуль fullpage.js
				$('#fullpage').fullpage({
					//options here
					scrollOverflow : true,
					sectionsColor : [ '#f5f3f1', '#ffffff' ],
					fixedElements : '.fixed-top, .modal',
					scrollOverflowReset : true,
					navigation: true,
					navigationPosition: 'right'
				});

				// ajax на форме до доавлению частей гриба

					$('#submitMPartBtn').on('click', function (){

					var fileInput = document.getElementById('mPartNewIcon');	
				    var dataForm = new FormData();		
				    dataForm.append('mPartNewIcon', fileInput.files[0]);
				    dataForm.append('mPartName', $('#mPartName').val());
				    var mPartType = $('#mPartType').val();
				    dataForm.append('mPartType', mPartType);
				    $.ajax({
				        type     : 'POST',
				        cache    : false,
				        url      : 'createMPart',
				        data     : dataForm,
				        processData: false,
				        contentType: false,
				        success  : function() {

					        if (mPartType == 'Cap'){
					            $('#capsrow').load(' #capsrow', function() {});
						    }
					        else if (mPartType == 'Stipe'){
					            $('#stipesrow').load(' #stipesrow', function() {});
						    }
					        else if (mPartType == 'Skirt'){
					            $('#skirtsrow').load(' #skirtsrow', function() {});
						    }
					        else if (mPartType == 'Scale'){
					            $('#scalesrow').load(' #scalesrow', function() {});
						    }
					        else if (mPartType == 'Gill'){
					            $('#gillsrow').load(' #gillsrow', function() {});
						    }
					        else if (mPartType == 'Forest'){
					            $('#forestsrow').load(' #forestsrow', function() {});
						    }
					        else if (mPartType == 'Size'){
					            $('#sizesrow').load(' #sizesrow', function() {});
						    }
				            $('#modal').modal('toggle');
				            $('#submitMPart').trigger("reset");
				        }
				    });

				});

					$('.combobox').combobox({
						clearIfNoMatch : 'false'
					});
			});


	function typemPartFunction(type) {
	    $('#mPartType').val(String(type));
	}
	
</script>

</body>
</html>
