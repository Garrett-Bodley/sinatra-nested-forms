
class Pirate

  attr_accessor :name, :height, :weight
  @@all = []

  def initialize (args)
    @name = args[:name]
    @height = args[:height]
    @weight = args[:weight]
    @@all << self
  end

  def self.all
    @@all
  end

end
