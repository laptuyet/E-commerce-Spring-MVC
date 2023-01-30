$(document).ready(function() {

	//change image of product, customer, ...
	const fileInput = document.querySelector('input[type="file"]');
	const preview = document.querySelector('img.uploaded-img');
	const reader = new FileReader();
	if (fileInput != null) {
		fileInput.addEventListener('change', () => {
			const selectedFile = fileInput.files[0];
			reader.addEventListener('load', () => {
				preview.src = reader.result;
			});

			reader.readAsDataURL(selectedFile);
		});
	}


	// price range input change
	$(".priceRange").on('input', function() {
		var price = $(this).val();
		$(this).parent().prev().text("$ " + price);
	});

	// get notify news
	$(".sendNotify").click(function() {
		var email = $("#cusEmail").val();
		if (email === "") {
			$(".cusMailError").text("Email trống!");
			$(".cusMailSuccess").text("");
			return;
		}
		$.ajax({
			url: "cus/notify/" + email,
			success: function(message) {
				/*if (message === "empty") {
					$(".cusMailError").text("Email trống!");
				}*/

				if (message === "invalid") {
					$(".cusMailError").text("Email không đúng định dạng!");
					$(".cusMailSuccess").text("");
				}

				if (message === "existed") {
					$(".cusMailError").text("Email đã được đăng ký rồi!");
					$(".cusMailSuccess").text("");
				}

				if (message === "success") {
					$(".cusMailError").text("");
					$("#cusEmail").val("");
					$(".cusMailSuccess").text("Đăng ký nhận thông báo thành công!");
				}
			}
		});
		return false;
	});

	// change language
	$("a[data-lang]").click(function() {
		var lang = $(this).attr("data-lang");
		$.ajax({
			url: "home/language?lang=" + lang,
			success: function() {
				location.reload();
			}
		})
		return false; // dòng này để ngăn thẻ a chạy href
	});


	$('input[name=sizeOption]:first').attr('checked', true); /*mặc định chọn size đầu tiên*/

	$(".btn-add-check").click(function() {
		var prodId = $(this).parent().attr("data-id");
		var chooseSize = false;
		var size;
		$("input[name='sizeOption']").each(function() {
			if ($(this).is(':checked')) {
				chooseSize = true;
				size = $(this).val();
			}
		});
		$.ajax({
			url: "product/add-to-cart/" + prodId + "/" + size,
			dataType: "json",
			success: function(data) {
				$("#cartMini-count").html(data.count);
				$("#cartMini-total").html('$ ' + data.total.toFixed(2));

			}
		})
	});


	// add-to-favorite-list
	$(".btn-favor").click(function() {
		var prodId = $(this).parent().attr("data-id");
		$.ajax({
			url: "product/add-to-favor/" + prodId,
			success: function(data) {
				if (data == '1') {
					alert("Đã thêm vào danh sách yêu thích!");
				}
				else {
					alert("Có rồi không thích nữa!");
				}
			}
		})
	})

	// add-to-cart
	$(".btn-add-to-cart").click(function() {
		var prodId = $(this).parent().attr("data-id");
		$.ajax({
			url: "product/add-to-cart/" + prodId,
			dataType: "json",
			success: function(data) {
				$("#cartMini-count").html(data.count);
				$("#cartMini-total").html('$ ' + data.total.toFixed(2));

			}
		})
	});

	//size change
	$(".chooseSise").change(function() {
		var prodId = $(this).closest("tr").attr("data-id");
		var selectedSize = $(this).find("option:selected").val();
		$.ajax({
			url: `cart/update-size/${prodId}/${selectedSize}`,
			success: function() { }
		});
	});

	//qty change
	$(".detail-qty").on('propertychange input', function() {
		var qty = $(this).val();
		var prodId = $(this).closest("tr").attr("data-id");
		var price = $(this).closest("tr").attr("data-price");
		var discount = $(this).closest("tr").attr("data-discount");
		$.ajax({
			url: `cart/update-qty/${prodId}/${qty}`,
			success: function(data) {
				$("#cartMini-count").html(data.count);
				$("#cartMini-total").html('$ ' + data.total.toFixed(2));
			}
		});

		if (qty == 0) { // nếu sluong = 0 thì xóa luôn khỏi giỏ hàng
			$(this).closest("tr").remove();
		}

		if ($.isNumeric(discount)) {
			$(this).closest("tr").find(".cart-total").html('$ ' + (discount * qty).toFixed(2));
		} else $(this).closest("tr").find(".cart-total").html('$ ' + (price * qty).toFixed(2));
	});

	$(".btn-cart-clear").click(function() {
		$.ajax({
			url: "cart/clear",
			success: function() {
				$("#cartMini-count").html(0);
				$("#cartMini-total").html('$ ' + 0);
			}
		});
		$("table > tbody").empty();
	});

	$(".btn-cart-remove").click(function() {
		var prodId = $(this).closest("tr").attr("data-id");
		$.ajax({
			url: "cart/remove/" + prodId,
			dataType: "json",
			success: function(data) {
				$("#cartMini-count").html(data.count);
				$("#cartMini-total").html('$ ' + data.total.toFixed(2));
			}
		})
		$(this).closest("tr").remove();
	});
});



// Reviewer Swiper
var swiper = new Swiper(".mySwiper", {
	slidesPerView: 'auto',
	spaceBetween: 40,
	centeredSlides: true,
	grabCursor: true,
	loop: true,
	autoplay: {
		delay: 2500,
		disableOnInteraction: true,
	},
	navigation: {
		nextEl: ".swiper-button-next",
		prevEl: ".swiper-button-prev",
	},
});
// End Swiper
