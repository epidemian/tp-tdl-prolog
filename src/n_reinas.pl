generar(N, Sec) :- generar(N, [], Sec).
generar(0, Acum, Acum) :- !.
generar(N, Acum, Sec) :- N1 is N - 1, generar(N1, [N|Acum], Sec).

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

% Código fiero para imprimir el tablero.
imprimir_tablero(_,[]).
imprimir_tablero(N, [Col|Cols]) :- imprimir_fila(N, Col), nl, imprimir_tablero(N, Cols).
imprimir_fila(0,_) :- !.
imprimir_fila(N, Col_reina) :- imprimir_casillero(Col_reina), N1 is N - 1, Col_reina1 is Col_reina - 1, imprimir_fila(N1, Col_reina1).
imprimir_casillero(1) :- !,print('R').
imprimir_casillero(_) :- print('-').

imprimir_solucion(N) :- solucion(N, T), imprimir_tablero(N, T), nl.
