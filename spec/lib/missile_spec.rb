require_relative '../../lib/missile'

describe Missile do
  describe 'initialize' do
    context 'given input paramaters is correct' do
      it 'returns new slot instance' do
        missile = Missile.new('A1')
        expect(missile.class).to eql(Missile)
        expect(missile.row).to eql(0)
        expect(missile.column).to eql(0)
        expect(missile.target).to eql('A1')
      end

      context 'given input paramaters have partial or no parameters' do
        it 'throws exception due to missing argument errors' do
          expect { Missile.new }.to raise_error(ArgumentError)
        end
      end
    end
  end
end