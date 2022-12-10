module Library where

import PdePreludat

-- Funciones predefinidas
data Aspecto = UnAspecto
  { tipoDeAspecto :: String,
    grado :: Number
  }
  deriving (Show, Eq)

type Situacion = [Aspecto]

mejorAspecto :: Aspecto -> Aspecto -> Bool
mejorAspecto mejor peor = grado mejor < grado peor

mismoAspecto :: Aspecto -> Aspecto -> Bool
mismoAspecto aspecto1 aspecto2 = tipoDeAspecto aspecto1 == tipoDeAspecto aspecto2

buscarAspecto :: Aspecto -> Situacion -> Aspecto
buscarAspecto aspectoBuscado = head . filter (mismoAspecto aspectoBuscado)

buscarAspectoDeTipo :: String -> [Aspecto] -> Aspecto
buscarAspectoDeTipo tipo = buscarAspecto (UnAspecto tipo 0)

reemplazarAspecto :: Aspecto -> Situacion -> Situacion
reemplazarAspecto aspectoBuscado situacion = aspectoBuscado : filter (not . mismoAspecto aspectoBuscado) situacion

--

type Modificador = (Number -> Number)

gradoValido :: Number -> Number
gradoValido = max 0

modificarAspecto :: Modificador -> Aspecto -> Aspecto
modificarAspecto modificador aspecto = aspecto {grado = (gradoValido . (modificador . grado)) aspecto}

esMejorSituacion :: Situacion -> Situacion -> Bool
esMejorSituacion situacion1 situacion2 = all (\aspecto -> mejorAspecto aspecto (buscarAspecto aspecto situacion2)) situacion1

modificarSituacion :: String -> Modificador -> Situacion -> Situacion
modificarSituacion tipo modificador situacion = reemplazarAspecto ((modificarAspecto modificador . buscarAspectoDeTipo tipo) situacion) situacion

type Personalidad = Situacion -> Situacion

data Gema = Gema {nombreGema :: String, fuerza :: Number, personalidad :: Personalidad} deriving (Show)

tension :: Aspecto
tension = UnAspecto {tipoDeAspecto = "tensión", grado = 0}

incertidumbre :: Aspecto
incertidumbre = UnAspecto {tipoDeAspecto = "incertidumbre", grado = 0}

peligro :: Aspecto
peligro = UnAspecto {tipoDeAspecto = "peligro", grado = 0}

--  Personalidades de Gema
modificarTodosLosAspectos :: (Number -> Number) -> Personalidad
modificarTodosLosAspectos modificador situacion = map (modificarAspecto modificador) situacion

vidente :: Personalidad
vidente = modificarTodosLosAspectos (/ 2)

relajada :: Number -> Personalidad
relajada nivelDeRelajamiento = modificarSituacion "peligro" (+ nivelDeRelajamiento) . modificarSituacion "tensión" (subtract 30)

esMejorGema :: Gema -> Gema -> Situacion -> Bool
esMejorGema gema1 gema2 situacion = fuerza gema1 > fuerza gema2 && esMejorSituacion (personalidad gema1 situacion) (personalidad gema2 situacion)

---
situacionMuyBuena = [tension, incertidumbre, peligro]

situacionMala = [incertidumbre {grado = 50}, tension {grado = 50}, peligro {grado = 50}]

situacionHorrible = [incertidumbre {grado = 500}, tension {grado = 500}, peligro {grado = 500}]

---

fusion :: Situacion -> Gema -> Gema -> Gema
fusion situacion gema1 gema2 =
  Gema
    { nombreGema = nombreGema gema1 ++ nombreGema gema2,
      personalidad = personalidadFusionada gema1 gema2,
      fuerza = calcularFuerza gema1 gema2 situacion
    }

calcularFuerza :: Gema -> Gema -> Situacion -> Number
calcularFuerza gema1 gema2 situacion
  | sonCompatibles gema1 gema2 situacion = 10 * fuerza gema1 * fuerza gema2
  | esMejorGema gema1 gema2 situacion = 7 * fuerza gema1
  | otherwise = 7 * fuerza gema2

personalidadFusionada :: Gema -> Gema -> Personalidad
personalidadFusionada gema1 gema2 = personalidad gema1 . personalidad gema2 . modificarTodosLosAspectos (subtract 10)

sonCompatibles :: Gema -> Gema -> Situacion -> Bool
sonCompatibles gema1 gema2 situacion =
  esMejorSituacion (personalidadFusionada gema1 gema2 situacion) (personalidad gema1 situacion)
    && esMejorSituacion (personalidadFusionada gema1 gema2 situacion) (personalidad gema2 situacion)

fusionGrupal :: [Gema] -> Situacion -> Gema
fusionGrupal gemas situacion = foldl1 (fusion situacion) gemas