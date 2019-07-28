<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/FormStyle.css" type="text/css">
    <title>Formularz nowego rejsu</title>
</head>
<body>

<div class="form-style-5">

    <form:form action="CruisesController" modelAttribute="cruise" method="get">
        <h1>Dodaj nowy rejs:</h1>
        <br> Imię kapitana:
        <form:input path="captainName"/>
        <br> Miejsce:
        <form:input path="location"/>
        <br> Przepłynięte mile
        <form:input path="distance"/>
        <br>
        <input type="submit" value="Utwórz!"/>
    </form:form> <br>

    <form:form action="cruises">
        <input type="submit" value="Powrót do listy"/>
    </form:form>

</div>
</body>
</html>