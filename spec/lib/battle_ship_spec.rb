require_relative '../../lib/exception/invalid_ship_dimensions_exception'
require_relative '../../lib/exception/invalid_ship_type_exception'
require_relative '../../lib/battle_ship'

describe BattleShip do
  describe 'initialize' do
    context 'given input paramaters is correct' do
      it 'returns new BattleShip instance' do
        battle_ship = BattleShip.new(1, 5, 1, 5)
        expect(battle_ship.class).to eql(BattleShip)
        expect(battle_ship.min_width).to eql(1)
        expect(battle_ship.max_width).to eql(5)
        expect(battle_ship.min_height).to eql(1)
        expect(battle_ship.max_height).to eql(5)
      end

      context 'given input paramaters have partial or no parameters' do
        it 'throws exception due to missing argument errors' do
          expect { BattleShip.new }.to raise_error(ArgumentError)
        end
      end
    end
  end
end
