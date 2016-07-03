$( document ).ready(function() {

if (typeof(Storage) != "undefined") {

		var imie = localStorage.getItem("imie");
		var nazwisko = localStorage.getItem("nazwisko");
		var miasto = localStorage.getItem("miasto");
		var ulica = localStorage.getItem("ulica");
		var kod = localStorage.getItem("kod");
		var budynek = localStorage.getItem("budynek");
		var email = localStorage.getItem("email");
		var telefon = localStorage.getItem("telefon");
		var szczegoly = sessionStorage.getItem("szczegoly");

		if(imie != "undefined"){
			$("#imie_input").val(imie);
		}
		if(nazwisko != "undefined"){
			$("#nazwisko_input").val(nazwisko);
		}
		if(miasto != "undefined"){
			$("#miasto_input").val(miasto);
		}
		if(ulica != "undefined"){
			$("#ulica_input").val(ulica);
		}
		if(kod != "undefined"){
			$("#kod_input").val(kod);
		}
		if(budynek != "undefined"){
			$("#budynek_input").val(budynek);
		}
		if(email != "undefined"){
			$("#email_input").val(email);
		}
		if(telefon != "undefined"){
			$("#telefon_input").val(telefon);
		}
		if(szczegoly != "undefined"){
			$("#szczegoly_input").val(szczegoly);
		}

} else {
	console.log("Brak wsparcia dla Web Storage...");
}

$(function() {
    $( "input[type=submit], button" )
      .button()
      .click(function( event ) {
		sessionStorage.setItem("szczegoly", ($("#szczegoly_input").val()));
		var tel = $("#telefon_input").val();
		if (!$.isNumeric(tel)) {
			$("#content").append("<div id='dialog' title='Stan zamowienie'><p>Niepoprawny numer telefonu</p></div>");
		}else{
			$("#content").append("<div id='dialog' title='Stan zamowienie'><p>Składanie zamowienia...</p></div>");
		}
		$( "#dialog" ).dialog({
			modal: true,
			buttons: {
			Ok: function() {
				$( this ).dialog( "close" );
				if ($.isNumeric(tel)) {
					$('#forma').submit();
				}

			}
		}
		});	
      	
        event.preventDefault();
      });
});

$(function() {
    $('#forma').submit(function() {
        if (typeof(Storage) != "undefined") {
		    localStorage.setItem("imie", ($("#imie_input").val()));
		    localStorage.setItem("nazwisko", ($("#nazwisko_input").val()));
		    localStorage.setItem("miasto", ($("#miasto_input").val()));
		    localStorage.setItem("ulica", ($("#ulica_input").val()));
		    localStorage.setItem("kod", ($("#kod_input").val()));
		    localStorage.setItem("budynek", ($("#budynek_input").val()));
		    localStorage.setItem("email", ($("#email_input").val()));
		    localStorage.setItem("telefon", ($("#telefon_input").val()));

		} else {
			console.log("Brak wsparcia dla Web Storage...");
			return true;
		}
    return true;
    });
});

$("#szczegoly_input")
  .focusout(function() {
	sessionStorage.setItem("szczegoly", ($("#szczegoly_input").val()));
});




});

