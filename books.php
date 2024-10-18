<?php
require 'vendor/autoload.php';
require 'service.php';

$m = new Mustache_Engine([
    'loader' => new Mustache_Loader_FilesystemLoader(dirname(__FILE__))
]);

$books = getBooksData();

// Render the books.mustache separately
$booksContent = $m->render('books', [
    'books' => $books
]);

// Render the page.mustache with the books_content
echo $m->render('page', [
    'books_content' => $booksContent
]);