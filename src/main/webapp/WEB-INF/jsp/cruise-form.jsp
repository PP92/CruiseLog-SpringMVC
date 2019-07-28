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

    <form:form action="saveCruise" modelAttribute="cruise" method="post">
        <form:hidden path="id" />
        <h1>Dodaj nowy rejs:</h1>
        <br> Imię kapitana:
        <form:input path="captainName" value="${cruise.captainName}" required="required" />
        <br> Miejsce:
        <form:input path="location" value="${cruise.location}" required="required"/>
        <br> Jacht:
        <form:input path="yachtName" value="${cruise.yachtName}" required="required"/>
        <br> Przepłynięte mile:
        <form:input type="number" path="distance" value="${cruise.distance}" required="required"/>
        <br>Data rozpoczęcia:
        <form:input type="date" path="startDate" value="${cruise.startDate}" required="required"/>
        <br>Data zakończenia:
        <form:input type="date" path="endDate" value="${cruise.endDate}" required="required"/>
        <br>
        <input type="submit" value="Zapisz!"/>
    </form:form> <br>
    <c:choose>
        <c:when test="${empty cruise.id}">
            <form:form action="cruises" method="get">
                <input type="submit" value="Powrót do listy"/>
            </form:form>
        </c:when>
        <c:otherwise>
            <form:form action="showCruise" method="get">
                <input type="hidden" name="cruiseId" value="${cruise.id}"/>
                <input type="submit" value="Powrót"/>
            </form:form>
        </c:otherwise>
    </c:choose>


</div>
</body>
</html>