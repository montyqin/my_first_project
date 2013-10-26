<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
[
	<c:forEach items="${result.values}" var="item" varStatus="i">
	{
		"id":"${item.id}",
		"cid":"${item.cid}",
		"name":"${item.name}",
		"price":"${item.price}",
		"imgs":"${item.imgs}",
		"capacity":"${item.capacity}"
	}<c:if test="${!i.last}">,</c:if>
	</c:forEach>
]