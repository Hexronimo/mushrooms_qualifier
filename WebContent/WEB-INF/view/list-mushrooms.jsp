<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored ="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ru">
<head>
<meta charset="UTF-8">
<title>Определитель грибов</title>
<link href="https://fonts.googleapis.com/css?family=Pacifico&amp;display=swap" rel="stylesheet">
<link rel="stylesheet" href='<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.min.css" /> '>

<script type="text/javascript" src="<c:url value="/webjars/jquery/3.4.1/jquery.min.js" /> "></script>
<script type="text/javascript" src="<c:url value="/webjars/bootstrap/4.3.1/js/bootstrap.min.js" /> "></script>


<style>
.sqr-image {
width:200px;
height:190px;
border-radius: 9px;
background-size: cover;
}
</style>
</head>


<body style="background-color: #f5f3f1;">
<div class="container-fluid p-0 bg-danger mb-5 text-white">
<div class="container pt-4 pb-4">
<a href="./" class="text-white h5 d-inline-block mr-4 mt-1 mb-1 font-weight-bold">На главную</a>
<a href="addMushroom" class="text-white h5 d-inline-block mt-1 mb-1 font-weight-bold">Добавить</a>
</div>
</div>

<div class="container mt-5">
<h1 style="font-family: 'Pacifico', cursive;" class="pb-3">Грибы</h1>
<table class="table table-bordered table-responsive">
<c:forEach items="${mushrooms}" var="mushroom">

<tr>
<td>
<div class="sqr-image" style="background:url('<c:url value="/img/mushrooms/" /><c:out value="${mushroom.value}"/>')no-repeat top center;"></div>
</td>
<td>
<h5 class="font-weight-bold"><c:out value="${mushroom.key.name}" /></h5>
<c:out value="${mushroom.key.family.name}" />
</td>
<td>
<ul>
<li><span class="font-weight-bold">Шляпка</span> <c:out value="${mushroom.key.cap.name}" /></li>
<li><span class="font-weight-bold">Обратная сторона</span> <c:out value="${mushroom.key.gill.name}" /></li>
<li><span class="font-weight-bold">Узор</span> <c:out value="${mushroom.key.scale.name}" /></li>
<li><span class="font-weight-bold">Ножка</span> <c:out value="${mushroom.key.stipe.name}" /></li>
<li><span class="font-weight-bold">Юбочка</span> <c:out value="${mushroom.key.skirt.name}" /></li>
</ul>
</td>
<td>
<form action="editMushroom" method="post">
<input type="hidden" value="${mushroom.key.id}">
<button class="btn btn-disabled m-2" type="submit" disabled>Изменить</button>
</form>
</td>
<td>
<button class="btn btn-danger m-2" type="button" onclick="toModalFunction('${mushroom.key.id}')">Удалить</button>
</td>

</tr>

</c:forEach>
</table>
</div>
</body>
<script>
function deleteFunction(id) {
    $.ajax({
        type     : 'POST',
        url      : 'deleteMushroom',
        data     : {
	        "id" : id
        },

        success  : function() {
        	
        	location.reload();
        }
    });
}
</script>
</html>