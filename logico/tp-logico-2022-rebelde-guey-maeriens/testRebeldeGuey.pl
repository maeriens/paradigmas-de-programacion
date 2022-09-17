/*

████████╗███████╗░██████╗████████╗░██████╗
╚══██╔══╝██╔════╝██╔════╝╚══██╔══╝██╔════╝
░░░██║░░░█████╗░░╚█████╗░░░░██║░░░╚█████╗░
░░░██║░░░██╔══╝░░░╚═══██╗░░░██║░░░░╚═══██╗
░░░██║░░░███████╗██████╔╝░░░██║░░░██████╔╝
░░░╚═╝░░░╚══════╝╚═════╝░░░░╚═╝░░░╚═════╝░

*/

:- include(rebeldeGuey).

:- begin_tests(personas).

  test("Habilidadesde Emma Goldman", set(Habilidad == [armarBombas, judo])):-
    habilidad(emmaGoldman, Habilidad).

  test("Gustos Emma Goldman", set(Gusto == [carrerasDeAutomovilismo, judo])):-
    gusto(emmaGoldman, Gusto).

:- end_tests(personas).

:- begin_tests(guaridasRebeldes).

  test("Superficie de actividades clandestinasde La Severino", nondet) :-
    superficieDeCasa(laSeverino, 59).

  test("Superficie de actividades clandestinasde Comisaria 48", nondet) :-
    superficieDeCasa(comisaria48, 0).

  test("Casa con potencial rebelde", set(Casa=[casaDePapel, laSeverino])) :-
    casaConPotencialRebelde(Casa).

:- end_tests(guaridasRebeldes).

sacarleGustoAJuanSuriano :-
  retract(gusto(juanSuriano, judo)).

devolverleGustoAJuanSuriano :- 
  assert(gusto(juanSuriano, judo)).

:- begin_tests(aquiNoHayQuienViva).

  test("Casas vacias", set(Casa=[casaDelSolNaciente])) :- casaVacia(Casa).

  test("Casas con un gusto común", set(Casa=[casaDePapel, comisaria48])) :- casaConUnGustoComun(Casa).

  test("BONUS: A Juan Suriano no le gusta más el Judo, entonces en Casa de Papel no todos tienen un gusto comun",
     [fail, setup(sacarleGustoAJuanSuriano), cleanup(devolverleGustoAJuanSuriano)]) :-
    casaConUnGustoComun(casaDePapel).

:- end_tests(aquiNoHayQuienViva).

:- begin_tests(rebeldeTalVez).

  test("Tienen habilidad terrorista", set(Terroristas=[elisaBachofen, emmaGoldman, juanSuriano, ravachol, rosaDubovsky])) :-
    habilidad(Terroristas, Habilidad), habilidadTerrorista(Habilidad).
  
  test("Gente sin gustos", set(Sosos=[bakunin, sebastienFaure])) :-
    noTieneGustos(Sosos).

  test("Les gusta lo que son buenos haciendo", set(Gustosos=[ravachol, rosaDubovsky, judithButler, juanSuriano, sebastienFaure])) :-
    leGustaLoQueEsBueno(Gustosos).

  test("Tienen algun registro criminal", set(Malosos=[bakunin, juanSuriano, judithButler, ravachol])) :- 
    historialCriminal(Malosos, _).

  test("Viven con alguien con registros criminales", set(MalaJunta=[rosaDubovsky, emmaGoldman, judithButler, elisaBachofen, juanSuriano])) :-
    viveConAlguienConRegistroCriminal(MalaJunta).

  test("Rosa Dubovsky es posible disidente", nondet) :- disidente(rosaDubovsky).
  test("Juan Suriano es posible disidente", nondet) :- disidente(juanSuriano).
  test("Ravachol es posible disidente", nondet) :- disidente(ravachol).
   
:- end_tests(rebeldeTalVez).

:- begin_tests(bunkers).

  test("La Superficie Rebelde de la Casa de Patricia debería ser de 13") :- superficieDeCasa(casaDePatricia, 13).

:- end_tests(bunkers).

:- begin_tests(batallones).

  test("Todos los batallones deben tener al menos una persona y mas de 3 habilidades en total"):-
    forall(batallon(Batallon, TotalHabilidades), (
      length(Batallon, CantidadDeGente),
      CantidadDeGente > 1,
      TotalHabilidades > 3
    )).

:- end_tests(batallones).