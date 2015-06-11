
$(document).ready(function(){
	
	$('#new_item').on('ajax:success', function(e, data, status, xhr){

		console.log('successfuil ajax');
		$(xhr.responseText).hide().insertAfter($('.td-table-header')).show('slow');

	});

});