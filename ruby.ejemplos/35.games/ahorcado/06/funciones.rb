#
#Definiciones de funciones
#

  def mostrar_titulo(titulo,ancho=40,letra="*")
    ancho.times do print letra end
    puts
    puts titulo.center(ancho)
    ancho.times do print letra end
    puts
  end


