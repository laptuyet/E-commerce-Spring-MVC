<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="base" value="admin/category" scope="application" />

<div class="container">
	<h2 class="mt-5 text-center">Quản lý danh mục</h2>
	<h4 class="text-center ${!empty(msgSucc) ? 'text-success' : (!empty(msgErr) ? 'text-danger' : '')}">
		${msgSucc}${msgErr}
	</h4>
	<jsp:include page="table.jsp" />
</div>
