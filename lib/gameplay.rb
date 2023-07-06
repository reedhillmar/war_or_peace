class Gameplay
    attr_reader :player1, :player2, :turn, :turn_counter

    def initialize(player1, player2, turn)
        @player1 = player1
        @player2 = player2
        @turn = turn
        @turn_counter = 0
    end

    def start
        p "Welcome to War! (or Peace) This game will be played with 52 cards."
        p "The players today are #{player1.name} and #{player2.name}."
        p "Type 'GO' to start the game!"
    end

    def GO
        loop do
            @turn_counter += 1

            if turn_counter > 1000000
                p "---- DRAW ----"
                break
            elsif player1.has_lost? == true
                p "*~*~*~* #{player2.name} has won the game! *~*~*~*"
                break
            elsif player2.has_lost? == true
                p "*~*~*~* #{player1.name} has won the game! *~*~*~*"
                break
            elsif turn.type == :basic
                p "Turn #{turn_counter}: #{turn.winner.name} won #{turn.spoils_of_war.count} cards. #{player1.name}: #{player1.deck.cards.length} #{player2.name}: #{player2.deck.cards.length}"
            elsif turn.type == :war
                p "Turn #{turn_counter}: WAR - #{turn.winner.name} won #{turn.spoils_of_war.count} cards. #{player1.name}: #{player1.deck.cards.length} #{player2.name}: #{player2.deck.cards.length}"
            else
                p "Turn #{turn_counter}: *mutually assured destruction* 6 cards removed from play. #{player1.name}: #{player1.deck.cards.length} #{player2.name}: #{player2.deck.cards.length}"
            end

            winner = turn.winner
            turn.pile_cards
            turn.award_spoils(winner)
        end
    end
end