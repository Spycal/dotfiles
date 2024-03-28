#!/usr/bin/env ruby

require './battery.rb'

while true;
  puts Power::Battery.capacity.to_s + "%" # => e.g 85%
  sleep 8
end
