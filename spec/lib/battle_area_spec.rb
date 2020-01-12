require_relative '../../lib/exception/invalid_battle_area_exception'
require_relative '../../lib/exception/invalid_ship_coordinates_exception'
require_relative '../../lib/exception/invalid_ship_count_exception'
require_relative '../../lib/battle_area'

describe BattleArea do
  describe 'initialize' do
    context 'given input paramaters is correct' do
      it 'returns new BattleArea instance' do
        battle_area = BattleArea.new(5, 5)
        expect(battle_area.class).to eql(BattleArea)
        expect(battle_area.width).to eql(5)
        expect(battle_area.height).to eql(5)
        expect(battle_area.min_width).to eql(1)
        expect(battle_area.max_width).to eql(9)
        expect(battle_area.min_height).to eql(1)
        expect(battle_area.max_height).to eql(26)
      end
    end

    context 'given input paramaters have partial or no parameters' do
      it 'throws exception due to missing argument errors' do
        expect { BattleArea.new }.to raise_error(ArgumentError)
      end
    end

    context 'create_battle_area' do
      it 'return battle area' do
        battle_area = BattleArea.new(5, 5)
        expect(battle_area.create_battle_area!).to eql(true)
      end

      it 'throws exception due to invalid area size' do
        battle_area = BattleArea.new(12, 34)
        expect { battle_area.create_battle_area! }.to raise_error(InvalidBattleAreaException)
      end
    end
  end
end