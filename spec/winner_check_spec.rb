require 'spec_helper'
require 'winner_check'

describe WinnerCheck do

  describe 'X diagonals' do

    grid = [['X'],[],[],[],['X'],[],[],[],['X']]
    let(:checks) { described_class.new(double("Game", :grid => grid)) }

    it 'checks to see if player X has won via diagonals' do
      expect(checks.winner?).to eq 'X has won!'
    end
  end

  describe 'O diagonals' do

    grid = [[],[],['O'],[],['O'],[],['O'],[],[]]
    let(:checks) { described_class.new(double("Game", :grid => grid)) }

    it 'checks to see if player O has won via diagonals' do
      expect(checks.winner?).to eq 'O has won!'
    end
  end

  describe 'horizontal_1' do

    grid = [['X'],['X'],['X'],[],['O'],[],['O'],[],[]]
    let(:checks) { described_class.new(double("Game", :grid => grid)) }

    it "checks to see if a player has won via top horizontal" do
      expect(checks.winner?).to eq 'X has won!'
    end
  end

  describe 'horizontal_2' do

    grid = [[],[],[],['O'],['O'],['O'],['O'],[],[]]
    let(:checks) { described_class.new(double("Game", :grid => grid)) }

    it "checks to see if a player has won via middle horizontal" do
      expect(checks.winner?).to eq 'O has won!'
    end
  end

  describe 'horizontal_3' do

    grid = [[],[],[],['O'],['O'],[],['O'],['O'],['O']]
    let(:checks) { described_class.new(double("Game", :grid => grid)) }

    it "checks to see if a player has won via bottom horizontal" do
      expect(checks.winner?).to eq 'O has won!'
    end
  end

  describe 'vertical_1' do

    grid = [['X'],[],[],['X'],['O'],[],['X'],['O'],['O']]
    let(:checks) { described_class.new(double("Game", :grid => grid)) }

    it "checks to see if a player has won via left vertical" do
      expect(checks.winner?).to eq 'X has won!'
    end
  end

  describe 'vertical_2' do

    grid = [[],['X'],[],['O'],['X'],[],['X'],['X'],['O']]
    let(:checks) { described_class.new(double("Game", :grid => grid)) }

    it "checks to see if a player has won via middle vertical" do
      expect(checks.winner?).to eq 'X has won!'
    end
  end

  describe 'vertical_3' do

    grid = [[],['X'],['O'],['O'],['X'],['O'],['X'],[],['O']]
    let(:checks) { described_class.new(double("Game", :grid => grid)) }

    it "checks to see if a player has won via right vertical" do
      expect(checks.winner?).to eq 'O has won!'
    end
  end

  describe 'non-winner 1' do

    grid = [[],['X'],['O'],[],['X'],['O'],['X'],[],[]]
    let(:checks) { described_class.new(double("Game", :grid => grid)) }

    it "prompts the next player's turn" do
      expect(checks.winner?).to eq "Next player's turn"
    end
  end

  describe 'non-winner 2' do

    grid = [[],[],['O'],[],[],['O'],['X'],[],['X']]
    let(:checks) { described_class.new(double("Game", :grid => grid)) }

    it "prompts the next player's turn" do
      expect(checks.winner?).to eq "Next player's turn"
    end
  end

  describe 'non-winner 3' do

    grid = [[],['O'],['X'],[],['X'],['O'],['O'],['O'],['X']]
    let(:checks) { described_class.new(double("Game", :grid => grid)) }

    it "prompts the next player's turn" do
      expect(checks.winner?).to eq "Next player's turn"
    end
  end

  describe 'draw' do

    grid = [['O'],['O'],['X'],['X'],['X'],['O'],['O'],['O'],['X']]
    let(:checks) { described_class.new(double("Game", :grid => grid)) }

    it "checks to see if all slots are taken and no one has won" do
      expect(checks.winner?).to eq "It's a draw!"
    end
  end


end
