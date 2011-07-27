// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {

	$('#flash').delay(2500).fadeOut();

	$('.form_big textarea').each(function(i,el) {
		var h= $(this).parent().parent().find(".text").height();
		$(this).css("height",h);
	});

});

