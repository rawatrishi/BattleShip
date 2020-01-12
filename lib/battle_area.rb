
require_relative './exception/invalid_battle_area_exception'
require_relative './exception/invalid_ship_coordinates_exception'
require_relative './exception/invalid_ship_count_exception'

class BattleArea

  # @param [Integer] width
  # @param [Integer] height
  def initialize(width, height)
    self.width = width
    self.height = height
    self.min_width = 1
    self.max_width = 9
    self.min_height = 1  # A
    self.max_height = 26 # Z
    self.area = []
    self.ship = []
    self.next_ship_position = 0
    self.total_strength = 0
  end

  # @param [Integer]
  attr_accessor :width

  # @param [Integer]
  attr_accessor :height

  attr_accessor :min_width, :max_width, :min_height, :max_height
  attr_accessor :area, :ship, :total_strength, :next_ship_position


  # @params [Integer] width
  # @params [String] height
  # @return [Boolean]
  # @return [InvalidBattleAreaException] if invalid area
  def create_battle_area!
    raise InvalidBattleAreaException.new('Invalid Battle Area Size') unless valid_area?
    self.area = Array.new(height) { Array.new(width)}
    true
  end

  # @param [Integer] man_ship
  # @param [Integer] max_ship
  # @param [Integer] total_ships
  # @retun [Array] Ship
  # @raise InvalidShipCountException
  def add_total_ships(min_ship, max_ship, total_ships)
    if (total_ships < min_ship || total_ships > max_ship)
      raise InvalidShipCountException.new('Invalid Ship Count')
    end

    self.ship = [nil]*total_ships
    ship
  end

  # @param [Ship] ship
  # @param [String] location
  # @raise [InvalidShipCoordinatesException]
  def add_ship(ship, location)
    self.ship[next_ship_position] = ship
    self.next_ship_position += 1
    y_coord = location[0].ord-64  # String
    x_coord = location[1].to_i    # Integer

    if x_coord < ship.min_width || x_coord > ship.max_width
      raise InvalidShipCoordinatesException.new("Invalid Ship X-Corridinate")
    end

    if (y_coord < ship.min_height || y_coord > ship.max_height)
      raise InvalidShipCoordinatesException.new("Invalid Ship Y-Corridinate")
    end

    outer_limit = y_coord + ship.height
    inner_limit = x_coord + ship.width

    while(outer_limit > y_coord)
      while(inner_limit > x_coord)
        area[y_coord-1][x_coord-1] = ship.get_strength
        self.total_strength += area[y_coord-1][x_coord-1]
        x_coord += 1
      end
      y_coord+=1
    end
  end

  # Reduce strenght of ship on the based on Ship Type
  def reduce_total_strength
    self.total_strength -= 1
  end

  private

  # @return [Boolean]
  def valid_area?
    (width >= min_width && width <= max_width) || (height >= min_height && height <= max_height)
  end

end