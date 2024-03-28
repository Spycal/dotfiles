#!/usr/bin/ruby env

target_file = "test.txt"
File.open target_file do |file|
  $each_line = file.readlines # each_lines => Array
end

desk_hex = $each_line.last.split.last # Non constant hex
desk_val = desk_hex.chars.last.to_i
real_desk_val = desk_val - 3

puts real_desk_val

def focused_desktop 

end
