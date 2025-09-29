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
    <form>
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
</body>

</html>