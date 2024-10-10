$( document ).ready(function() {
    $('#starter').html('<div id="loading">Loading...</div>');
    fetchData();
});

function fetchData() {
    
    $.ajax({
        url: 'service.php',
        type: 'GET',
        success: function (response) {
            var booksData = JSON.parse(response);

            renderBooks(booksData);
        },
    });
}

function renderBooks(booksData) {
    $.get('books.mustache', function (template) {
        var rendered = Mustache.render(template, { books: booksData });

        $('#starter').html(rendered);
    });
}

