// attach click to all accordions when loading
$(function() {
    $('.co-accordion-title').click(function(){
		$(this).toggleClass('active').next('.co-accordion-content').slideToggle('normal', function(){
			$(window).resize();
		});
	});
});
