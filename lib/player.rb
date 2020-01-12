require_relative './battle_area'
require_relative './battle_ship'
require_relative './missile'

class Player

  def initialize(name)
    self.name = name
  end

  attr_accessor :name, :battle_area, :missiles

  # Read battle area dimensions as input and create battle area.
  # @param [String] battle_area_dimensions
  # @return [BattleArea] battle_area
  # @raise [InvalidBattleAreaException]  if the area is not within defined range.
  def create_battle_area(battle_area_dimensions)  
    dimensions = battle_area_dimensions.split(' ')
    self.battle_area = BattleArea.new(dimensions[0].to_i, dimensions[1][0].ord-64)
    battle_area.create_battle_area!
  end
  
  # @param [Integer] total_ships
  # Add totalShips to each battle area
  def add_total_ships_to_battle_area(total_ships)
    battle_area.add_total_ships(1, battle_area.width * battle_area.height, total_ships)
  end

  # @param [String] type
  # @param [Integer] width
  # @param [Integer] height
  # @param [String] location
  def add_ship_in_battle_area(type, width, height, location)
    
    # Add different type of ships to each BattleArea
    ship = BattleShip.new(1, battle_area.width, 1, battle_area.height)
    ship.create_ship(type, width, height)
      
    # Update ship location
    battle_area.add_ship(ship, location)
  end

  # @param [String] input
  def add_missile(input)
    input.split(' ').each do |target|
      missiles << Missile.new(target)
    end
  end

  # @param [Player] player
  # @return [Boolean]
  def shoot(player)
    hit = false
    missile = missiles.pop
    value = player.battle_area.area[missile.row][missile.column]
    if value.nil?
      puts (name + ' fires a missile with target ' + missile.target + ' which got miss')
    else
      puts (name + ' fires a missile with target ' + missile.target + ' which got hit')
      player.battle_area.area[missile.row][missile.column] = player.battle_area.area[missile.row][missile.column] - 1
      player.battle_area.reduce_total_strength
      hit = true
    end
    hit
  end

  # @param [Boolean]
  def is_down
    battle_area.total_strength == 0 ? true : false
  end

  # @return [Queue]
  def missiles
    @missiles ||= Queue.new
  end

end