module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end
class Vehicle
  @@count = 0
  attr_accessor :color
  attr_reader :year, :model
  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model@player_1
    @current_speed = 0
    @@count+=1
    end
  def current_speed
    puts "Current speed: #{@current_speed}"
  end
  def spray_paint(color)
    @color = color
  end
  def self.number_of_vehicle
    puts "Current number of vehicle: #{@@count}"
  end
  def self.fuel_consumption(gal, mil)
      puts "#{mil/gal} miles per gal for mil"
  end
  def to_s
    "Year: #{self.year}, Color: #{self.color}, Model: #{@model}, Age: #{age}"
  end
  protected
  def age
    time = Time.now.year
    time - @year
  end
end

class MyCar < Vehicle
  TERRESTIAL = "Car"
  def grow_speed(speed)
    @current_speed+=speed
    puts "sped of your #{@model} is grow on #{speed}"
  end
  def break_speed(speed)
    @current_speed-=speed
    puts "sped of your #{@model} is break on #{speed}"
  end
  def turn_off
    @current_speed = 0
    puts "sped of your #{@model} is turn off "
  end
end
class MyTrack < Vehicle
  TRUCK = "Big car"
  include Towable
end
lumina = MyCar.new(2000, "white", "toyota")
lumina.spray_paint("black")
puts lumina
Vehicle.number_of_vehicle
MyCar.fuel_consumption(13,23)
puts MyCar.ancestors
