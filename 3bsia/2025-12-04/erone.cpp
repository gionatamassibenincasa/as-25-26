#include <iostream>
using namespace std;

/**
 * @brief Calcola la media aritmetica di due valori.
 *
 * @param x Prima stima (o valore)
 * @param y Seconda stima (o valore)
 * @return double Media aritmetica di `x` e `y`.
 */
double media(double x, double y);

/**
 * @brief Migliora la stima della radice quadrata di `r` usando la stima `s`.
 *
 * Usa la media tra `s` e `r/s` secondo il metodo di Erone.
 *
 * @param r Radicando (valore di cui si vuole la radice quadrata)
 * @param s Stima corrente della radice quadrata
 * @return double Nuova stima migliorata
 */
double migliora_stima(double r, double s);

/**
 * @brief Restituisce il quadrato di un numero.
 *
 * @param x Valore di cui calcolare il quadrato
 * @return double Quadrato di `x` (x * x)
 */
double quadrato(double x);

/**
 * @brief Restituisce il valore assoluto di un numero.
 *
 * @param x Valore di cui calcolare il valore assoluto
 * @return double Valore assoluto di `x`
 */
double val_ass(double x);

/**
 * @brief Verifica se la stima `s` è sufficientemente accurata per il radicando `r`.
 *
 * Confronta |s*s - r| con una tolleranza fissata (1E-9).
 *
 * @param s Stima della radice quadrata
 * @param r Radicando
 * @return true Se la stima è accurata entro la tolleranza
 * @return false Altrimenti
 */
bool accurata(double s, double r);

/**
 * @brief Iterazione ricorsiva del metodo di Erone per calcolare la radice quadrata.
 *
 * @param r Radicando
 * @param s Stima corrente
 * @return double Stima finale della radice quadrata di `r`
 */
double radq_iter(double r, double s);

/**
 * @brief Calcola la radice quadrata di `r` utilizzando `radq_iter`.
 *
 * Inizializza la stima a 1 e richiama la procedura iterativa.
 *
 * @param r Radicando
 * @return double Radice quadrata approssimata di `r`
 */
double radq(double r);


double media(double x, double y) {
	return (x + y) / 2;
}

double migliora_stima(double r, double s) {
	return media(s, r / s);
}

double quadrato(double x) {
	return x * x;
}

double val_ass(double x) {
	if (x < 0)
		return -x;
	return x;
}

bool accurata(double s, double r) {
	return val_ass(quadrato(s)-r) < 1E-9;
}

double radq_iter(double r, double s) {
	if (accurata(s, r))
		return s;
	// else
	return radq_iter(r, migliora_stima(r, s));
}

double radq(double r) {
	return radq_iter(r, 1);
}

int main() {
	cout << "Immetti il radicando: ";
	double radicando;
	cin >> radicando;
	cout << "Radice quadrata: " << radq(radicando) << endl;

	return 0;
}
