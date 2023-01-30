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
    <link rel="stylesheet" href="static/assets/admin/css/style.css" />
    <!-- Main Script -->
    <script src="static/assets/admin/js/script.js"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    

	<title>Trang quản trị</title>
</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12 col-lg-2 sidebar">
				<tiles:insertAttribute name="sidebar" />
			</div>
			<div class="col-sm-12 col-lg-10">
				<div class="row">
					<tiles:insertAttribute name="header" />
				</div>
				<div class="row">
					<tiles:insertAttribute name="body" />
				</div>
			</div>
		</div>
	</div>

	
	<!-- MDB -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.0.0/mdb.min.js"></script>
    <!-- Swiper -->
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
</body>

</html>