
room :main, do
  puts "Estás en una habitación a oscuras."
  puts "Ves una puerta sucia al fondo."
  puts "A tus pies hay un objeto que parece una linterna."
  puts ""
  puts "(p) Salir poe la puerta"
  puts "(c) Coger la linterna"

  actions = ['p', 'c']
  election = ""
  while not actions.contains? election do
    print "¿Qué eliges? "
    election = gets.chomp
  end

  return :puerta if 'p'
  return :linterna
end
