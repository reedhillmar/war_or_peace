class Turn
    attr_reader :player1, :player2, :spoils_of_war

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end

    def type
        if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
            :mutually_assured_destruction
        elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
            :war
        else
            :basic
        end
    end

    def winner
        if self.type == :basic
            if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
                player1
            else
                player2
            end
        end
    end

    def pile_cards
        if self.type == :basic
            spoils_of_war << player1.deck.remove_card
            spoils_of_war << player2.deck.remove_card
        end
    end

    def award_spoils(winner)
        winner.deck.add_card(spoils_of_war)
    end

end