$('.b-aeroporto').selectize({
    valueField: 'longName',
    labelField: 'longName',
    searchField: ['shortName'],
    maxItems: 1,
    options: [],
    render: {
        item: function(item, escape) {
            return '<div>' +
                '<span class="n">' + escape(item.shortName + '(' + item.regionName +')' + ' (' + item.code + ')') + '</span>' +
            '</div>';
        },
        option: function(item, escape) {
            var label = item.longName|| item.longName;
            var caption = item.regionCode ? item.regionCode : null;
            return '<div>' +
                '<span class="n">' + escape(label) + '</span>' +
                (caption ? '<span class="e">' + escape(caption) + '</span>' : '') +
            '</div>';
        }
    },
    load: function(query, callback) {
        if (!query.length) return callback();
        $.ajax({
            url: '/api/aeroporto',
            type: 'GET',
            dataType: 'json',
            data: {
                 q: query,
            },
            error: function() {
                callback();
            },
            success: function(res) {
                callback(res.places);
            }
        });
    }
});