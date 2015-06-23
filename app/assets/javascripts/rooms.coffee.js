$.ajax('/rooms', {
	success: function(res, status, xhr) {
		for (var i = 0; i < res.length; i++) {
			
			$('#room')
			.append($("<option></option>")
				.attr("value",res[i].id)
				.text(res[i].name)); 

		};
		$('#room option:eq(1)');
		fetchBookingsForRoom();
	},
	error: function(xhr, status, err) {},
	complete: function(xhr, status) {}
});
function newRoom () {

	var room_name = $('#room_name').val();

	$.ajax('jRooms/new_room', {
		data: {room_name:room_name},

		success: function(res, status, xhr) {
			$("#r_message").text(res.message);
			console.log(res);
		},
		error: function(xhr, status, err) {},
		complete: function(xhr, status) {}
	});
	$('#room')
    .find('option')
    .remove();

	$.ajax('/rooms', {
		success: function(res, status, xhr) {
			for (var i = 0; i < res.length; i++) {

				$('#room')
				.append($("<option></option>")
					.attr("value",res[i].id)
					.text(res[i].name)); 

			};
			$('#room option:eq(1)');
			fetchBookingsForRoom();
		},
		error: function(xhr, status, err) {},
		complete: function(xhr, status) {}
	});
}