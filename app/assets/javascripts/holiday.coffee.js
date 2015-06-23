function newHoliday () {

	var dateTypeVar = $('#holiday_Date').datepicker('getDate');

	var dateB = $.datepicker.formatDate('dd/mm/yy', dateTypeVar);

	$.ajax('/jHoliday/new_holiday', {
		data: {holiday_Date:dateB},

		success: function(res, status, xhr) {
			$("#h_message").text(res.message);
			console.log(res);
		},
		error: function(xhr, status, err) {},
		complete: function(xhr, status) {}
	});
}