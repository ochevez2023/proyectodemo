require $DIR_PROGRAMA + '/funciones'

class Ahorcado
  @palabras
  @palabra_secreta
  @ayuda_secreta
  @numero_de_fallos
  @palabra_mostrar
  
  def inicializar(fichero)
    leer_diccionario(fichero)
    iniciar_nueva_partida
  end
  
  def iniciar_nueva_partida
    @palabra_secreta, @ayuda_secreta = elegir_palabra_al_azar

    #Inicializamos la palabra que se muestra con todo en asteriscos
    @palabra_mostrar = ''
    @palabra_secreta.length.times {@palabra_mostrar << '*'}
    completar_palabra_mostrar(' ')
    
    @numero_de_fallos = 0
  end
  
  def completar_palabra_mostrar(letra)
    puts "letra=",letra
    es_un_fallo=true
    i = 0
    while i < @palabra_secreta.length
      puts @palabra_secreta[i].to_str
      if @palabra_secreta[i] == letra
        @palabra_mostrar[i] == letra
        es_un_fallo=false
      end
      i=i+1
    end
    @numero_fallos +=1 unless es_un_fallo
    return es_un_fallo
  end
  
  def presentacion
    mostrar_titulo("Juego del ahorcado")
  end
  
  def leer_diccionario(fichero)
    @palabras = []
    f = File.new(fichero)
    f.each_line do |linea|
      @palabras << linea unless linea.rstrip.rindex('#')==0
    end
    return @palabras
  end

  def elegir_palabra_al_azar
    i = rand(@palabras.length)
    @palabras[i].split(':')
  end
  
  def jugar
    iniciar_nueva_partida
    puts "Empezamos una nueva partida..."
    fin=false
    while !fin
       puts @palabra_mostrar
       print "Letra?"
       letra = gets
       letra = letra[0] 
       fin=true
    end
    puts "\nFin del Juego!"
    info
  end
  
  def info
    puts "palabra secreta = " + @palabra_secreta
    puts "palabra mostrar = " + @palabra_mostrar
    puts "ayuda secreta   = " + @ayuda_secreta
  end
end
