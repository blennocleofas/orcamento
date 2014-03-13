jQuery(function($){
   $("#atendimento_data_ida").mask("99/99/99 99:99", {
        onComplete: function(cep) {
            $("#atendimento_data_volta").focus();
        }
   });
   $("#atendimento_data_volta").mask("99/99/99 99:99", {
        onComplete: function(cep) {
            $("#atendimento_adultos").focus();
        }
   });
   $('#atendimento_telefone').mask("(99) 9999-99999");
});