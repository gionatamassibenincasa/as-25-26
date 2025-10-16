<?php

function addizione($a, $b) {
    return $a + $b;
}

function sottrazione($a, $b) {
    return $a - $b;
}

function moltiplicazione($a, $b) {
    return $a * $b;
}

function divisione($a, $b) {
    if ($b == 0) {
        return "Errore: Divisione per zero!";
    }
    return $a / $b;
}

$num1 = isset($_GET['num1']) ? (float)$_GET['num1'] : 0;
$num2 = isset($_GET['num2']) ? (float)$_GET['num2'] : 0;
$operazione = isset($_GET['operazione']) ? $_GET['operazione'] : 'addizione';

var_dump($num1, $num2, $operazione);

switch ($operazione) {
    case 'addizione':
        $risultato = addizione($num1, $num2);
        break;
    case 'sottrazione':
        $risultato = sottrazione($num1, $num2);
        break;
    case 'moltiplicazione':
        $risultato = moltiplicazione($num1, $num2);
        break;
    case 'divisione':
        $risultato = divisione($num1, $num2);
        break;
    default:
        $risultato = "Operazione non valida.";
        break;
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Calcolatrice PHP</title>
</head>
<body>
    <h1>Risultato</h1>
    <?= $risultato ?>
</body>
</html>