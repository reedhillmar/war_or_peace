class Deck
    attr_reader :cards

    def initialize(cards)
        @cards = cards
    end

    def rank_of_card_at(index_location)
        cards.fetch(index_location).rank
    end

end