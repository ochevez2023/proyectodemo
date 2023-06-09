# Autor: David Vargas Ruiz

require_relative 'funciones'

class Ahorcado
  @palabras
  @palabra_secreta
  @ayuda_secreta
  @numero_fallos
  @palabra_mostrar
  
  def inicializar(fichero)
    #leer_diccionario(fichero)
        @palabras = []
    f = File.new(fichero)
    f.each_line do |linea|
      @palabras << linea unless linea.rstrip.rindex('#')==0
    end
  end
  
  def iniciar_nueva_partida
    #elegir_palabra_al_azar
    i = rand(@palabras.length)
    @palabra_secreta, @ayuda_secreta = @palabras[i].split(':')

    #Inicializamos la palabra que se muestra con todo en asteriscos
    @palabra_mostrar = ''
    @palabra_secreta.length.times {@palabra_mostrar << '*'}
    #Esto es un poco raro pero tiene explicación
    @numero_fallos = 0 #inicializar los fallos Fixnum
    completar_palabra_mostrar(' ') #Mostramos los espacios si los hubiera
    @numero_fallos = 0 #Inicializamos a cero los fallos
  end
    
  def completar_palabra_mostrar(letra)
    #print "[DVR] letra elegida=",letra,"[",letra[0],"]\n"
    es_un_fallo=true
    i = 0
    while i < @palabra_secreta.length
      if @palabra_secreta[i] == letra[0]
        @palabra_mostrar[i] = letra[0]
        es_un_fallo=false
        #print "[DVR] Coincidencia en ",i.to_s,"\n"
        #print "[DVR] ",letra[0],@palabra_secreta[i],@palabra_mostrar[i],"\n"
      end
      i=i+1
    end
    if es_un_fallo
      @numero_fallos = @numero_fallos + 1
    end
    return es_un_fallo
  end
     
  def jugar
    presentacion
    iniciar_nueva_partida
    puts "Empezamos una nueva partida..."
    fin=false
    while !fin
       print "\nAdivina lo siguiente: ",@palabra_mostrar,"\n"
       print "Introduce un letra [a-zA-Z]? "
       letra = gets
       letra = letra.chomp!
       completar_palabra_mostrar(letra)
       fin=true
    end
    print "\n\nFin del Juego!\n"
    info
  end

  def presentacion
    mostrar_titulo("Juego del ahorcado")
  end

  def info
    puts "palabra secreta  = " + @palabra_secreta
    puts "palabra mostrar  = " + @palabra_mostrar
    puts "número de fallos = " + @numero_fallos.to_s
    puts "ayuda secreta    = " + @ayuda_secreta
  end  
end
