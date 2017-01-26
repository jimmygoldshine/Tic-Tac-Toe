require 'spec_helper'
require 'game'

describe Game do

  let(:game) {described_class.new}

  it 'initialize grid with 9 empty slots' do
    expect(game.grid.length).to eq 9
  end

  describe 'accepts an "X" or a "O" only' do

    it 'accepts an X' do
      game.turn('X', 0)
      expect(game.grid[0]).to eq 'X'
    end

    it 'accepts an O' do
      game.turn('O', 5)
      expect(game.grid[5]).to eq 'O'
    end

    it 'raises an error if a non-valid character entered' do
      expect{game.turn("G", 8)}.to raise_error 'Error: Invalid character entered'
    end
  end

  describe 'only allows players to play valid slots' do

    it 'raises error if player tries to play outside of the grid' do
      expect{game.turn("X", 9)}.to raise_error 'Error: Chosen slot is outside of the grid'
    end

    it 'raises an error if player tries to play in a taken slot' do
      game.turn('O', 5)
      expect{game.turn('X', 5)}.to raise_error 'Error: Chosen slot has been taken'
    end
  end

end
