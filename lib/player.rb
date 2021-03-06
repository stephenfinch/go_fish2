class Player
  attr_accessor :hand, :name, :books

  def initialize(name, hand = [])
    @name = name
    @hand = hand
    @books = 0
  end

  def ask(player, card)
    cards_won = player.remove_cards(card.rank)
    take_cards(cards_won)
    cards_won
  end

  def take_cards(cards)
    self.hand.concat(cards)
    check_for_book if hand.length > 0
    self.hand.shuffle!
  end

  def remove_cards(rank)
    cards_taken = hand.select { |card| card.rank == rank }
    self.hand -= cards_taken
    cards_taken
  end

  def check_for_book
    ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"].each do |rank|
      search_for_rank(rank)
    end
  end

  def search_for_rank(rank)
    matching = hand.select { |card| card.rank == rank }
    if matching.length == 4
      self.books += 1
      self.hand -= matching
    end
  end
end
