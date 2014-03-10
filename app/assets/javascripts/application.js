// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require jquery_nested_form
//= require foundation
//= require jquery.mask.min
//= require select2
//= require jquery.autotab.min
//= require select2_locale_"pt-BR"
//= require cloudinary
//= require selectize
//= require busca_cliente
//= require busca_aeroporto
//= require masca_campos

$(function(){ $(document).foundation(); });
$(document).ready(function() {
    $("select[name*='cia']").select2({ width: 'resolve' });
    $("#tipo").select2({ 
      width: 'resolve',
      heigth: 'resolve', 
      placeholder: "Tipo de Atendimento" 
    });
});
jQuery(function($){
	 $('.dinheiro').mask("#.##0,00", {reverse: true, maxlength: false});
     $('.data_aereos').autotab({ maxlength: 13 });
     $(".data_aereos").mask("99/99 - 99:99",{
     	completed:function(){
     		
     }
 });



});

$( ".datepicker" ).datepicker();
$('form').on('nested:fieldAdded', function(event) {
    var ad = 'ad-' + event.timeStamp;
    $(event.target).find('.cloudinary-fileupload').addClass(ad).removeClass('cloudinary-fileupload');
	$('.data_aereos').autotab({ maxlength: 13 });
	$(".data_aereos").mask("99/99 - 99:99");
	$('.dinheiro').mask("#.##0,00", {reverse: true, maxlength: false});
	$( ".datepicker" ).datepicker();
    $("select[name*='cia']").select2({ width: 'resolve' });

    $('.'+ad).cloudinary_fileupload();
    
    $('.'+ad).bind('cloudinarydone', function(e, data) {   
        console.log(data.result.public_id);
        $(this).parent().find('input.foto_alvo').val(data.result.public_id);
        $(this).parent().parent().find('.pr-foto > .progress').addClass('success');
     return true;
    });
    $('.'+ad).bind('fileuploadprogress', function(e, data) { 
      $(this).hide();
      $(this).parent().parent().find('.pr-foto > .progress > .meter').css('width', Math.round((data.loaded * 100.0) / data.total) + '%'); 
      $(this).parent().parent().find('.pr-foto > .progress').removeClass('hide');
    });


});


$('.cloudinary-fileupload').bind('cloudinarydone', function(e, data) {   
    console.log(data.result.public_id);
    $(this).parent().find('.foto_alvo').attr('name',data.result.public_id);
 return true;
});

$('.cloudinary-fileupload').bind('fileuploadprogress', function(e, data) { 
  $(this).hide();
  $(this).parent().parent().find('.pr-foto > .progress > .meter').css('width', Math.round((data.loaded * 100.0) / data.total) + '%'); 
  console.log($(this).parent().parent().find('.pr-foto > .progress').removeClass('hide'));
});