<?php

if ($_GET["pizza"] == "margherita") {
    $src = 'https://cdn.pixabay.com/photo/2017/07/22/22/57/pizza-2530169_1280.jpg';
} elseif ($_GET["pizza"] == "diavola") {
    $src = 'https://cdn.pixabay.com/photo/2021/09/02/13/26/salami-pizza-6593465_1280.jpg';
} elseif ($_GET["pizza"] == "capricciosa") {
    $src = 'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_1280.jpg';
}
?>
<html>
    <head>
        <title>Consegna Pizza</title>
    </head>
    <body>
        <h1>La tua pizza <?php echo $_GET["pizza"]; ?> sta arrivando!</h1>
        <a href="pizza.html">
        <img src="<?php echo $src; ?>" alt="Pizza" width="300">
        </a>

    </body>