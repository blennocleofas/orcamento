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
            },
        });
    },
    create: function(input) {
        alert('Invalid email address.');
        return false;
    }
});


var REGEX_EMAIL = '([a-z0-9!#$%&\'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&\'*+/=?^_`{|}~-]+)*@' +
                  '(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)';

$('#select-to').selectize({
    persist: false,
    maxItems: null,
    valueField: 'email',
    labelField: 'name',
    searchField: ['name', 'email'],
    options: [],
    render: {
        item: function(item, escape) {
            return '<div>' +
                (item.name ? '<span class="name">' + escape(item.name) + '</span>' : '') +
                (item.email ? '<span class="email">' + escape(item.email) + '</span>' : '') +
            '</div>';
        },
        option: function(item, escape) {
            var label = item.name || item.email;
            var caption = item.name ? item.email : null;
            return '<div>' +
                '<span class="label">' + escape(label) + '</span>' +
                (caption ? '<span class="caption">' + escape(caption) + '</span>' : '') +
            '</div>';
        }
    },
    create: function(input) {
        if ((new RegExp('^' + REGEX_EMAIL + '$', 'i')).test(input)) {
            return {email: input};
        }
        var match = input.match(new RegExp('^([^<]*)\<' + REGEX_EMAIL + '\>$', 'i'));
        if (match) {
            return {
                email : match[2],
                name  : $.trim(match[1])
            };
        }
        alert('Invalid email address.');
        return false;
    }
});