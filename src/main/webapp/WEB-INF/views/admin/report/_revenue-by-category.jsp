<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="container">
	<div class="row justify-content-center mt-5 mb-5">
		<div class="col-md-7">
			<canvas id="revenueByCateChart"></canvas>
		</div>
	</div>
	<div class="container">
		<table class="table align-middle mb-0 bg-white text-center">
			<thead class="bg-light">
				<tr>
					<th>Tên danh mục</th>
					<th>Tổng số lượng đã bán</th>
					<th>Tổng doanh thu</th>
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
							<p class="fw-normal mb-1">$ ${e[2]}</p>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<script>
	window.onload = function() {
		let myLabels = [];
		myData = [];
		<c:forEach var="k" items="${list}">
			myLabels.push('${k.key}'); 
			myData.push(${k.value});
		</c:forEach>
		
		const labels = myLabels;

		const data = {
			labels: labels,
			datasets: [{
				axis: 'y',
				label: 'Doanh thu theo danh mục',
				data: myData,
				fill: false,
				backgroundColor: [
					'rgba(255, 99, 132, 0.2)',
					'rgba(255, 159, 64, 0.2)',
					'rgba(255, 205, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(153, 102, 255, 0.2)',
					'rgba(201, 203, 207, 0.2)'
				],
				borderColor: [
					'rgb(255, 99, 132)',
					'rgb(255, 159, 64)',
					'rgb(255, 205, 86)',
					'rgb(75, 192, 192)',
					'rgb(54, 162, 235)',
					'rgb(153, 102, 255)',
					'rgb(201, 203, 207)'
				],
				borderWidth: 1
			}]
		};

		const config = {
			type: 'bar',
			data,
			options: {
				indexAxis: 'x',
			}
		};

		const myChart = new Chart(
			document.getElementById("revenueByCateChart"),
			config
		);
	}
</script>