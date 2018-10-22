require 'pry'
class Deck

    def initialize
        ['Hearts', 'Clubs', 'Diamond', 'Spades'].each do |suit|
            ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'].each do |rank|
                Card.new(suit, rank, self) 
            end
        end      
    end

    def cards
        Card.all.select do |card|
            card.deck == self
        end
    end

    def choose_card
        Card.all.delete(cards.sample)
    end


end

class Card

    attr_accessor :rank, :suit, :deck
    @@all = []

    def initialize(suit, rank, deck = Deck.new)
        @rank = rank
        @suit = suit
        @deck = deck
        @@all << self
    end

    def self.all
        @@all
    end

end



