

# SubClass BattleShip is created from the base class Ship,
# thinking about the point in mind that there could be other types of ships
# whose width and height could differ and they generate different power, 
# may be based on their size.
# Hence we will always override the 2 methods

# @author Rishi Rawat

require_relative './exception/invalid_ship_dimensions_exception'
require_relative './exception/invalid_ship_type_exception'
require_relative './ship'

class BattleShip < Ship
  # @param [Integer] min_width
  # @param [Integer] max_width
  # @param [Integer] min_height
  # @param [Integer] max_height
  def initialize(min_width, max_width, min_height, max_height)
    self.min_width  = min_width
    self.max_width  = max_width
    self.min_height = min_height
    self.max_height = max_height
  end

  # @return [String]
  attr_accessor :type

  # @return [Integer]
  attr_accessor :width

  # @return [Integer]
  attr_accessor :height

  # @return [Integer]
  attr_accessor :min_width

  # @return [Integer]
  attr_accessor :max_width

  # @return [Integer]
  attr_accessor :min_height

  # @return [Integer]
  attr_accessor :max_height

  # @param [symbol]  type
  # @param [Integer] width
  # @param [Integer] height
  # @retun [Ship]    object
  # @raise [InvalidShipDimensionsException] if invalid dimension
  # @raise [InvalidShipTypeException] if invalid type
  def create_ship(type, width, height)
    self.width  = width
    self.height = height
    self.type   = type

    raise InvalidShipDimensionsException.new('Invalid Battle Ship Size') unless valid_dimensions?
    raise InvalidShipTypeException.new('Invalid Ship Type') unless valid_ship_type?
  end

  # @return [Integer] type
  def get_strength
    TYPES[type]
  end

  private

  # @return [Boolean]
  def valid_dimensions?
    (width >= min_width || width <= max_width) || (height >= min_height || height <= max_height)
  end
  
  # @return [Boolean]
  def valid_ship_type?
    TYPES.include?(type)
  end

end