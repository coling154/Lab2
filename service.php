<?php
//This PHP file returns json response of list of book.
//Ideally this should be REST-API with necessary security features
//But for simplicity, we are using a simple PHP file


function getBooksData() {
    $json = file_get_contents('data.json');
    return json_decode($json);
}
