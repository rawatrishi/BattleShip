 require_relative './player'

 class Game

  # @return [Player]
  attr_accessor :player1

  # @return [Player]
  attr_accessor :player2

  # @param [Array] input
  def start_game(input)
    self.player1 = Player.new('Player-1')
    self.player2 = Player.new('Player-2')
    
    player1.create_battle_area(input[0])
    player2.create_battle_area(input[0])
    
    add_ships_to_battle_area(input)
    
    player1.add_missile(input[-2])
    player2.add_missile(input[-1])

    # PlayGame
    play
  end

  # Read totalships and ship coordinates as input and place ships on each Player's
  # battle area at the respective coordinates
  # 
  # @param [Array] input
  def add_ships_to_battle_area(input)
    # Add Total Ships to each Battle Area
    total_ships = input[1].to_i
    player1.add_total_ships_to_battle_area(total_ships)
    player2.add_total_ships_to_battle_area(total_ships)

    # Add different type of ships to each battle area
    i = 0
    while(total_ships > i)
      battle_ship_detail = input[i+2].split(' ')
      player1.add_ship_in_battle_area(
                                        battle_ship_detail[0],
                                        battle_ship_detail[1].to_i,
                                        battle_ship_detail[2].to_i,
                                        battle_ship_detail[3]
                                      )
      player2.add_ship_in_battle_area(
                                        battle_ship_detail[0],
                                        battle_ship_detail[1].to_i,
                                        battle_ship_detail[2].to_i,
                                        battle_ship_detail[4]
                                      )
      i += 1
    end
  end
  
  def play
    while(true)
      break if shoot_until(player1, player2)
      break if shoot_until(player2, player1)
    end
  end

  # @param [Player] palyer_a
  # @param [Player] palyer_b
  # @return [Boolean]
  def shoot_until(player_a, player_b)
    win = false
    if player_a.missiles.size == 0
      puts player_a.name + ' has no more missiles left to launch'
    else
      hit = true
      while(hit && player_a.missiles.size > 0)
        hit = player_a.shoot(player_b)
        if player_b.is_down
          puts(player_a.name + ' won the battle')
          win = true
          break
        end
      end
    end
    win
  end
end