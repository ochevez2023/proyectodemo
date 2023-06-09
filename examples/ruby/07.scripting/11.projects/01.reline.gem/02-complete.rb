#!/usr/bin/env ruby

require 'reline'

begin
  stty_save = `stty -g`.chomp
rescue
end

begin
  puts 'This is echo program by Reline.'
  Reline.completion_proc = proc { |word|
    %w{
      foo_foo
      foo_bar
      foo_baz
      qux
    }
  }
  while line = Reline.readline("echo> ", true)
    case line.chomp
    when 'exit', 'quit', 'q'
      exit 0
    when ''
      # NOOP
    else
      puts line
    end
  end
rescue Interrupt
  puts '^C'
  `stty #{stty_save}` if stty_save
  exit 0
end
puts
Footer

