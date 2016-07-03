$( document ).ready(function() {

	$(".linkMenu").addClass( "js_menu_item" );

  	var kolorIn;
  	var kolorOut;
  	var bgcolor;

	$( ".linkMenu" )
  		.mouseenter(function() {

		   	if ( $(window).width() < 700 ){
		        kolorOut=" #b1b1b1";
				bgcolor ="transparent";

		    }else{
		    	bgcolor = "#34a7e3";
		        kolorOut= "white";
		    }

	        $( this ).animate({
	          color: kolorOut,
	        }, 150 );

	        $( this ).parent().animate({                 
           		backgroundColor: bgcolor,
        	}, 100); 
  })
	  	.mouseleave(function() {

		  	if ( $(window).width() < 700 ){
		        kolorIn="black"
		    }else{
		        kolorIn="white"
		    }

	        $( this ).animate({
	          color: kolorIn,
	        }, 150 );

	        $( this ).parent().animate({                 
           		backgroundColor: "transparent"
        	}, 100); 
  });


	$(window).on('resize', function(){
	      var win = $(this);
	      if (win.width() > 680) {
			$( ".linkMenu" ).css( "color", "white" );
			$( ".menuItem" ).css( "background-color", "transparent" );

	      } else{
	      	$( ".linkMenu" ).css( "color", "black" );
			$( ".menuItem" ).css( "background-color", "white" );
	      }
	});

});