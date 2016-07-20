$(document).ready(function() {
	$(".watch").each(function(i) {
		$(this).delay(500*(i+1)).fadeIn(1000); 
	});
    //$(".watch").delay(1500).fadeIn(1000);
});