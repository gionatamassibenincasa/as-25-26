<!--
author:   Gionata Massi

email:    gionata.massi@savoiabenincasa.it

version:  0.0.1

language: it

narrator: IT Italian Male

comment:  Quaderno elettronico di Informatica. Classe 3za. Capitolo 4. Il linguaggio C++.

import: https://raw.githubusercontent.com/LiaScript/CodeRunner/master/README.md

import: https://raw.githubusercontent.com/liascript-templates/plantUML/master/README.md

-->

# Il linguaggio C++

[Visualizza su LiaScript](https://liascript.github.io/course/?https://raw.githubusercontent.com/gionatamassibenincasa/as-25-26/refs/heads/main/3bsia/quaderno/README.md#1)

Appunti del capitolo 4 del libro di testo pp. 86--121.

Per ogni programma presentato nel testo (pp. 86, 93, 98, 99, 103, 105, 106, 107, 109, 110, 112, 115, 118, 119, 121):

1. **Predict** Esamina il programma e cerca di capire cosa farà;
2. Copia il programma in modo da poterlo eseguire sul computer; eseguilo per verificare la previsione; 
3. **Investigate** Copia il programma su PythonTutor/linguaggio C++ ed esegui passo passo il programma per comprendere come evolve il processo generato dal programma. Controlla l'evoluzione della memoria ad ogni operazione di assegnamento; Copia il link dell'esecuzione del programma (Generate embed code).
4. **Modify** Modifica il codice cambiando prima qualcosa di semplice, quindi apportate sempre più modifiche per appropriarti poco alla volta del codice sorgente. Ad esempio, se il programma usa dati scritti nel codice sorgente, modifica il programma per chiedere i dati tramite un'istruzione di input; se un programma usa valori di tipo intero, prova a sostituirli con numeri in virgola mobile...
5. **Make** Scrivi un nuovo programma, in cui puoi prendere in prestito frammenti di codice dal programma originale, che realizza una funzione diversa, oppure la stessa funzione applicata in un contesto, o problema, diverso.

## Le basi del linguaggio

**Indice**

- [Somma - pag. 86](#3)
- [Tipi - pag. 93](#9)
- [Assegnazionie - pag. 94](#15)

### Somma.cpp - pag. 86 

``` c +Somma.cpp
// Somma.cpp
#include <iostream>
using namespace std;

int main() {
    int a, b, s;
    cin >> a;
    cin >> b;
    s = a + b;
    cout << s;

    return 0;
}
```
@LIA.cpp

#### 1. Predict (p. 86)

Il programma dichiara tre variabili intere, `a`, `b` e `s`.
Legge due numeri interi dati in ingresso memorizzandoli nelle variabili `a` e `b`, calcola la somma di queste due variabili memorizzandola in `s` e ne stampa il valore.

#### 2. Run (p. 86)

Il programma conferma la previsione

#### 3. Investigate (p. 86)

``` cpp +Somma.cpp
// Somma.cpp
#include <iostream>
using namespace std;

int main() {
    int a, b, s;
    cin >> a;
    cin >> b;
    s = a + b;
    cout << s;

    return 0;
}
```
@LIA.evalWithDebug(`["Somma.cpp"]`, `g++ -g -Wall Somma.cpp -o a.out`, `./a.out`)


Per usare PythonTutor devo impostare dei valori alle variabili di input.
Uso 1 e 2.

<iframe width="800" height="500" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=%23include%20%3Ciostream%3E%0Ausing%20namespace%20std%3B%0A%0Aint%20main%28%29%20%7B%0A%20%20%20%20int%20a,%20b,%20s%3B%0A%20%20%20%20//cin%20%3E%3E%20a%3B%0A%20%20%20%20a%20%3D%201%3B%0A%20%20%20%20//cin%20%3E%3E%20b%3B%0A%20%20%20%20b%20%3D%202%3B%0A%20%20%20%20s%20%3D%20a%20%2B%20b%3B%0A%20%20%20%20cout%20%3C%3C%20s%3B%0A%0A%20%20%20%20return%200%3B%0A%7D&codeDivHeight=400&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=cpp_g%2B%2B9.3.0&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe>

#### 4. Modify  (p. 86)

Voglio aggiungere informazioni all'utente per comunicare di immettere i numeri intero, voglio essere più descrittivo e andare a capo nell'output.

``` cpp +Somma.cpp
/**
 * @file somma.cpp
 * @brief Programma che calcola la somma di due numeri interi.
 *
 * Programma didattico che legge due numeri interi
 * da standard input e stampa la loro somma su standard output.
 *
 * @author Gionata
 * @date 2025-11-20
 * @version 1.0
 * @note Compilare con: g++ -std=c++17 -g -o somma somma.cpp
 */

// Inclusione della libreria standard per input/output
#include <iostream> // dichiarazione di cin, cout, endl

// Usa lo spazio dei nomi standard (manteniamo lo stile originale)
using namespace std;

/**
 * @brief Punto di ingresso del programma.
 *
 * Il programma richiede all'utente due numeri interi, li somma e
 * stampa il risultato formattato. Non effettua controlli di errore
 * sull'input (si assume che l'utente inserisca interi validi).
 *
 * Esempio di esecuzione:
 * @code
 * Immetti un addendo intero: 3
 * Immetti un altro addendo intero: 5
 * La somma di 3 e 5 e' pari a 8.
 * @endcode
 *
 * @return int Ritorna 0 se il programma termina correttamente.
 */
int main() {
    // Dichiarazione delle variabili:
    // a, b: addendi; s: somma
    int a; /**< Primo addendo */
    int b; /**< Secondo addendo */
    int s; /**< Somma dei due addendi */

    // Input dei due addendi
    cout << "Immetti un addendo intero: ";
    cin >> a;

    cout << "Immetti un altro addendo intero: ";
    cin >> b;

    // Calcolo della somma
    s = a + b;

    // Output del risultato
    cout << "La somma di " << a << " e " << b << " e' pari a " << s << "." << endl;

    // Termine del programma senza errori
    return 0;
}
```
@LIA.cpp

#### 5. Make (p. 86)

Scrivo un nuovo programma che calcola il prodotto.

``` cpp +Prodotto.cpp
// Prodotto.cpp
#include <iostream>
using namespace std;

int main() {
    int a, b, p;
    cout << "Immetti un moltiplicando intero: ";
    cin >> a;
    cout << "Immetti un altro moltiplicando intero: ";
    cin >> b;
    p = a * b;
    cout << "Il prodotto di " << a << " e " << b << " e' pari a " << p << "." << endl;

    return 0;
}
```
@LIA.cpp

## Dichiarazione di variabili

### Tipi.cpp - pag. 93

``` c +Tipi.cpp
// Tipi.cpp
#include <iostream>
using namespace std;

int main() {
    cout << "Dimensione di int: " << sizeof(int) << " byte\n";
    cout << "Dimensione di short int: " << sizeof(short int) << " byte\n";
    cout << "Dimensione di long int: " << sizeof(long int) << " byte\n";
    cout << "Dimensione di long long int: " << sizeof(long long int) << " byte\n";
    cout << "Dimensione di float: " << sizeof(float) << " byte\n";
    cout << "Dimensione di double: " << sizeof(double) << " byte\n";
    cout << "Dimensione di long double: " << sizeof(long double) << " byte\n";
    cout << "Dimensione di char: " << sizeof(char) << " byte\n";
    cout << "Dimensione di bool: " << sizeof(bool) << " byte\n";
    return 0;
}
```
@LIA.cpp

#### 1. Predict (p. 93)

Il programma mostra il numero di byte usati dal sistema per rappresentare un tipo.

#### 2. Run (p. 93)

Il programma conferma la previsione.

#### 3. Investigate (p. 93)

``` c +Tipi.cpp
// Tipi.cpp
#include <iostream>
using namespace std;

int main() {
    cout << "Dimensione di int: " << sizeof(int) << " byte\n";
    cout << "Dimensione di short int: " << sizeof(short int) << " byte\n";
    cout << "Dimensione di long int: " << sizeof(long int) << " byte\n";
    cout << "Dimensione di long long int: " << sizeof(long long int) << " byte\n";
    cout << "Dimensione di float: " << sizeof(float) << " byte\n";
    cout << "Dimensione di double: " << sizeof(double) << " byte\n";
    cout << "Dimensione di long double: " << sizeof(long double) << " byte\n";
    cout << "Dimensione di char: " << sizeof(char) << " byte\n";
    cout << "Dimensione di bool: " << sizeof(bool) << " byte\n";
    return 0;
}
```
@LIA.cpp

<iframe width="800" height="500" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=//%20Tipi.cpp%0A%23include%20%3Ciostream%3E%0Ausing%20namespace%20std%3B%0A%0Aint%20main%28%29%20%7B%0A%20%20%20%20cout%20%3C%3C%20%22Dimensione%20di%20int%3A%20%22%20%3C%3C%20sizeof%28int%29%20%3C%3C%20%22%20byte%5Cn%22%3B%0A%20%20%20%20cout%20%3C%3C%20%22Dimensione%20di%20short%20int%3A%20%22%20%3C%3C%20sizeof%28short%20int%29%20%3C%3C%20%22%20byte%5Cn%22%3B%0A%20%20%20%20cout%20%3C%3C%20%22Dimensione%20di%20long%20int%3A%20%22%20%3C%3C%20sizeof%28long%20int%29%20%3C%3C%20%22%20byte%5Cn%22%3B%0A%20%20%20%20cout%20%3C%3C%20%22Dimensione%20di%20long%20long%20int%3A%20%22%20%3C%3C%20sizeof%28long%20long%20int%29%20%3C%3C%20%22%20byte%5Cn%22%3B%0A%20%20%20%20cout%20%3C%3C%20%22Dimensione%20di%20float%3A%20%22%20%3C%3C%20sizeof%28float%29%20%3C%3C%20%22%20byte%5Cn%22%3B%0A%20%20%20%20cout%20%3C%3C%20%22Dimensione%20di%20double%3A%20%22%20%3C%3C%20sizeof%28double%29%20%3C%3C%20%22%20byte%5Cn%22%3B%0A%20%20%20%20cout%20%3C%3C%20%22Dimensione%20di%20long%20double%3A%20%22%20%3C%3C%20sizeof%28long%20double%29%20%3C%3C%20%22%20byte%5Cn%22%3B%0A%20%20%20%20cout%20%3C%3C%20%22Dimensione%20di%20char%3A%20%22%20%3C%3C%20sizeof%28char%29%20%3C%3C%20%22%20byte%5Cn%22%3B%0A%20%20%20%20cout%20%3C%3C%20%22Dimensione%20di%20bool%3A%20%22%20%3C%3C%20sizeof%28bool%29%20%3C%3C%20%22%20byte%5Cn%22%3B%0A%20%20%20%20return%200%3B%0A%7D&codeDivHeight=400&codeDivWidth=350&cumulative=false&curInstr=0&heapPrimitives=nevernest&origin=opt-frontend.js&py=cpp_g%2B%2B9.3.0&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe>

#### 4. Modify  (p. 93)

Riscrivo il codice in modo da ordinare per dimensione ed esattezza.
Aggiungo i commenti

``` c +Tipi.cpp
// Tipi.cpp
#include <iostream>
using namespace std;

int main() {
    // Tipo per rappresentare i caratteri o i numeri tra -128 e + 127
    cout << "Dimensione di char: " << sizeof(char) << " byte\n";
    // Numeri interi senza segno tra 0 e 255
    cout << "Dimensione di unsigned char: " << sizeof(unsigned char) << " byte\n";
    // Valori logici: false oppure true 
    cout << "Dimensione di bool: " << sizeof(bool) << " byte\n";
    // Tipi interi
    // Corti con segno
    cout << "Dimensione di short int: " << sizeof(short int) << " byte\n";
    // Corti senza segno
    cout << "Dimensione di unsigned short int: " << sizeof(unsigned short int) << " byte\n";
    // Senza modificatore
    cout << "Dimensione di int: " << sizeof(int) << " byte\n";
    // Senza segno
    cout << "Dimensione di unsigned int: " << sizeof(unsigned int) << " byte\n";
    // Interi lunghi con segno
    cout << "Dimensione di long int: " << sizeof(long int) << " byte\n";
    // Interi lunghi senza segno
    cout << "Dimensione di unsigned long int: " << sizeof(unsigned long int) << " byte\n";
    // Interi lunghissimi
    cout << "Dimensione di long long int: " << sizeof(long long int) << " byte\n";
    // Interi lunghissimi senza segno
    cout << "Dimensione di unsigned long long int: " << sizeof(unsigned long long int) << " byte\n";
    // Tipi approssimati con la virgola
    // Virgola mobile, precisione semplice
    cout << "Dimensione di float: " << sizeof(float) << " byte\n";
    // Virgola mobile, precisione doppia
    cout << "Dimensione di double: " << sizeof(double) << " byte\n";
    // Virgola mobile, massima precisione offerta dalla macchina
    cout << "Dimensione di long double: " << sizeof(long double) << " byte\n";

    return 0;
}
```
@LIA.cpp

#### 5. Make (p. 93)

Aggiungo il tipo `void`.

``` c +Tipi.cpp
// Tipi.cpp
#include <iostream>
using namespace std;

int main() {
    // Tipo per rappresentare l'assenza di informazione
    // Potrei avere sorprese!
    cout << "Dimensione di void: " << sizeof(void) << " byte\n";
    // Tipo per rappresentare i caratteri o i numeri tra -128 e + 127
    cout << "Dimensione di char: " << sizeof(char) << " byte\n";
    // Numeri interi senza segno tra 0 e 255
    cout << "Dimensione di unsigned char: " << sizeof(unsigned char) << " byte\n";
    // Valori logici: false oppure true 
    cout << "Dimensione di bool: " << sizeof(bool) << " byte\n";
    // Tipi interi
    // Corti con segno
    cout << "Dimensione di short int: " << sizeof(short int) << " byte\n";
    // Corti senza segno
    cout << "Dimensione di unsigned short int: " << sizeof(unsigned short int) << " byte\n";
    // Senza modificatore
    cout << "Dimensione di int: " << sizeof(int) << " byte\n";
    // Senza segno
    cout << "Dimensione di unsigned int: " << sizeof(unsigned int) << " byte\n";
    // Interi lunghi con segno
    cout << "Dimensione di long int: " << sizeof(long int) << " byte\n";
    // Interi lunghi senza segno
    cout << "Dimensione di unsigned long int: " << sizeof(unsigned long int) << " byte\n";
    // Interi lunghissimi
    cout << "Dimensione di long long int: " << sizeof(long long int) << " byte\n";
    // Interi lunghissimi senza segno
    cout << "Dimensione di unsigned long long int: " << sizeof(unsigned long long int) << " byte\n";
    // Tipi approssimati con la virgola
    // Virgola mobile, precisione semplice
    cout << "Dimensione di float: " << sizeof(float) << " byte\n";
    // Virgola mobile, precisione doppia
    cout << "Dimensione di double: " << sizeof(double) << " byte\n";
    // Virgola mobile, massima precisione offerta dalla macchina
    cout << "Dimensione di long double: " << sizeof(long double) << " byte\n";

    return 0;
}
```
@LIA.cpp

## Assegnazione

### File.cpp - pag. 94

``` c +assegnazione.cpp
// assegnazione.cpp
#include <string>
#include <iostream>
using namespace std;

int main() {
    double raggio = 10;
    double area = raggio * raggio * 3.14;
    int tempo_in_sec = 900;
    int durata_in_minuti = tempo_in_sec / 60;
    double spazio = 1000; // 1 km
    double tempo = 6 * 60; // 6 minuti
    double velocita = spazio / tempo;
    const string cognome = "Rossi";
    string nome("Mario");
    
    cout << cognome << " " << nome << endl;

    return 0;
}
```
@LIA.cpp

#### 1. Predict (p. 94)

Il programma dichiara alcune variabili e costanti con tipi primitivi e definiti dalla libreria standard (string).
In alcuni casi assegna alla variabile un valore letterale, in altri un valore prodotto da un'espressione.

#### 2. Run (p. 94)

#### 3. Investigate (p. 94)

<iframe width="800" height="500" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=//%20assegnazione.cpp%0A%23include%20%3Cstring%3E%0A%23include%20%3Ciostream%3E%0Ausing%20namespace%20std%3B%0A%0Aint%20main%28%29%20%7B%0A%20%20%20%20double%20raggio%20%3D%2010%3B%0A%20%20%20%20double%20area%20%3D%20raggio%20*%20raggio%20*%203.14%3B%0A%20%20%20%20int%20tempo_in_sec%20%3D%20900%3B%0A%20%20%20%20int%20durata_in_minuti%20%3D%20tempo_in_sec%20/%2060%3B%0A%20%20%20%20double%20spazio%20%3D%201000%3B%20//%201%20km%0A%20%20%20%20double%20tempo%20%3D%206%20*%2060%3B%20//%206%20minuti%0A%20%20%20%20double%20velocita%20%3D%20spazio%20/%20tempo%3B%0A%20%20%20%20const%20string%20cognome%20%3D%20%22Rossi%22%3B%0A%20%20%20%20string%20nome%28%22Mario%22%29%3B%0A%20%20%20%20%0A%20%20%20%20cout%20%3C%3C%20cognome%20%3C%3C%20%22%20%22%20%3C%3C%20nome%20%3C%3C%20endl%3B%0A%0A%20%20%20%20return%200%3B%0A%7D&codeDivHeight=400&codeDivWidth=350&cppShowMemAddrs=true&cumulative=false&curInstr=15&heapPrimitives=nevernest&origin=opt-frontend.js&py=cpp_g%2B%2B9.3.0&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe>

#### 4. Modify  (p. 94)

#### 5. Make (p. 94)
