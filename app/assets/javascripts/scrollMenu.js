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

  console.log('Documento Iniciado');
});
// Rastrear Scroll
$(window).scroll(function(){

   var topo = 90; 
   var fromTop = $(this).scrollTop() + topo;

   var divs = $('div.section').map(function(){
      if($(this).offset().top <= fromTop )  {
          console.log($(this).attr('id'));
          $('.active').removeClass("active");
          SetarAtributos($(this).attr('id'));
      }
   });

});

$(function() {
  $('a[href*=#]:not([href=#])').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        $('html,body').animate({
          scrollTop: target.offset().top - 90
        }, 500);
        return false;
      }
    }
  });
});