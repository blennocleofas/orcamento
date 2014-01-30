$('.b-nome').selectize({
    valueField: 'id',
    labelField: 'nome',
    searchField: ['nome', 'email'],
    maxItems: 1,
    options: [],
    render: {
        item: function(item, escape) {
            return '<div>' +
                (item.nome? '<span class="n">' + escape(item.nome + ' ' + item.sobrenome) + '</span>' : '') +
            '</div>';
        },
        option: function(item, escape) {
            var label = item.nome || item.email;
            var caption = item.nome ? item.email : null;
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
            }
        });
    }
});