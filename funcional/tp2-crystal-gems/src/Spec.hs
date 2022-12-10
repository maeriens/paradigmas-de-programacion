module Spec where

import Library
import PdePreludat
import Test.Hspec

aspectoPrueba = UnAspecto "Peligro" 2

gemaVidente = Gema {nombreGema = "Gema Vidente", fuerza = 35, personalidad = vidente}

gemaRelajadaEn15 = Gema {nombreGema = "Gema Relajada 15", fuerza = 70, personalidad = relajada 15}

gemaRelajadaEn20 = Gema {nombreGema = "Gema Relajada 20", fuerza = 20, personalidad = relajada 20}

otraGemaVidente = Gema {nombreGema = "Otra Gema Vidente", fuerza = 100, personalidad = vidente}

muchasGemas = [gemaVidente, gemaRelajadaEn15, gemaRelajadaEn20, otraGemaVidente]

aspectoAlto = aspectoPrueba {grado = 100}

aspectoBajo = aspectoPrueba

otroPeligro = UnAspecto "peligro" 10

correrTests :: IO ()
correrTests = hspec $ do
  describe "Aspectos" $ do
    it "Un aspecto es mejor que otro si su grado es menor" $ do
      mejorAspecto aspectoAlto aspectoBajo `shouldBe` False
    it "Dos aspectos con el mismo nombre se consideran iguales" $ do
      mismoAspecto peligro otroPeligro `shouldBe` True
  describe "Situaciones" $ do
    it "El grado de un aspecto debe ser modificado correctamente  cuando se le pasa una función modificadora" $ do
      grado (modificarAspecto (* 2) aspectoPrueba) `shouldBe` grado aspectoPrueba * 2
    it "Una situación cuyos grados son menores a los de otra situación es mejor" $ do
      esMejorSituacion situacionMuyBuena situacionMala `shouldBe` True
    it "Un aspecto particular de una situación puede ser modificado correctamente" $ do
      (grado . buscarAspecto peligro . modificarSituacion "peligro" (* 2)) situacionMala `shouldBe` 100
  describe "Personalidades" $ do
    it "La personalidad vidente debe reducir todos los valores de una situación a la mitad" $ do
      (map grado . vidente) situacionMala `shouldBe` [25, 25, 25]
    it "La personalidad relajada reduce la tensión de una situación" $ do
      (grado . buscarAspecto tension) situacionMala > (grado . buscarAspecto tension . relajada 10) situacionMala `shouldBe` True
    it "La personalidad relajada aumenta el peligro de una situación en el número indicado" $ do
      (grado . buscarAspecto peligro . relajada 15) situacionMala `shouldBe` (grado . buscarAspecto peligro) situacionMala + 15
    it "Una situación cuyos grados son menores a los de otra situación es mejor" $ do
      esMejorSituacion situacionMuyBuena situacionMala `shouldBe` True
  describe "Comparación de gemas" $ do
    it "No hay gema ganadora entre dos gemas videntes, independientemente de la situación" $ do
      esMejorGema gemaVidente otraGemaVidente situacionMuyBuena `shouldBe` False
    it "No hay gema ganadora entre dos gemas con personalidad relajar, independientemente de la situación" $ do
      esMejorGema gemaRelajadaEn15 gemaRelajadaEn20 situacionMuyBuena `shouldBe` False
  describe "Pruebas de fusión de gemas" $ do
    it "El nombre de una gema fusionada tiene que ser la concatenación de sus nombres " $ do
      nombreGema (fusion situacionMala gemaVidente otraGemaVidente) `shouldBe` nombreGema gemaVidente ++ nombreGema otraGemaVidente
    it "La personalidad final de una fusion de gemas relajadas sólo reduce la incertidumbre en 10" $ do
      (grado . buscarAspecto incertidumbre) (personalidad (fusion situacionMala gemaRelajadaEn20 gemaRelajadaEn15) situacionMala) `shouldBe` 40
    it "La personalidad final de una fusion de gemas videntes reduce todo a menos de 1/4 del valor original" $ do
      map grado (personalidad (fusion situacionMala gemaVidente otraGemaVidente) situacionMala) `shouldBe` [10, 10, 10]
    it "La fuerza de la fusión de dos gemas compatibles es correcta" $ do
      fuerza (fusion situacionHorrible gemaVidente gemaVidente) `shouldBe` 10 * fuerza gemaVidente * fuerza gemaVidente
    it "La fuerza de la fusión de dos gemas no compatibles donde la gema 1 es mejor es correcta" $ do
      fuerza (fusion situacionHorrible otraGemaVidente gemaRelajadaEn15) `shouldBe` 7 * fuerza otraGemaVidente
    it "La fuerza de la fusión de dos gemas no compatibles donde la gema 2 es mejor es correcta" $ do
      fuerza (fusion situacionHorrible gemaVidente gemaRelajadaEn15) `shouldBe` 7 * fuerza gemaRelajadaEn15
  describe "Pruebas de fusión de gemas" $ do
    it "La multiple fusion de una sola gema es la misma gema" $ do
      (nombreGema . fusionGrupal [gemaVidente]) situacionHorrible `shouldBe` nombreGema gemaVidente
    it "El nombre de la fusión de multiples gemas debe ser correcto" $ do
      (nombreGema . fusionGrupal muchasGemas) situacionHorrible `shouldBe` concatMap nombreGema muchasGemas
    it "La fuerza de la fusión de multiples gemas debe ser correcta" $ do
      (fuerza . fusionGrupal (replicate 3 gemaVidente)) situacionHorrible `shouldBe` (10 * fuerza gemaVidente * fuerza gemaVidente) * 10 * fuerza gemaVidente