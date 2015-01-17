var cols = 4;
var margin = 10;

$(document).ready(function(){
	createGrid(cols);
	$('button').on('click', function(){
		console.log('button clicked');
		$('.container').empty();
		var numCols = window.prompt("How many squares per side would you like in the new grid?","4");
		createGrid(numCols);
	});
});

var createGrid = function(n){
	var $container = $('.container');
	for(var i=1; i<=n*n; i++)
	{
		if((i-1)%n==0 && i!=1)
		{
			$container.append("<br>");
			console.log('break inserted');
		}
		$container.append("<div class='Box'></div>");
		console.log('new block created');
	}
	
	var size = (240-margin*n)/n;

	var $Box = $('.Box');
	$Box.css('height', size);
	$Box.css('width', size);
	$Box.on('mouseenter mouseleave', function(){
		console.log('hovered');
		$(this).css('background-color', 'black');
	});
};