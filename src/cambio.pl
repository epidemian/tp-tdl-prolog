
pertenece(X,[X|_]).
pertenece(X,[_|R]) :- pertenece(X,R).

stock(X) :- pertenece(X,[0,1,2,3,4,5,6,7,8,9,10]).
billetes(X) :- pertenece(X,[2,5,10,20,50,100]).

cambio(Billete,Peso,Cincuenta,Veinticinco,Diez,Cinco) :-
	stock(Peso),
	stock(Cincuenta),
	stock(Veinticinco),
	stock(Diez),
	stock(Cinco),
	billetes(Billete),
	100*Billete =:= 100*Peso + 50*Cincuenta + 25*Veinticinco + 10*Diez + 5*Cinco.

	
