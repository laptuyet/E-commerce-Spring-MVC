$(document).ready(function() {

	//====== mark and keep the cliked link open ===========
	const clickedTab = sessionStorage.getItem("clickedTab");
	if (clickedTab != null) {
		$(".accordion-button").each(function() {
			let tabId = $(this).attr("id");
			if (tabId === clickedTab) {
				$(this).toggleClass("collapsed");
				$(this).attr("aria-expanded", "true");
				$(this).parent().next().toggleClass("show");
			}
		});
	}

	$(".accordion-button").each(function() {
		$(this).click(function() {
			let tabId = $(this).attr("id");
			sessionStorage.setItem("clickedTab", tabId);
		});
	});
	//=======================================================

	//show modal delete category, product, ...
	$(".btn-del-item").click(function() {
		let delLink = $(this).attr("data-href");

		$(".btn-modal-del").click(); // active the confirm delete modal

		// change the link of <a> in confirmDeleteDialog
		$(".btn-confirm-del").attr("href", delLink);
	});


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


});