module Library where

import PdePreludat

-- Punto 1

type Yulius = Number

type Alegronios = Number

type Nerviofrinas = Number

type Tarea = Persona -> Persona

data Persona = Persona
  { nombre :: String,
    edad :: Number,
    nivelDeAlegria :: Alegronios,
    nivelDeAnsiedad :: Nerviofrinas,
    tareasPersona :: [Tarea]
  }
  deriving (Show)

calcularEstres :: Persona -> Nerviofrinas
calcularEstres persona
  --Esta funcion podia retornar el factor de multiplicacion de ansiedad ya que siempre lo multiplicas por la ansiedad en ambos casos
  --ya que lo único que cambia es en cuanto le multiplicas el nivel de ansiedad.
  -- > Pero creo que queda medio feo porque en obtenerEnergia pasa a ser (calcularEstres persona * nivelDeAnsiedad persona) y ni ganasd e repetir
  | length (tareasPersona persona) > 5 = nivelDeAnsiedad persona * 1.5
  | otherwise = nivelDeAnsiedad persona

obtenerEnergia :: Persona -> Yulius
obtenerEnergia persona
  | nivelDeAlegria persona > nivelDeAnsiedad persona = (min 340 . (* 2) . nivelDeAlegria) persona
  | edad persona < 40 = 300 - calcularEstres persona
  | otherwise = 10 + nivelDeAlegria persona

yoJoven = Persona "mariano" 28 0 2 []

yoViejo = Persona "mariano2" 100 0 2 []

yoAnsioso = Persona "mariano3" 55 100 100 []

yoMuyAnsioso = Persona "mariano4" 55 100 10000 []

-- Punto 2
--
type Amigos = [Persona]

multiversoDeYo = [yoJoven, yoAnsioso, yoViejo, yoMuyAnsioso]

esJovato :: Persona -> Bool
esJovato = (>= 40) . edad

obtenerJovatos :: Amigos -> Amigos
obtenerJovatos grupoDeAmigos = filter esJovato grupoDeAmigos

-- En el punto 5 se pide lo mismo de calcular la energía > 100 así que repito la función
viejosSonLosTrapos :: Amigos -> Bool
viejosSonLosTrapos grupoDeAmigos = (all tieneMasDe100Energia . obtenerJovatos) grupoDeAmigos

nivelTotalDeAmsiedad :: Amigos -> Number
nivelTotalDeAmsiedad grupoDeAmigos = (sumOf nivelDeAnsiedad . obtenerJovatos) grupoDeAmigos

type Criterio = Persona -> Bool

nombreDelosMasCriticados :: Criterio -> Amigos -> [String]
nombreDelosMasCriticados criterio amigos = (take 2 . map nombre . filter criterio) amigos

nombreDeLosAnsiosos = nombreDelosMasCriticados ((> 50) . nivelDeAnsiedad) multiversoDeYo

nombreDeLosEnergicosPares = nombreDelosMasCriticados (even . obtenerEnergia) multiversoDeYo

-- Punto 3

descomprimir :: Tarea
descomprimir persona = persona {nivelDeAnsiedad = (max 0 . subtract 10 . nivelDeAnsiedad) persona}

codearUnProyectoNuevo :: Tarea
codearUnProyectoNuevo persona =
  descomprimir persona {nivelDeAlegria = nivelDeAlegria persona + 110, nivelDeAnsiedad = nivelDeAnsiedad persona + 50}

hacerTramitesEnAfip :: Number -> Tarea
hacerTramitesEnAfip cantidadDeTramites persona =
  descomprimir persona {nivelDeAnsiedad = (max 300 . ((* cantidadDeTramites) . nivelDeAnsiedad)) persona}

andarEnBici :: Number -> Tarea
andarEnBici kmsRecorridos persona =
  descomprimir persona {nivelDeAnsiedad = 0, nivelDeAlegria = nivelDeAlegria persona + (50 * kmsRecorridos)}

escucharMusica :: Tarea
escucharMusica persona = (descomprimir . descomprimir) persona

-- Punto 4

type Tareas = [Tarea]

tareas = [escucharMusica, escucharMusica, andarEnBici 1]

energiaResultante :: Persona -> Tareas -> Yulius
energiaResultante persona tareas = (obtenerEnergia . foldr ($) persona) tareas

-- Punto 5

tieneMasDe100Energia :: Persona -> Bool
tieneMasDe100Energia persona = ((> 100) . obtenerEnergia) persona

hiceLoQuePude :: Tareas -> Persona -> Persona
hiceLoQuePude [] persona = persona
hiceLoQuePude (tarea : tareas) persona
  | (tieneMasDe100Energia . tarea) persona = (tarea . hiceLoQuePude tareas) persona
  | otherwise = persona

-- Punto 6

{-
 Dada una lista infinita, puedo determinar nivelTotalDeAmsiedad o si viejosSonLosTrapos?

 No puedo determinar nivelTotalDeAmsiedad porque al ser una sumatoria, va a seguir sumando infinitamente los niveles de ansiedad de
 cada uno de los integrantes del grupo, y al ser infinito esto nunca corta.

 Para viejosSonLosTrapos es posible obtener un resultado sólo si es que hay alguna persona jovata no tiene mas de 100 de energia,
 esto es posible ya que haskell va evaluando de acuerdo a lo que necesita, no evalua todos los jovatos primero sino que va evaluando de acuerdo
 a lo que necesita, y como la funcion de orden superior utilizada es un "all" alcanza con que UN caso no cumpla para realizar el corte
-}
