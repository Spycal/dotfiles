#!/usr/bin/env ruby

module Power
  class Battery
    BAT_DIR = "/sys/class/power_supply"

    def self.capacity
      bat0 = File.read("#{BAT_DIR}/BAT0/capacity").to_i
      bat1 = File.read("#{BAT_DIR}/BAT1/capacity").to_i
      return (bat0 + bat1) / 2 # combine 2 bat 
    end
   
    def self.charging?
      bat0 = File.read("#{BAT_DIR}/BAT0/status").delete("\n")
      bat1 = File.read("#{BAT_DIR}/BAT1/status").delete("\n")
      
      if bat1 == "Charging" || bat0 == "Charging"
        return true
      end

      return false
    end
  end
end


