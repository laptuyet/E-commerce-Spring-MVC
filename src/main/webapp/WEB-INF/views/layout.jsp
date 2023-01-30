<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<base href="${pageContext.servletContext.contextPath}/">
	
	<!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.0.0/mdb.min.css" rel="stylesheet" />
    <!-- JQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- Swiper -->
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <!-- Main CSS -->
    <link rel="stylesheet" href="static/assets/css/style.css">
    <!-- JQueryUI -->
    <!-- <link rel="stylesheet" href="static/assets/jqueryUI/jquery-ui.min.css">
    <script src="/static/assets/jqueryUI/jquery-ui.min.js"></script> -->
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js" integrity="sha256-xH4q8N0pEzrZMaRmd7gQVcTZiFei+HfRTBPJ1OGXC0k=" crossorigin="anonymous"></script>
    
	<title>Patin Shop</title>
</head>

<body>
	<!-- Header & nav -->
	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
			<tiles:insertAttribute name="header" />
		</nav>
		<tiles:insertAttribute name="bgImage"></tiles:insertAttribute>
	</header>
	
	<!-- Banner -->
	<tiles:insertAttribute name="banner"></tiles:insertAttribute>
	
	<!-- Body -->
	<div class="container-fluid" style="margin-top: 100px; margin-bottom: 100px;">
		<div class="row">
			<article class="col-md-10 col-sm-8">
				<tiles:insertAttribute name="body"></tiles:insertAttribute>
			</article>
			<aside class="col-md-2 col-sm-4">
				<tiles:insertAttribute name="aside"></tiles:insertAttribute>
			</aside>
		</div>
	</div>
	
	<!-- About -->
	<tiles:insertAttribute name="about"></tiles:insertAttribute>
	
	<!-- Reviewer -->
	<tiles:insertAttribute name="reviewer"/>
	
	<!-- Footer -->
    <footer class="text-center text-lg-start bg-light text-muted">
        <tiles:insertAttribute name="footer"/>
    </footer>
	
	<!-- MDB -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.0.0/mdb.min.js"></script>
    <!-- Swiper -->
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <script src="static/assets/js/script.js"></script>
</body>

</html>