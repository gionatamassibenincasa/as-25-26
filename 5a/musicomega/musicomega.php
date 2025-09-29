<?php
try {
    $pdo = new PDO('sqlite:musicomega.db3');
} catch (PDOException $e) {
    echo $e->getMessage();
    die();
}
$sql = 'SELECT idBrano, titolo FROM Brano ORDER BY titolo';
$elencoBrani = $pdo->query($sql)->fetchAll();
// var_dump($elencoBrani);
?>
<!DOCTYPE html>
<html>

<head>
    <title>Brani e like</title>
    <meta charset="utf-8">
</head>

<body>
<?php
	if (! isset($_GET["idBrano"])) {
?>
    <form method="GET">
        <h1>Scegli un brano</h1>
        <div>
            <label for="idBrano">
                Scegli un brano:
                <select name="idBrano" id="idBrano">
<?php
for ($i = 0; $i < count($elencoBrani); $i++) {
    echo '<option value="' . $elencoBrani[$i]['idBrano'] . '">' . $elencoBrani[$i]['titolo'] . '</option>';
}
?>
                </select>
            </label>
        </div>

        <div>
            <button type="reset">Cancella</button>
            <button type="submit">Invia</button>
        </div>
    </form>
<?php
	}
	else {
        // Usa PDO::prepare per preparare la query con un placeholder
        $sql = 'SELECT titolo, sum(COALESCE(like, 0)) AS numLike FROM Brano AS B LEFT OUTER JOIN Ascolto AS A ON B.idBrano = A.idBrano WHERE B.idBrano = :idBrano GROUP BY B.idBrano';
        $likeBranoStmt = $pdo->prepare($sql);

        // Esegui la query passando i parametri con PDOStatement::execute()
        $likeBranoStmt->execute([':idBrano' => $_GET["idBrano"]]);
        
        // Recupera il risultato
        $likeBrano = $likeBranoStmt->fetch();
        echo '<h1>' . $likeBrano['titolo'] . '</h1>';
        echo '<p>Numero like: ' . $likeBrano['numLike'] . ' </p>';
        echo '<p><a href="musicomega.php">Torna alla lista</a></p>';
?>

<?php
	}
?>
</body>

</html>
