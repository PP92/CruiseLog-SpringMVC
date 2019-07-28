<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dane rejsu</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="wrapper">
    <h1>Dane rejsu</h1>

    <div class="row header">
        <div class="cell">Dane rejsu</div>
        <div class="cell"></div>
    </div>
    <div class="row">
        <div class="cell">ID</div>
        <div class="cell">${cruise.id}</div>
    </div>
    <div class="row">
        <div class="cell">Kapitan</div>
        <div class="cell">${cruise.captainName}</div>
    </div>
    <div class="row">
        <div class="cell">Miejsce</div>
        <div class="cell">${cruise.location}</div>
    </div>
    <div class="row">
        <div class="cell">Jacht</div>
        <div class="cell">${cruise.yachtName}</div>
    </div>
    <div class="row">
        <div class="cell">Przepłynięte mile</div>
        <div class="cell">${cruise.distance}</div>
    </div>
    <div class="row">
        <div class="cell">Data rozpoczęcia</div>
        <div class="cell">${cruise.startDate}</div>
    </div>
    <div class="row">
        <div class="cell">Data zakończenia</div>
        <div class="cell">${cruise.endDate}</div>
    </div>
    <div class="row">
        <div class="cell">
            <form:form action="showCruiseUpdateForm" method="get">
                <input type="hidden" name="cruiseId" value="${cruise.id}"/>
                <input type="submit" value="Edytuj"/>
            </form:form>
        </div>
        <div class="cell">
            <form:form action="deleteCruise" method="delete">
                <input type="hidden" name="cruiseId" value="${cruise.id}"/>
                <input type="submit" value="Usuń"/>
            </form:form>
        </div>
    </div>
    <br>
    <form:form action="cruises" method="get">
        <input type="submit" value="Powrót do listy"/>
    </form:form>


</div>
</body>
</html>