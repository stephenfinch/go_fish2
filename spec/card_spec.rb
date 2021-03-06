require "rspec"
require "../lib/card"

describe("#Card") do
  it "should remember the rank it was made with" do
    king = Card.new("K", "D")
    ten = Card.new("10", "D")
    two = Card.new("2", "D")
    expect(king.rank).to eq "K"
    expect(ten.rank).to eq "10"
    expect(two.rank).to eq "2"
  end

  it "should remember the suit it was made with" do
    hearts = Card.new("4", "H")
    clubs = Card.new("4", "C")
    diamonds = Card.new("4", "D")
    expect(hearts.suit).to eq "H"
    expect(clubs.suit).to eq "C"
    expect(diamonds.suit).to eq "D"
  end

  context ".==" do
    it "should say two cards of the same rank are equal" do
      card1 = Card.new("4", "C")
      card2 = Card.new("4", "D")
      expect(card1).to eq card2
    end
  end
end
