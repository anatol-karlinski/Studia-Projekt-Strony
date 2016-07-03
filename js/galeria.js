$( document ).ready(function() {

	$('.obrazek_prodoktu').click(function(e) {
			e.stopPropagation();
			$(".overlay").remove();
			var image = $( this );
			var offset = image.offset();
			var sizeW = image.width()*1.8;
			var sizeH = image.height()*1.8;
			var szerokosc = $( window ).width();
			var wysokosc = $( window ).height();
			$("<div class='overlay' style='position:absolute; height:" + sizeH + "px; width:" + sizeW + "px; top:" + (offset.top - sizeH/2) + "px; left:" + (szerokosc/2 - sizeW/2) +"px; background-color: black; z-index: 2;'><img src='" + $(this).attr('src') + "' style='position:relative; height:95%; top:2.5%; width:auto; left:2.5%;'/></div>").appendTo(document.body);
	});

	$(document.body).click(function() {
		$(".overlay").remove();
		//if(document.getElementsByClassName("overlay") !== null)

    });

});