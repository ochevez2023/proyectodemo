#!/usr/bin/env ruby

require_relative "lib-04-parafun"

obiwan = Character.new( name: 'Obiwan', type: 'jedi')
maul = Character.new(name: 'Maul', type: 'sith')

obiwan.show_my_type_and_name
maul.show_name_and_type
