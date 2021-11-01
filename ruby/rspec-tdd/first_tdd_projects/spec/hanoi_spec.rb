require 'hanoi'

describe TowersOfHanoi do
    subject(:game) { TowersOfHanoi.new }

    describe '#render' do
    it "draws stacks properly" do 
        expect(game.render).to eq("3 2 1")
    end
    end

    describe '#move' do
    it 'allows move onto empty stack'
    it 'allows move onto larger disc'
    it 'does not move onto a smaller disc'
    it 'does not allow move from empty stack'
    end

    describe '#won?' do
    it 'is not true at start of game'
    it 'is true when all discs on tower 1'
    it 'is true when all discs on tower 2'
    end
end