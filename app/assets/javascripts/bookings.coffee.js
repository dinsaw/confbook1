function fetchBookingsForRoom () {
	room_id = $("#room").val();
	$('#calendar').fullCalendar( 'removeEvents');
	$.ajax('/select_by_room/', {
		data: {id:room_id},
		success: function(res, status, xhr) {
			for (var i = 0; i < res.length; i++) {
				var newEvent = new Object();

				console.log(""+res[i].user_id+res.start_time+res.end_time);
				newEvent.title = "by @"+res[i].user.username;
				newEvent.start = Date.parse(res[i].start_time);
				newEvent.end = Date.parse(res[i].end_time);
				newEvent.allDay = false;

				$('#calendar').fullCalendar( 'renderEvent', newEvent , true);
			};
		},
		error: function(xhr, status, err) {},
		complete: function(xhr, status) {}
	});
}
function newBooking () {

	var dateTypeVar = $('#booking_Date').datepicker('getDate');

	var dateB = $.datepicker.formatDate('dd/mm/yy', dateTypeVar);
	var start = $("#start").val();
	var end = $("#end").val();
	var room = $("#room").val();

	$.ajax('/jBooking/new_booking/', {
		data: {start: start, end: end, room_id: room, booking_date:dateB},

		success: function(res, status, xhr) {
			$("#message").text(res.message);
			console.log(res);
		},
		error: function(xhr, status, err) {},
		complete: function(xhr, status) {}
	});
	fetchBookingsForRoom();
}