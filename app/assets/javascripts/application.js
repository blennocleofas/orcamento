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


$(function(){ $(document).foundation(); });
$(document).ready(function() { $("select[name*='cia']").select2({ width: 'resolve' }); });
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
	$('.data_aereos').autotab({ maxlength: 13 });
	$(".data_aereos").mask("99/99 - 99:99");
	$('.dinheiro').mask("#.##0,00", {reverse: true, maxlength: false});
	$( ".datepicker" ).datepicker();
    $("select[name*='cia']").select2({ width: 'resolve' });
});
