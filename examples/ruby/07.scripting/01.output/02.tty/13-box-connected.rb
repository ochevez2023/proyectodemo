#!/usr/bin/env ruby
# frozen_string_literal: true

require 'tty-box'

print TTY::Cursor.clear_screen

box1 = TTY::Box.frame(
  top: 3,
  left: 10,
  width: 15,
  height: 5,
  border: {
    type: :thick,
    right: false
  },
  align: :center,
  padding: [1, 2],
  style: {
    bg: :red,
    border: {
      bg: :red
    }
  }
) { "Space" }

box2 = TTY::Box.frame(
  top: 3,
  left: 25,
  width: 15,
  height: 5,
  border: {
    type: :thick,
    top_left: :divider_down,
    bottom_left: :divider_up
  },
  align: :center,
  padding: [1, 2],
  style: {
    bg: :red,
    border: {
      bg: :red
    }
  }
) { "Invaders!" }

puts box1 + box2
print "\n" * 5

