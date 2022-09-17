/*

 ██████╗░███████╗██████╗░███████╗██╗░░░░░██████╗░███████╗  ░██████╗░██╗░░░██╗███████╗██╗░░░██╗
 ██╔══██╗██╔════╝██╔══██╗██╔════╝██║░░░░░██╔══██╗██╔════╝  ██╔════╝░██║░░░██║██╔════╝╚██╗░██╔╝
 ██████╔╝█████╗░░██████╦╝█████╗░░██║░░░░░██║░░██║█████╗░░  ██║░░██╗░██║░░░██║█████╗░░░╚████╔╝░
 ██╔══██╗██╔══╝░░██╔══██╗██╔══╝░░██║░░░░░██║░░██║██╔══╝░░  ██║░░╚██╗██║░░░██║██╔══╝░░░░╚██╔╝░░
 ██║░░██║███████╗██████╦╝███████╗███████╗██████╔╝███████╗  ╚██████╔╝╚██████╔╝███████╗░░░██║░░░
 ╚═╝░░╚═╝╚══════╝╚═════╝░╚══════╝╚══════╝╚═════╝░╚══════╝  ░╚═════╝░░╚═════╝░╚══════╝░░░╚═╝░░░

*/

% ----------------------------------------------------------------------------
% PUNTO 1
% ----------------------------------------------------------------------------

persona(bakunin).
persona(ravachol).
persona(rosaDubovsky).
persona(emmaGoldman).
persona(judithButler).
persona(elisaBachofen).
persona(juanSuriano).
persona(sebastienFaure).

trabajo(bakunin, aviacionMilitar).
trabajo(ravachol, inteligenciaMilitar).
trabajo(emmaGoldman, profesoraDeJudo).
trabajo(emmaGoldman, cineasta).
trabajo(judithButler, profesoraDeJudo).
trabajo(judithButler, inteligenciaMilitar).
trabajo(elisaBachofen, ingenieraMecanica).

habilidad(bakunin, conducirAutos).
habilidad(ravachol, tiroAlBlanco).
habilidad(rosaDubovsky, construirPuentes).
habilidad(rosaDubovsky, mirarPepaPig).
habilidad(emmaGoldman, Habilidad) :- habilidad(judithButler, Habilidad).
habilidad(emmaGoldman, Habilidad) :- habilidad(elisaBachofen, Habilidad).
habilidad(judithButler, judo).
habilidad(elisaBachofen, armarBombas).
habilidad(juanSuriano, judo).
habilidad(juanSuriano, armarBombas).
habilidad(juanSuriano, ringRaje).

historialCriminal(bakunin, roboDeAeronaves).
historialCriminal(bakunin, fraude).
historialCriminal(bakunin, tenenciaDeCafeina).
historialCriminal(ravachol, falsificacionDeVacunas).
historialCriminal(ravachol, fraude).
historialCriminal(judithButler, falsificacionDeCheques).
historialCriminal(judithButler, fraude).
historialCriminal(juanSuriano, falsificacionDeDinero).
historialCriminal(juanSuriano, fraude).

:- dynamic gusto/2.
gusto(ravachol,juegosDeAzar).
gusto(ravachol, ajedrez).
gusto(ravachol, tiroAlBlanco).
gusto(rosaDubovsky, construirPuentes).
gusto(rosaDubovsky, mirarPepaPig).
gusto(rosaDubovsky, fisicaCuantica).
gusto(emmaGoldman, Gusto) :- gusto(judithButler, Gusto).
gusto(judithButler, judo).
gusto(judithButler, carrerasDeAutomovilismo).
gusto(elisaBachofen, fuego).
gusto(elisaBachofen, destruccion).
gusto(juanSuriano, judo).
gusto(juanSuriano, armarBombas).
gusto(juanSuriano, ringRaje).

% La verdad que no es necesario pero bueno, la base está.
cuandoSeaGrandeQuiereSer(rosaDubovsky, recolectorDeBasura).
cuandoSeaGrandeQuiereSer(rosaDubovsky, asesinaASueldo).

% ----------------------------------------------------------------------------
% PUNTO 2
% ----------------------------------------------------------------------------

% viveEn - nombre de la casa, nombre del habitante
viveEn(laSeverino, bakunin).
viveEn(laSeverino, elisaBachofen).
viveEn(laSeverino, rosaDubovsky).
viveEn(comisaria48, ravachol).
viveEn(casaDePapel, emmaGoldman).
viveEn(casaDePapel, juanSuriano).
viveEn(casaDePapel, judithButler).

casa(Casa) :- distinct(Casa, viveEn(Casa, _)).
casa(casaDelSolNaciente).

superficieClandestina(laSeverino, cuartoSecreto(4, 8)).
superficieClandestina(casaDePapel, cuartoSecreto(5, 3)).
superficieClandestina(casaDePapel, cuartoSecreto(4, 7)).

superficieClandestina(laSeverino, pasadizo(1)).
superficieClandestina(casaDePapel, pasadizo(2)).

% Modelo los no terminados porque soy piola nomas.
superficieClandestina(laSeverino, tunel(8, terminado)).
superficieClandestina(laSeverino, tunel(5, terminado)).
superficieClandestina(laSeverino, tunel(1, noTerminado)).
superficieClandestina(casaDePapel, tunel(9, terminado)).
superficieClandestina(casaDePapel, tunel(2, terminado)).
superficieClandestina(casaDelSolNaciente, tunel(3, noTerminado)).


% ----------------------------------------------------------------------------
% PUNTO 3
% Lo había hecho de una forma fea, pero después de la última clase cambié todo y quedó bonito
% ----------------------------------------------------------------------------

% Calcular superficie de la casa.
superficieDeCasa(Casa, Total) :-
  casa(Casa),
  aggregate_all(sum(Superficie), obtenenerSuperficie(Casa, Superficie), Total).

obtenenerSuperficie(Casa, Superficie) :-
  superficieClandestina(Casa, Elemento),
  calcularSuperficie(Elemento, Superficie).

% Para los cuartos secretos, que siempre se consideran rectangulares, la superficie cubierta
calcularSuperficie(cuartoSecreto(Alto, Ancho), Superficie) :- Superficie is Alto * Ancho.
% Para los túneles, el doble de su longitud, excepto cuando están en construcción, que no se consideran.
calcularSuperficie(tunel(Longitud, terminado), Superficie) :- Superficie is Longitud * 2.
% Los pasadizos siempre tienen un metro cuadrado de superficie
calcularSuperficie(pasadizo(CantidadDePasadizos), CantidadDePasadizos).

% Una casa tienen potencial rebelde si vive un disidente y su superficie es mayor a 50m cuadrados
casaConPotencialRebelde(Casa) :-
  casa(Casa),
  superficieDeCasa(Casa, SuperficieCasa),
  SuperficieCasa > 50,
  viveAlgunDisidente(Casa).

viveAlgunDisidente(Casa) :- 
  viveEn(Casa, Persona),
  disidente(Persona).


% ----------------------------------------------------------------------------
% PUNTO 4
% ----------------------------------------------------------------------------

% Detectar si en una vivienda no vive nadie.
casaVacia(Casa) :- 
  casa(Casa),
  not(viveEn(Casa, _)).

% Detectar si en una vivienda todos los que viven tienen al menos un gusto en común.
% Acepta casas con una sola persona porque el antecedente del forall es falso (nadie más vive en esa casa).
casaConUnGustoComun(Casa) :-
  viveEn(Casa, Persona),
  gusto(Persona, Gusto),
  forall(viveEn(Casa, OtraPersona), gusto(OtraPersona, Gusto)).
  % not((viveEn(Casa, OtraPersona), not(gusto(OtraPersona, Gusto)))).

% ----------------------------------------------------------------------------
% PUNTO 5
% ----------------------------------------------------------------------------

% Es disidente si tiene alguna habilidad considerada terrorista
disidente(Persona) :- habilidad(Persona, Habilidad), habilidadTerrorista(Habilidad).
% Es disidente si no tiene gustos
disidente(Persona) :- noTieneGustos(Persona).
% Es disidente si le gusta en lo que es bueno
disidente(Persona) :- leGustaLoQueEsBueno(Persona).
% Es disidente si tiene algun registro criminal
disidente(Persona) :- tieneRegistrosCriminales(Persona).
% Es disidente si vive con alguien con al menos un registro criminal
disidente(Persona) :- viveConAlguienConRegistroCriminal(Persona).

habilidadTerrorista(tiroAlBlanco).
habilidadTerrorista(armarBombas).
habilidadTerrorista(mirarPepaPig).

noTieneGustos(Persona) :- 
  persona(Persona),
  not(gusto(Persona, _)).

leGustaLoQueEsBueno(Persona) :- 
  persona(Persona),
  forall(habilidad(Persona, Habilidad), gusto(Persona, Habilidad)).  

viveConAlguienConRegistroCriminal(Persona) :-
  viveCon(Persona, OtraPersona),
  tieneRegistrosCriminales(OtraPersona).

cantidadRegistrosCriminales(Persona, Total) :- 
  persona(Persona),
  findall(Persona, historialCriminal(Persona, _), Lista), length(Lista, Total).

% Acá tiene sentido esto porque necesito saber si es más que uno. Aunque todos los que tienen registros tienen más de 1.
tieneRegistrosCriminales(Persona) :- cantidadRegistrosCriminales(Persona, Total), Total > 1.

viveCon(Persona, OtraPersona) :- 
  persona(Persona),
  viveEn(Casa, Persona),
  viveEn(Casa, OtraPersona),
  Persona \= OtraPersona.

% ----------------------------------------------------------------------------
% PUNTO 6
% El acoplamiento que tengo es con obtenerSuperficie, que invoca a los predicados calcularSuperficie.
% Para que tenga en cuenta los bunkers, con crear el predicado que acepte bunkers, no tengo que cambiar nada más.
% Igual si no era por la clase del 17/8, era todo una mescolanza que me quería ir del planeta.
% ----------------------------------------------------------------------------

% Implementar casaDePatricia con un pasadizo y un bunker de 10 de superficie con 2 metros de perímetro
:- discontiguous superficieClandestina/2.
superficieClandestina(casaDePatricia, pasadizo(1)).
superficieClandestina(casaDePatricia, bunker(10, 2)).

% Meter a Sebastian ahi. Como calculo las casas en base a viveEn/2, si no hay nadie no afecta en nada al otro tests.
:- discontiguous viveEn/2.
viveEn(casaDePatricia, sebastienFaure).

:- discontiguous calcularSuperficie/2.
calcularSuperficie(bunker(SuperficieBunker, Perimetro), Superficie) :- Superficie is SuperficieBunker + Perimetro.

% ----------------------------------------------------------------------------
% PUNTO 7
%
% En base a esto puedo decir que si es apto batallon entonces es disidente?
% disidente(Persona) :- esAptoBatallon(Persona). Me ahorra una linea... meh.
% ----------------------------------------------------------------------------

esAptoBatallon(Persona) :- tieneRegistrosCriminales(Persona).
esAptoBatallon(Persona) :- viveConAlguienConRegistroCriminal(Persona).

batallon(Batallon, TotalHabilidades) :-
  findall(Persona, esAptoBatallon(Persona), Personas),
  armarBatallon(Personas, Batallon, TotalHabilidades),
  TotalHabilidades > 3.

% Caso base de recursividad
armarBatallon([], [], TotalHabilidades) :- TotalHabilidades is 0.

% Caso recursivo 
armarBatallon([Persona|Personas], [Persona|Batallon], TotalHabilidades) :- 
  aggregate_all(count, gusto(Persona, _), CantidadHabilidadesIndividual),
  armarBatallon(Personas, Batallon, CantidadHabilidadesResto),
  TotalHabilidades is CantidadHabilidadesIndividual + CantidadHabilidadesResto.

% Caso recursivo para explosion combinatoria
armarBatallon([_|Personas], Batallon, CantidadHabilidadesResto) :-
  armarBatallon(Personas, Batallon, CantidadHabilidadesResto).