<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<jsp:include page="header.jsp"></jsp:include>

<body>


	<!--  /.page  -->
	<div class="container">

		<c:choose>
			<c:when test="${ not empty fail}">
				<div class="alert alert-danger" style="width: 300px">
					<strong>Bląd</strong> podczas rejestracji !!!
				</div>




			</c:when>

			<c:when test="${ not empty wrong}">
				<div class="alert alert-danger" style="width: 300px">
					<strong>Bląd</strong> użytkownik juz istnieje!!!
				</div>




			</c:when>

		</c:choose>
		<form:form class="form-horizontal" commandName="user">
			<fieldset>
				<div id="legend">
					<h1>
						Formularz <small>rejestracji</small>
					</h1>
				</div>
				<div class="form-group">
					<!-- Username -->
					<label class="col-xs-3 control-label" for="username"> <span
						class="glyphicon glyphicon-log-in"></span></label>
					<div class="col-xs-5">
						<input type="text" id="username" placeholder="Login"
							name="username" class="input-xlarge"> <small> <form:errors
								path="username" cssStyle="color:red" />
						</small>
						<p class="help-block">Login 5-20 znaków</p>
					</div>
				</div>
				<div class="form-group">
					<!-- Password-->
					<label class="col-xs-3 control-label" for="password"> <span
						class="glyphicon glyphicon-lock"></span>
					</label>
					<div class="col-xs-5">
						<input type="password" id="password" name="password"
							placeholder="Hasło" class="input-xlarge"> <small>
							<form:errors path="password" cssStyle="color:red" />
						</small>
						<p class="help-block">Hasło 8-30 znaków</p>
					</div>
				</div>


				<div class="form-group">
					<!-- Button -->
					<div class="col-xs-5">
						<button class="btn btn-success">Rejestruj</button>
					</div>
				</div>
			</fieldset>
		</form:form>




	</div>


	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>