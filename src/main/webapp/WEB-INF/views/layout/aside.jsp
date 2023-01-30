<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<div class="card list-group list-group-light ">
  <div class="card-header px-3 bg-dark text-white text-center"><s:message code="aside.cate"/></div>
  	<div class="aside-category">
	  	<c:forEach var="c" items="${prodCates}">
		    <a href="product/list-by-category/${c.id}" class="list-group-item
		    	 list-group-item-action px-3 border-0 ripple" aria-current="true" >
		    	${c.name}
		    </a>
	    </c:forEach>
  	</div>

</div>

<div class="card list-group list-group-light mt-5">
	<div class="card-header px-3 bg-dark text-white text-center"><s:message code="aside.spec"/></div>
	<a href="product/list-by-special/1" class="list-group-item
		list-group-item-action px-3 border-0 ripple" aria-current="true" >
	   <s:message code="aside.spec.newest"/>
	</a>
	<a href="product/list-by-special/2" class="list-group-item
		list-group-item-action px-3 border-0 ripple" aria-current="true" >
	   <s:message code="aside.spec.mostView"/>
	</a>
	<a href="product/list-by-special/3" class="list-group-item
		list-group-item-action px-3 border-0 ripple" aria-current="true" >
	   <s:message code="aside.spec.hot"/>
	</a>
</div>