solucion(N, Tablero) :- generar(N, Inicial), 
        permutacion(Inicial, Tablero), tablero_valido(Tablero).

generar(0, []).
generar(N, Sec) :- N > 0, N1 is N - 1, generar(N1, Sec1), 
        append(Sec1, [N], Sec).

permutacion([], []).
permutacion([X|Xs], Zs) :- permutacion(Xs, Ys), 
        insertar(X, Ys, Zs).

tablero_valido([]).
tablero_valido([Col|Cols]) :- reina_no_choca(Col, Cols), 
        tablero_valido(Cols).

insertar(X, Xs, [X|Xs]).
insertar(X, [Y|Ys], [Y|Zs]) :- insertar(X, Ys, Zs).

reina_no_choca(Col, Cols) :- reina_no_choca(Col, Cols, 1).
reina_no_choca(_,[],_).
reina_no_choca(Col, [Otra_col|Otras_cols], Otra_fila) :-
        Col =\= Otra_col + Otra_fila, 
        Col =\= Otra_col - Otra_fila,
        Otra_fila1 is Otra_fila + 1,
        reina_no_choca(Col, Otras_cols, Otra_fila1).

% Codigo para imprimir el tablero.
imprimir_solucion(N) :- solucion(N, T), 
        imprimir_tablero(N, T), nl.

imprimir_tablero(_,[]).
imprimir_tablero(N, [Col|Cols]) :- imprimir_fila(N, Col), nl, 
        imprimir_tablero(N, Cols).
imprimir_fila(0,_).
imprimir_fila(N, Col_reina) :- N > 0, 
        imprimir_casillero(Col_reina), 
        N1 is N - 1, Col_reina1 is Col_reina - 1, 
        imprimir_fila(N1, Col_reina1).
imprimir_casillero(1) :- print('R').
imprimir_casillero(N) :- N \== 1, print('-').
