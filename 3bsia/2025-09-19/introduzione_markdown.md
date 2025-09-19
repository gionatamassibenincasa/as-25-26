# Utilizzare il web

## Indice dei contenuti

1. [Enfasi (Emphasis)](#enfasi-emphasis)
2. [Capoversi e interruzioni di riga (Paragraphs and Line Breaks)](#capoversi-e-interruzioni-di-riga-paragraphs-and-line-breaks)
3. [Titoli (Headings)](#titoli-headings)
4. [Citazioni a blocchi (Blockquotes)](#citazioni-a-blocchi-blockquotes)
5. [Elenchi (Lists)](#elenchi-lists)
6. [Collegamenti (Links)](#collegamenti-links)
7. [Immagini (Images)](#immagini-images)
8. [Codice in linea (Inline Code)](#codice-in-linea-inline-code)
9. [Blocchi di codice (Code Blocks)](#blocchi-di-codice-code-blocks)

## Markdown

### Enfasi (Emphasis)

Si riferisce al testo in **grassetto** oppure in *corsivo*.

* Si racchiude un testo tra `*` o `_` per renderlo *corsivo*.
* Si racchiude un testo tra `**` o `__` per renderlo **grassetto**.

#### Esempio di corsivo

#### MarkDown

```
*corsivo*
```

#### HTML

```
<em>corsivo</em>
```

#### Visualizzazione

*corsivo*

---

#### Esempio di grassetto

#### MarkDown

```
__grassetto__
```

#### HTML

```
<strong>grassetto</strong>
```

#### Visualizzazione

__grassetto__

#### Tag HTML associati

* il *corsivo* viene compilato con il tag `em`.
* il **grassetto** viene compilato con il tag `strong`.

### Capoversi e interruzioni di riga (Paragraphs and Line Breaks)

Un capoverso è una sequenza di linee di testo consecutive, separate tra loro da uno o più spazi bianchi.

Per creare un'**interruzione di riga** (andare a capo senza iniziare un nuovo capoverso), si usa una barra inversa `\` oppure due spazi vuoti alla fine della riga.

#### Esempio di capoverso

#### MarkDown

```
Ciao mondo

Ciao mondo è un esempio tipico nel contesto della programmazione dei computer
```

#### HTML

```
<p>Ciao mondo</p>
<p>Ciao mondo è un esempio tipico nel contesto della programmazione dei computer</p>
```

#### Visualizzazione

Ciao mondo

Ciao mondo è un esempio tipico nel contesto della programmazione dei computer

---

#### Esempio di interruzione di riga

#### MarkDown

```
Si sta come\
d'autunno\
sugli alberi\
le foglie.
```

#### HTML

```
<p>Si sta come<br>
d'autunno<br>
sugli alberi<br>
le foglie.</p>
```

#### Visualizzazione

Si sta come\
d'autunno\
sugli alberi\
le foglie.

#### Tag HTML associati

* il *capoverso* viene compilato con il tag `p`.
* l'*interruzione di riga* viene compilata con il tag `br`.

---

### Titoli (Headings)

I titoli si creano utilizzando il simbolo `#` all'inizio della riga. Più `#` vengono usati, minore sarà il livello del titolo.

#### Esempio

#### MarkDown

```
# Titolo 1
## Titolo 2
### Titolo 3
```

#### HTML

```
<h1>Titolo 1</h1>
<h2>Titolo 2</h2>
<h3>Titolo 3</h3>
```

#### Visualizzazione

# Titolo 1
## Titolo 2
### Titolo 3

---

### Citazioni a blocchi (Blockquotes)

Per creare una citazione a blocchi si usa il simbolo `>` all’inizio della riga.

#### Esempio

#### MarkDown

```
> Questo è un testo citato.
```

#### HTML

```
<blockquote>
<p>Questo è un testo citato.</p>
</blockquote>
```

#### Visualizzazione

> Questo è un testo citato.

---

### Elenchi (Lists)

Gli elenchi possono essere **non ordinati** (puntati) o **ordinati** (numerati). È possibile anche annidarli.

#### Esempio di elenco non ordinato

#### MarkDown

```
* Elemento 1
* Elemento 2
  * Sotto-elemento 2.1
  * Sotto-elemento 2.2
```

#### HTML

```
<ul>
<li>Elemento 1</li>
<li>Elemento 2
  <ul>
    <li>Sotto-elemento 2.1</li>
    <li>Sotto-elemento 2.2</li>
  </ul>
</li>
</ul>
```

#### Visualizzazione

* Elemento 1
* Elemento 2
  * Sotto-elemento 2.1
  * Sotto-elemento 2.2

---

#### Esempio di elenco ordinato

#### MarkDown

```
1. Primo
2. Secondo
   1. Sotto-primo
   2. Sotto-secondo
```

#### HTML

```
<ol>
<li>Primo</li>
<li>Secondo
  <ol>
    <li>Sotto-primo</li>
    <li>Sotto-secondo</li>
  </ol>
</li>
</ol>
```

#### Visualizzazione

1. Primo
2. Secondo
   1. Sotto-primo
   2. Sotto-secondo

---

### Collegamenti (Links)

Per creare un collegamento si usa la sintassi `[testo](URL)`.

#### Esempio

#### MarkDown

```
[Introduzione al MarkDown](https://www.markdownlang.com/it/intro/what-is-markdown.html)
```

#### HTML

```
<a href="https://www.markdownlang.com/it/intro/what-is-markdown.html">Introduzione al MarkDown</a>
```

#### Visualizzazione

[Introduzione al MarkDown](https://www.markdownlang.com/it/intro/what-is-markdown.html)

---

### Immagini (Images)

Per inserire un’immagine si usa la sintassi `![testo alternativo](URL)`.

#### Esempio

#### MarkDown

```
![Logo MarkDown](https://upload.wikimedia.org/wikipedia/commons/4/48/Markdown-mark.svg)
```

#### HTML

```
<img src="https://upload.wikimedia.org/wikipedia/commons/4/48/Markdown-mark.svg" alt="Logo MarkDown">
```

#### Visualizzazione

![Logo MarkDown](https://upload.wikimedia.org/wikipedia/commons/4/48/Markdown-mark.svg)

---

### Codice in linea (Inline Code)

Il codice in linea si scrive racchiudendo il testo tra backtick (`` ` ``).

#### Esempio

#### MarkDown

```
Usa il comando `ls` per elencare i file.
```

#### HTML

```
Usa il comando <code>ls</code> per elencare i file.
```

#### Visualizzazione

Usa il comando `ls` per elencare i file.

---

### Blocchi di codice (Code Blocks)

I blocchi di codice si creano racchiudendo il testo tra tre backtick (```` ``` ````) o indentando le righe con quattro spazi.

#### Esempio

#### MarkDown

````
```
print("Ciao mondo")
```
````

#### HTML

```
<pre><code>print("Ciao mondo")
</code></pre>
```

#### Visualizzazione

```
print("Ciao mondo")