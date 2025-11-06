<?php
	$titolo = "Benvenuto nel mio sito web";
	$messaggio = "Ciao! Questo è un semplice esempio di una pagina PHP che genera contenuto HTML dinamicamente.";
	$studenti = array("Luca", "Maria", "Giovanni", "Anna", "Francesca");
?>
<!DOCTYPE html>
<html lang="it">
	<head>
	<title><?php print($titolo); ?></title>
		<meta charset="utf-8">
	</head>
	<body>
		<h1><?php print($titolo); ?></h1>
		<p><?php print($messaggio); ?></p>
		<h2>Elenco degli studenti:</h2>
		<ul>
			<?php
				foreach ($studenti as $studente) {
					print("<li>" . $studente . "</li>\n");
				}
			?>
		</ul>
	</body>
</html>

