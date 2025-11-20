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