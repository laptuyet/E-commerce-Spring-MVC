<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="container mt-5">
	<div class="row justify-content-center mt-5 mb-5">
		<div class="col-md-7">
			<canvas id="revenueByCusChart"></canvas>
		</div>
	</div>
	<table class="table align-middle mb-0 bg-white text-center">
		<thead class="bg-light">
			<tr>
				<th>Tài khoản</th>
				<th>Họ tên khách</th>
				<th>Tổng số lượng đã mua</th>
				<th>Doanh thu từ khách</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="e" items="${tableList}">
				<tr>
					<td>
						<p class="fw-normal mb-1">${e[0]}</p>
					</td>
					<td>
						<p class="fw-normal mb-1">${e[1]}</p>
					</td>
					<td>
						<p class="fw-normal mb-1">${e[2]}</p>
					</td>
					<td>
						<p class="fw-normal mb-1">$ ${e[3]}</p>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<script>
	window.onload = function() {
		let myLabels = [];
		myData = [];
		<c:forEach var="e" items="${tableList}">
			myLabels.push('${e[0]}'); 
			myData.push(${e[3]});
		</c:forEach>
		
		const labels = myLabels;

		const data = {
		  labels: labels,
		  datasets: [{
		    label: 'Doanh thu theo khách hàng',
		    data: myData,
		    fill: false,
		    borderColor: 'rgb(75, 192, 192)',
		    tension: 0.1
		  }]
		};

		const config = {
		  type: 'line',
		  data: data,
		};

		const myChart = new Chart(
			document.getElementById("revenueByCusChart"),
			config
		);
	}
</script>