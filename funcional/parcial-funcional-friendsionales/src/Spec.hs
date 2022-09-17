module Spec where

import Library
import PdePreludat
import Test.Hspec

personaQueCodea = Persona "Juan" 20 100 100 []

personaAFIP = Persona "Ceclilia" 20 90 40 []

otraPersonaAFIP = Persona "Juan" 20 2 250 []

personaEnBici = personaAFIP

personaMusiquera = Persona "Santiago" 50 50 30 []

correrTests :: IO ()
correrTests = hspec $ do
  describe "Tests del punto 3" $ do
    it "Codear un proyecto debe afectar acorde la alegría y ansiedad de una persona" $ do
      (nivelDeAlegria . codearUnProyectoNuevo) personaQueCodea `shouldBe` 210
      (nivelDeAnsiedad . codearUnProyectoNuevo) personaQueCodea `shouldBe` 140
    it "Hacer trámites en AFIP para una persona con poca ansiedad devuelve el minimo de 290 nerviofrinas" $ do
      (nivelDeAnsiedad . hacerTramitesEnAfip 2) personaAFIP `shouldBe` 290
    it "Hacer trámites en AFIP para una persona con ansiedad mayor a 300 devuelve un numero mayor" $ do
      (nivelDeAnsiedad . hacerTramitesEnAfip 2) otraPersonaAFIP `shouldBe` 490
    it "Andar en bici nos da felicidad y reduce el estres" $ do
      (nivelDeAnsiedad . andarEnBici 1) personaEnBici `shouldBe` 0
      (nivelDeAlegria . andarEnBici 1) personaAFIP `shouldBe` 140
    it "Escuchar música resta 10 de ansiedad" $ do
      (nivelDeAnsiedad . escucharMusica) personaMusiquera `shouldBe` 10
