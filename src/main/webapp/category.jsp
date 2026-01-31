<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Services by Category</title>
    <link rel="stylesheet" href="path-to-your-actual-css-file.css">
</head>
<body>

<h1>Services for Selected Category</h1>

<ul>
    <c:choose>
        <c:when test="${empty services}">
            <li>No services available for this category.</li>
        </c:when>
        <c:otherwise>
            <c:forEach var="service" items="${services}">
                <li>
                    <h2>${service.name}</h2>
                    <p>${service.description}</p>
                    <p>Price: ${service.price}</p>
                    <img src="${service.imageUrl}" alt="${service.name}">
                </li>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</ul>

</body>
</html>
