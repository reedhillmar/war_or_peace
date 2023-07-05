class Deck
    attr_reader :cards

    def initialize(cards)
        @cards = cards
    end

    def rank_of_card_at(index_location)
        cards.fetch(index_location).rank
    end

    def high_ranking_cards
        # high_ranking_cards = []
        
        # cards.each do |card|
        #     high_ranking_cards << card if card.rank >= 11
        # end

        # high_ranking_cards

        cards.select {|card| card.rank >= 11}
    end

    def percent_high_ranking
        ((self.high_ranking_cards.length.to_f / cards.length.to_f)*100).round(2)
    end

    def remove_card
        require 'pry';binding.pry
        cards.shift
    end

    def add_card(card)
        cards << card
    end
end