# Finish the implementation of the Car class so it has the functionality described below

class Car
    attr_accessor :make, :model
    @@all = []
    
    # Currently formatted to take in a hash (see line 43)
    def initialize(make: make_type, model: model_type)
        @make = make
        @model = model
        self.class.all << self 
    end

    def self.all 
        @@all
    end 

    def self.drive
        "VROOOOOOOOOOOOM!"
    end 



end

# volvo_lightning = Car.new("Volvo", "Lightning")
# yugo = Car.new("Zastava", "Yugo")
# lada = Car.new("AvtoVAZ", "Lada")

# volvo_lightning.make
# #=> "Volvo"
# volvo_lightning.model
#=> "Lightning"

Car.drive
# => "VROOOOOOOOOOOOM!"

Car.all
#=> [#<Car:0x00007fae28930f20>, #<Car:0x00007fae28923370>, #<Car:0x00007fae2891ae78>]

# BONUS:

volvo_lightning = Car.new(make: "Volvo", model: "Lightning")

puts volvo_lightning.make
#=> "Volvo"
puts volvo_lightning.model
#=> "Lightning"

# puts Car.drive

# puts Car.all
