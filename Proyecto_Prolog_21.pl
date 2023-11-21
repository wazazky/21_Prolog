jugar(Cartas_jugador, Carta_dealer, Decision) :-
    sumar_cartas(Cartas_jugador, Mano_jugador),
    sumar_cartas([Carta_dealer], Mano_dealer),
    decidir_accion(Mano_jugador, Mano_dealer, Decision).

sumar_cartas(Cartas, Suma) :-
    suma_cartas(Cartas, 0, Suma).

suma_cartas([], Acumulador, Acumulador).
suma_cartas([Carta|Resto], AcumuladorParcial, Suma) :-
    valor_carta(Carta, Valor),
    NuevoAcumulador is AcumuladorParcial + Valor,
    suma_cartas(Resto, NuevoAcumulador, Suma).

calcular_mano_jugador(Cartas_jugador, Mano_jugador) :-
    sumar_cartas(Cartas_jugador, Mano_jugador).

calcular_mano_dealer(Carta_dealer, Mano_dealer) :-
    sumar_cartas([Carta_dealer], Mano_dealer).

decidir_accion(Mano_jugador, Mano_dealer, Decision) :-
    (Mano_jugador < 17 -> Decision = "pedirr";
     Mano_jugador == 17 -> decidir_17(Mano_dealer, Decision);
     Mano_jugador > 17 -> Decision = "Plantarse").

decidir_17(Mano_dealer, Decision) :-
    (Mano_dealer < 7 -> Decision = "Pedir";
     Mano_dealer == 7 -> Decision = "Pasar";
     Mano_dealer > 7 -> Decision = "Plantarse").

valor_carta(numero(N), Valor) :- Valor is N.
valor_carta(figura(_), Valor) :- Valor is 10.
valor_carta(as, Valor) :- Valor is 11.
