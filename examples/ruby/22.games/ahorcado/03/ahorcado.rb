#!/usr/bin/env ruby
#
#Fichero     : ahorcado.rb
#Fecha       : 20070404
#Autor       : David Vargas Ruiz
#Descripción : Juego del ahorcado
#
#Versión 1
#Tenemos un diccionario y leemos todo su contenido y lo cargamos en un array.
#A continuación elegimos uno al azar.
#Version 2
#Creamos variables globales, constantes y métodos/funciones
#Versión 3
#Descomposición en varios ficheros.

require 'ahorcado/version.03/funciones'
#
#Variables globales
#
VERSION_JUEGO="3"
FILE_DICCIONARIO="ahorcado/diccionario.txt"
palabras=[]

#
#Ejecución del programa
#
mostrar_titulo("Juego del ahorcado Versión "<<VERSION_JUEGO,40,"=")
palabras = leer_diccionario(FILE_DICCIONARIO)
palabra_secreta,ayuda_secreta = elegir_palabra_al_azar(palabras)


puts palabra_secreta
puts ayuda_secreta

