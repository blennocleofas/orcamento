var refreshDocHeight = function(){
	var h = window.innerHeight;
    var section = document.getElementsByClassName('section');
    
    for (var i = 0; i < section.length; i++ ){
      section[i].style.height = h + "px";
    }
};
window.setInterval(refreshDocHeight, 200);




var  ApagarActive = function(){
	$('.active').removeClass("active");
}



	

var  SetarAtributos = function(nome){
 	var lis = document.getElementsByTagName('li');
	
	for (var i=0; i < lis.length; i++ ){
		var atr = lis[i].getAttribute("data-menuanchor");
		if (atr != null && atr == nome) {
			lis[i].className = "active";
			console.log(atr);
		};	
	};
}

var  ApagarAtributos = function(nome){
 	var lis = document.getElementsByTagName('li');
	
	for (var i=0; i < lis.length; i++ ){
		var atr = lis[i].getAttribute("data-menuanchor");
		if (atr != null && atr == nome) {
			lis[i].className = "";
			console.log(atr);
		};	
	};
}



$(document).ready(function(){

    $('.section').windows({
        snapping: false,
        snapSpeed: 500,
        snapInterval: 1100,
        onScroll: function(scrollPos){

        },
        onSnapComplete: function($el){
        },
        onWindowEnter: function(el){
            console.log(el.attr('id'));
            $('.active').removeClass("active");
            SetarAtributos(el.attr('id'));
        }
    })

});


$(document).ready(function(){
    
    $('.section').bind('scroll',chk_scroll);
});

function chk_scroll(e)
{
    var elem = $(e.currentTarget);
    if (elem[0].scrollHeight - elem.scrollTop() == elem.outerHeight())
    {
        console.log("bottom");
    }

}
