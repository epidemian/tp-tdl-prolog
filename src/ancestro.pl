% Hechos.
padre(urano, cronos).
padre(cronos, hades).
padre(cronos, poseidon).
padre(cronos, zeus).
padre(zeus, apolo).
padre(zeus, artemisa).

% Reglas sencillas.
abuelo(A, B) :- padre(A, X), padre(X, B).
hermano(A, B) :- padre(X, A), padre(X, B), A \== B.

familiar_cercano(A, B) :- padre(A, B).
familiar_cercano(A, B) :- padre(B, A).
familiar_cercano(A, B) :- hermano(A, B).

ancestro(A, B) :- padre(A, B).
ancestro(A, B) :- padre(A, X), ancestro(X, B).
