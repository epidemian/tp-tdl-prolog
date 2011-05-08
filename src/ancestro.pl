% Hechos.
padre(urano, cronos).
padre(cronos, hades).
padre(cronos, poseidon).
padre(cronos, zeus).
padre(zeus, apolo).
padre(zeus, artemisa).

% Reglas sencillas.
abuelo(A, B) :- padre(A, X), padre(X, B).
hermanos(A, B) :- padre(X, A), padre(X, B), A \= B.

% El OR no es necesario.
ancestro(A, B) :- padre(A, B).
ancestro(A, B) :- padre(A, X), ancestro(X, B).
