#!/usr/bin/env ruby

class MyIterator
  def initialize(times)
    @times = times
  end

  def each
    i = 0
    while(i<@times)
      print "[#{i}] Executing block => "
      yield
      i += 1
    end
  end
end

puts "SCRIPTNAME : #{$0}"
i = MyIterator.new(3)
i.each { puts "I love Ruby!"  }
