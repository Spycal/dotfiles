#!/usr/bin/env ruby

require './battery.rb'

def show_battery_left
  icons = ["", "", "", "", ""].reverse
  bat_cap = Power::Battery.capacity

  if bat_cap > 90 
    return icons.first
  elsif bat_cap > 55
    return icons[1]
  elsif bat_cap > 25
    return icons[2]
  elsif bat_cap > 10
    return icons[3]
  elsif bat_cap > 1
    return icons.last
  end
end

def show_charging_icon
  return "󱐋"
end

while true
  unless Power::Battery.charging?
    puts show_battery_left 
  else
    puts "#{show_charging_icon} #{show_battery_left}"
  end
  sleep 8
end
