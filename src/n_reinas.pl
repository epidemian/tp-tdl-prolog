generar(0, []).
generar(N, [N|L]) :- N1 is N - 1, generar(N1, L).

reina_no_choca(Col, Cols) :- reina_no_choca(Col, 1, Cols).
reina_no_choca(_,_,[]).
reina_no_choca(Col, Fila, [Otra_col|Otras_cols]) :-
        Diag_1 is Col + Fila, Otra_col =\= Diag_1,
        Diag_2 is Col - Fila, Otra_col =\= Diag_2,
        Fila1 is Fila + 1,
        reina_no_choca(Col, Fila1, Otras_cols).


tablero_valido([_]).
tablero_valido([Col|Cols]) :- reina_no_choca(Col, Cols), tablero_valido(Cols).

permutacion([], []).
permutacion([X|Xs], Zs) :- permutacion(Xs, Ys), insertar(X, Ys, Zs).

insertar(X, Xs, [X|Xs]).
insertar(X, [Y|Ys], [Y|Zs]) :- insertar(X, Ys, Zs).

solucion(N, Tablero) :- generar(N, Inicial), permutacion(Inicial, Tablero), tablero_valido(Tablero).


%imprimir_tablero(_,[]).
%imprimir_tablero(N, [Col|Cols]) :- imprimir_fila(N, Col), nl, imprimir_tablero(N, Cols).
%imprimir_fila(N, Col_reina) :- imprimir_fila(N, 1, Col_reina).
%imprimir_fila(N, Col, Col_reina) :- Col =< N, imprimir_casillero(Col, Col_reina), Col1 is Col + 1, imprimir_fila(N, Col1, Col_reina).
%imprimir_fila(_,_,_).
%imprimir_casillero(Col_reina, Col_reina) :- !,print(r).
%imprimir_casillero(_, _) :- print(o).

%imprimir_solucion(N) :- solucion(N, T), imprimir_tablero(N, T), nl.
