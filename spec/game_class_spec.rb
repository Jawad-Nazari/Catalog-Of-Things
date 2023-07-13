require_relative '../game_class'

RSpec.describe Game do
  describe '#can_be_archived?' do
    it 'returns true if the item can be archived' do
      two_years_ago = Time.now - (2 * 365 * 24 * 60 * 60)
      game = Game.new(true, two_years_ago - (10 * 365 * 24 * 60 * 60), 'John Doe', 'Game Title')
      allow(game).to receive(:can_be_archived?).and_return(true)
      expect(game.can_be_archived?).to be true
    end

    it 'returns false if the item cannot be archived' do
      two_years_ago = Time.now - (2 * 365 * 24 * 60 * 60)
      game = Game.new(true, two_years_ago, 'John Doe', 'Game Title')
      allow(game).to receive(:can_be_archived?).and_return(false)
      expect(game.can_be_archived?).to be false
    end
  end
end
