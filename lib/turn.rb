class Turn
    attr_reader :player1, :player2, :spoils_of_war

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end

    def type
        if player1.deck.cards.length == 2 || player2.deck.cards.length == 2
            if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(1) == player2.deck.rank_of_card_at(1)
                :mutually_assured_destruction
            end
        elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
            :mutually_assured_destruction
        elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
            :war
        else
            :basic
        end
    end

    def winner
        if type == :basic
            if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
                player1
            else
                player2
            end
        elsif type == :war 
            if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
                player1
            else
                player2
            end
        else
            "No Winner"
        end
    end

    def pile_cards
        @spoils_of_war.clear

        if type == :basic
            spoils_of_war << player1.deck.remove_card
            spoils_of_war << player2.deck.remove_card
        elsif type == :war
            3.times {spoils_of_war << player1.deck.remove_card}
            3.times {spoils_of_war << player2.deck.remove_card}
        else type == :mutually_assured_destruction
            3.times {player1.deck.remove_card}
            3.times {player2.deck.remove_card}
        end
    end

    def award_spoils(winner)
        if winner == "No Winner"
        else
            winner.deck.add_card(spoils_of_war.shuffle).flatten!
        end
    end
end