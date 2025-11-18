<!--
author:   Gionata Massi

email:    gionata.massi@savoiabenincasa.it

version:  0.0.1

language: it

narrator: IT Italian Male

comment:  Quaderno elettronico di Informatica. Classe 4ta. Capitolo 8. I dati in rete con pagine PHP.

import: https://raw.githubusercontent.com/LiaScript/CodeRunner/master/README.md

import: https://raw.githubusercontent.com/liascript-templates/plantUML/master/README.md

-->

## I dati in rete con pagine PHP

[Visualizza su LiaScript](https://liascript.github.io/course/?https://raw.githubusercontent.com/gionatamassibenincasa/as-25-26/refs/heads/main/4asia/quaderno/README.md#1)

Appunti del capitolo 8 del libro di testo pp. 316--351.

Per ogni programma presentato nel testo (pp. 317, 318 (2), 319, 321 (2), 322, 324, 325, 326, 327-8 (2), 329 (2), 331, 333 (2), 334, 338, 339-40, 341-2, 342-4, 346, 347, 348, 348-9, 349, 350-1):

1. **Predict** Esamina il programma e cerca di capire cosa farà;
2. Copia il programma in modo da poterlo eseguire sul computer; eseguilo per verificare la previsione; 
3. **Investigate** Copia il programma su PythonTutor/linguaggio C++ ed esegui passo passo il programma per comprendere come evolve il processo generato dal programma. Controlla l'evoluzione della memoria ad ogni operazione di assegnamento.
4. **Modify** Modifica il codice cambiando prima qualcosa di semplice, quindi apportate sempre più modifiche per appropriarti poco alla volta del codice sorgente. Ad esempio, se il programma usa dati scritti nel codice sorgente, modifica il programma per chiedere i dati tramite un'istruzione di input; se un programma usa valori di tipo intero, prova a sostituirli con numeri in virgola mobile...
5. **Make** Scrivi un nuovo programma, in cui puoi prendere in prestito frammenti di codice dal programma originale, che realizza una funzione diversa, oppure la stessa funzione applicata in un contesto, o problema, diverso.

## Le basi del linguaggio

Es. pag 319

### Numeri casuali - Pag. 319 - numericasuali.php

``` php +numericasuali.php
<!DOCTYPE html>
<html>
    <head>
        <title>Numeri casuali</title>
    </head>
    <body>
        <h1>Numeri generati</h1>
        <?php
            // genera tre numeri casuali tra 1 e 90
            echo rand(1, 90) . "<br>\n";
            echo rand(1, 90) . "<br>\n";
            echo rand(1, 90) . "<br>\n";
        ?>
    </body>
</html>
```
@LIA.php

#### 1. Predict (p. 319)

Il programma genera una pagina HTML con tre numeri casuali tra 1 e 90.

#### 2. Run (p. 319)

Il programma conferma la previsione.

#### 3. Investigate (p. 319)

``` php +numericasuali.php
<!DOCTYPE html>
<html>
    <head>
        <title>Numeri casuali</title>
    </head>
    <body>
        <h1>Numeri generati</h1>
        <?php
            // genera tre numeri casuali tra 1 e 90
            echo rand(1, 90) . "<br>\n";
            echo rand(1, 90) . "<br>\n";
            echo rand(1, 90) . "<br>\n";
        ?>
    </body>
</html>
```
@LIA.php


#### 4. Modify  (p. 319)

Uso un ciclo `for`.

``` php +numericasuali.php
<!DOCTYPE html>
<html>
    <head>
        <title>Numeri casuali</title>
    </head>
    <body>
        <h1>Numeri generati</h1>
        <?php
            for($i = 0; $i < 10; $i++) {
                // genera tre numeri casuali tra 1 e 90
                echo rand(1, 90) . "<br>\n";
            }
        ?>
    </body>
</html>
```
@LIA.php

#### 5. Make (p. 319)

``` php +numericasuali.php
<!DOCTYPE html>
<html>
    <head>
        <title>Numero casuale pari tra 2 e 50</title>
    </head>
    <body>
        <h1>Numero generato</h1>
        <?php
            // genera tre numeri casuali pari tra 2 e 50 
            echo (2*rand(1, 25)) . "<br>\n";
        ?>
    </body>
</html>
```
@LIA.php

### Array - Pag. 325 - array.php

``` php +array.php
<!DOCTYPE html> 
<html>
    <head>
        <title>Array e tipi</title>
    </head> 
    <body>
        <h2>Array: tipi e valori</h2> 
        <hr> 
        <?php
$dati = array(30, "Roma", 12.7, true, null);
echo 'var_dump($dati[0]) = '; echo var_dump($dati[0]) . '<br>';
echo 'var_dump($dati[1]) = '; echo var_dump($dati[1]) . '<br>';
echo 'var_dump($dati[2]) = '; echo var_dump($dati[2]) . '<br>';
echo 'var_dump($dati[3]) = '; echo var_dump($dati[3]) . '<br>';
echo 'var_dump($dati[4]) = '; echo var_dump($dati[4]) . '<br>';
echo '<hr>';
echo 'count($dati) = '; echo count($dati) . '<br>';
        ?>
    </body> 
</html>
```

#### 1. Predict (p. 325)

#### 2. Run (p. 325)

``` php +array.php
<!DOCTYPE html> 
<html>
    <head>
        <title>Array e tipi</title>
    </head> 
    <body>
        <h2>Array: tipi e valori</h2> 
        <hr> 
        <?php
$dati = array(30, "Roma", 12.7, true, null);
echo 'var_dump($dati[0]) = '; echo var_dump($dati[0]) . '<br>';
echo 'var_dump($dati[1]) = '; echo var_dump($dati[1]) . '<br>';
echo 'var_dump($dati[2]) = '; echo var_dump($dati[2]) . '<br>';
echo 'var_dump($dati[3]) = '; echo var_dump($dati[3]) . '<br>';
echo 'var_dump($dati[4]) = '; echo var_dump($dati[4]) . '<br>';
echo '<hr>';
echo 'count($dati) = '; echo count($dati) . '<br>';
        ?>
    </body> 
</html>
```
@LIA.php

#### 3. Investigate (p. 325)

#### 4. Modify (p. 325)

#### 5. Make (p. 325)


``` php + classe.php
<?php
$classe4ASIA = array(
    array("Arancioni", "Filippo"),
    array("Bianchi", "Michele"),
    array("Celestini", "Kamilia")
    );
    
foreach ($classe4ASIA as $indice => $studente)
    print ($indice + 1). ". " . $studente[1] . " " . $studente[0] . "\n";
?>
```
@LIA.php