var refreshDocHeight = function(){
	  var h = window.innerHeight;
    var t = 104;
    var section = document.getElementsByClassName('section');
    
    for (var i = 0; i < section.length; i++ ){
      section[i].style.height = h + "px";
    }
};
window.setInterval(refreshDocHeight, 200);




var  ApagarActive = function(){
	$('.active').removeClass("active");
}




 $(function() {
    $( ".data" ).datepicker();
  });

