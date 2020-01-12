require_relative './exception/not_found_exception'

class Ship
  
  TYPES = { 'P'=> 1, 'Q'=> 2 }.freeze

  # @retun [String]
  attr_accessor :type
  
  # @retun [Integer]
  attr_accessor :height

  # @retun [Integer]
  attr_accessor :width

  # @return [Integer]
  attr_accessor :min_width

  # @return [Integer]
  attr_accessor :max_width

  # @return [String]
  attr_accessor :min_height

  # @return [String]
  attr_accessor :max_height


  def create_ship
    raise NotFoundException.new
  end

  def get_strength
    raise NotFoundException.new
  end
end