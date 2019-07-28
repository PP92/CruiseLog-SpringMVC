<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/style.css">
    <title>Lista rejsów</title>
</head>
<body>
<div class="wrapper">
    <h1>Lista rejsów
        <c:choose>
            <c:when test="${filter =='DistanceGreaterThan'}">
                o przebiegu powyżej ${param.distance} Mm
            </c:when>
            <c:when test="${filter =='StartDateAfter'}">
                rozpoczętych po ${param.startDate}
            </c:when>
        </c:choose>

    </h1>
    <c:if test="${not empty filter}">
        <br>
        <form action="cruises" method="get">
            <input type="submit" value="Pokaż wszystkie rejsy"/>
        </form>
        <br>
    </c:if>

    <div class="table">
        <div class="row header">
            <div class="cell">Lp.</div>
            <div class="cell">ID</div>
            <div class="cell">Kapitan</div>
            <div class="cell">Miejsce</div>
            <div class="cell">Data rozpoczęcia</div>
            <div class="cell"></div>
        </div>
        <c:forEach var="entry" items="${cruisesList}" varStatus="loop">

            <div class="row">
                <div class="cell">${loop.index + 1}</div>
                <div class="cell">${entry.id}</div>
                <div class="cell">${entry.captainName}</div>
                <div class="cell">${entry.location}</div>
                <div class="cell">${entry.startDate}</div>
                <div class="cell">
                    <form:form action="showCruise" method="get">
                        <input type="hidden" name="task" value="showCruise"/>
                        <input type="hidden" name="cruiseId" value="${entry.id}"/>
                        <input type="submit" value="Szczegóły"/>
                    </form:form>
                </div>
            </div>
        </c:forEach>

    </div>
    <form action="cruiseForm">
        <input type="submit" value="Dodaj nowy rejs"/>
    </form>
    <br>
    <form action="addRandomCruise" method="post">
        <input type="submit" value="Generuj losowy rejs!"/>
    </form>
    <br>
    <h2>Filtry:</h2>
    <form action="showCruisesWhereDistanceGreaterThan" method="get">
        Pokaż rejsy podczas których przepłynięto więcej niż:
        <br>
        <input type="number" name="distance" required/>
        <input type="submit" value="Filtruj!"/>
    </form>
    <br>
    <form action="showCruisesByStartDateAfter" method="get">
        Pokaż rejsy rozpoczęte później niż:
        <br>
        <input type="date" name="startDate" required/>
        <input type="submit" value="Filtruj!"/>
    </form>

</div>
</body>
</html>