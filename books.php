<?php
require 'vendor/autoload.php';
require 'service.php';


$m = new Mustache_Engine([
'loader' => new Mustache_Loader_FilesystemLoader(dirname(__FILE__))
]);

$books = getBooksData();


echo $m->render('page', [
'books' => $books
]);
