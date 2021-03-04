
$(function() {
	$('#main-card').show();
	$('#benefit-card').hide();
	$('#perform-card').hide();
	
	$('#btnBenefit').on('click', (function() {
		
		$('#main-card').hide();
		$('#perform-card').hide();
		$('#benefit-card').show();
		
	})
	);
	
	$('#btnPerform').on('click', (function() {
		
		$('#main-card').hide();
		$('#benefit-card').hide();
		$('#perform-card').show();
		
		})
	);
});