$('.b-nome').selectize({
    plugins: ['restore_on_backspace'],
    valueField: 'id',
    labelField: 'nome',
    searchField: ['nome', 'email', 'sobrenome'],
    maxItems: 1,
    options: [],
    onChange: function(name) {
    return $('#atendimento_email').focus();
    },
    render: {
        item: function(item, escape) {
            return '<div>' +
                (item.nome? '<span class="n">' + escape(item.nome + ' ' + item.sobrenome) + '</span>' : '') +
            '</div>';
        },
        option: function(item, escape) {
            var label = item.nome + " " + item.sobrenome || item.email;
            var caption = item.nome + " " + item.sobrenome ? item.email : null;
            return '<div>' +
                '<span class="n">' + escape(label) + '</span>' +
                (caption ? '<span class="e">' + escape(caption) + '</span>' : '') +
            '</div>';
        }
    },
    load: function(query, callback) {
        if (!query.length) return callback();
        $.ajax({
            url: '/api/cliente',
            type: 'GET',
            dataType: 'jsonp',
            data: {
                 q: query,
            },
            error: function() {
                callback();
            },
            success: function(res) {
                callback(res);
            },
        });
    },
    create: function(input) {
        var split = input.split(" ");
        var nome = split.slice(0, 1).join(' ');
        var sobrenome = split.slice(1).join(' ');
        $('#myModal').foundation('reveal', 'open');
        $('.cad-usuario').val(nome);
        $('.cad-snome').val(sobrenome);
        $('.cad-email').focus();
        console.log(input);
        return false;
    },
});



// Enviar Formulário Via Ajax
$('#new_cliente').on('ajax:success', function(e, data, status, xhr){
    console.log(data);
    $('b-nome').val(data.id);
    $('input.b-nome').parent().find('div.selectize-control.b-nome.single');
    $('#myModal').foundation('reveal', 'close');
}
);
