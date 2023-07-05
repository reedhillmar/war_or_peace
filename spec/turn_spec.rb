require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
    it "has two players" do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)
        card3 = Card.new(:heart, '9', 9)
        card4 = Card.new(:diamond, 'Jack', 11)
        card5 = Card.new(:heart, '8', 8)
        card6 = Card.new(:diamond, 'Queen', 12)
        card7 = Card.new(:heart, '3', 3)
        card8 = Card.new(:diamond, '2', 2)

        deck1 = Deck.new([card1, card2, card5, card8])
        deck2 = Deck.new([card3, card4, card6, card7])

        player1 = Player.new("Megan", deck1)
        player2 = Player.new("Aurora", deck2)

        turn = Turn.new(player1, player2)

        expect(turn.player1.name).to eq("Megan")
        expect(turn.player2.name).to eq("Aurora")
    end

    it "starts with no spoils of war" do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)
        card3 = Card.new(:heart, '9', 9)
        card4 = Card.new(:diamond, 'Jack', 11)
        card5 = Card.new(:heart, '8', 8)
        card6 = Card.new(:diamond, 'Queen', 12)
        card7 = Card.new(:heart, '3', 3)
        card8 = Card.new(:diamond, '2', 2)

        deck1 = Deck.new([card1, card2, card5, card8])
        deck2 = Deck.new([card3, card4, card6, card7])

        player1 = Player.new("Megan", deck1)
        player2 = Player.new("Aurora", deck2)

        turn = Turn.new(player1, player2)

        expect(turn.spoils_of_war).to eq([])
    end

    describe :basic do
        it "can be basic" do
            card1 = Card.new(:heart, 'Jack', 11)
            card2 = Card.new(:heart, '10', 10)
            card3 = Card.new(:heart, '9', 9)
            card4 = Card.new(:diamond, 'Jack', 11)
            card5 = Card.new(:heart, '8', 8)
            card6 = Card.new(:diamond, 'Queen', 12)
            card7 = Card.new(:heart, '3', 3)
            card8 = Card.new(:diamond, '2', 2)

            deck1 = Deck.new([card1, card2, card5, card8])
            deck2 = Deck.new([card3, card4, card6, card7])

            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)

            turn = Turn.new(player1, player2)

            expect(turn.type).to be(:basic)
        end

        it "can have a winner" do
            card1 = Card.new(:heart, 'Jack', 11)
            card2 = Card.new(:heart, '10', 10)
            card3 = Card.new(:heart, '9', 9)
            card4 = Card.new(:diamond, 'Jack', 11)
            card5 = Card.new(:heart, '8', 8)
            card6 = Card.new(:diamond, 'Queen', 12)
            card7 = Card.new(:heart, '3', 3)
            card8 = Card.new(:diamond, '2', 2)

            deck1 = Deck.new([card1, card2, card5, card8])
            deck2 = Deck.new([card3, card4, card6, card7])

            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)

            turn = Turn.new(player1, player2)

            expect(turn.winner).to eq(player1)
        end

        it "can pile cards" do
            card1 = Card.new(:heart, 'Jack', 11)
            card2 = Card.new(:heart, '10', 10)
            card3 = Card.new(:heart, '9', 9)
            card4 = Card.new(:diamond, 'Jack', 11)
            card5 = Card.new(:heart, '8', 8)
            card6 = Card.new(:diamond, 'Queen', 12)
            card7 = Card.new(:heart, '3', 3)
            card8 = Card.new(:diamond, '2', 2)

            deck1 = Deck.new([card1, card2, card5, card8])
            deck2 = Deck.new([card3, card4, card6, card7])

            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)

            turn = Turn.new(player1, player2)

            winner = turn.winner
            
            turn.pile_cards

            expect(turn.spoils_of_war).to eq([card1, card3])
        end

        it "can award spoils to the winner" do
            card1 = Card.new(:heart, 'Jack', 11)
            card2 = Card.new(:heart, '10', 10)
            card3 = Card.new(:heart, '9', 9)
            card4 = Card.new(:diamond, 'Jack', 11)
            card5 = Card.new(:heart, '8', 8)
            card6 = Card.new(:diamond, 'Queen', 12)
            card7 = Card.new(:heart, '3', 3)
            card8 = Card.new(:diamond, '2', 2)

            deck1 = Deck.new([card1, card2, card5, card8])
            deck2 = Deck.new([card3, card4, card6, card7])

            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)

            turn = Turn.new(player1, player2)

            winner = turn.winner
            
            turn.pile_cards

            turn.award_spoils(winner)

            expect(player1.deck.cards).to eq([card2, card5, card8, card1, card3])
            expect(player2.deck.cards).to eq([card4, card6, card7])
        end
    end

    describe :war do
        it "can be war" do
            card1 = Card.new(:heart, 'Jack', 11)
            card2 = Card.new(:heart, '10', 10)
            card3 = Card.new(:heart, '9', 9)
            card4 = Card.new(:diamond, 'Jack', 11)
            card5 = Card.new(:heart, '8', 8)
            card6 = Card.new(:diamond, 'Queen', 12)
            card7 = Card.new(:heart, '3', 3)
            card8 = Card.new(:diamond, '2', 2)

            deck1 = Deck.new([card1, card2, card5, card8])
            deck2 = Deck.new([card4, card3, card6, card7])

            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)

            turn = Turn.new(player1, player2)

            expect(turn.type).to be(:war)
        end

        it "can have a winner" do
            card1 = Card.new(:heart, 'Jack', 11)
            card2 = Card.new(:heart, '10', 10)
            card3 = Card.new(:heart, '9', 9)
            card4 = Card.new(:diamond, 'Jack', 11)
            card5 = Card.new(:heart, '8', 8)
            card6 = Card.new(:diamond, 'Queen', 12)
            card7 = Card.new(:heart, '3', 3)
            card8 = Card.new(:diamond, '2', 2)

            deck1 = Deck.new([card1, card2, card5, card8])
            deck2 = Deck.new([card4, card3, card6, card7])

            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)

            turn = Turn.new(player1, player2)

            expect(turn.winner).to eq(player2)
        end

        it "can pile cards" do
            card1 = Card.new(:heart, 'Jack', 11)
            card2 = Card.new(:heart, '10', 10)
            card3 = Card.new(:heart, '9', 9)
            card4 = Card.new(:diamond, 'Jack', 11)
            card5 = Card.new(:heart, '8', 8)
            card6 = Card.new(:diamond, 'Queen', 12)
            card7 = Card.new(:heart, '3', 3)
            card8 = Card.new(:diamond, '2', 2)

            deck1 = Deck.new([card1, card2, card5, card8])
            deck2 = Deck.new([card4, card3, card6, card7])

            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)

            turn = Turn.new(player1, player2)

            winner = turn.winner

            turn.pile_cards

            expect(turn.spoils_of_war).to eq([card1, card2, card5, card4, card3, card6])
        end

        it "can award spoils to the winner" do
            card1 = Card.new(:heart, 'Jack', 11)
            card2 = Card.new(:heart, '10', 10)
            card3 = Card.new(:heart, '9', 9)
            card4 = Card.new(:diamond, 'Jack', 11)
            card5 = Card.new(:heart, '8', 8)
            card6 = Card.new(:diamond, 'Queen', 12)
            card7 = Card.new(:heart, '3', 3)
            card8 = Card.new(:diamond, '2', 2)

            deck1 = Deck.new([card1, card2, card5, card8])
            deck2 = Deck.new([card4, card3, card6, card7])

            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)

            turn = Turn.new(player1, player2)

            winner = turn.winner

            turn.pile_cards

            turn.award_spoils(winner)

            expect(player1.deck.cards).to eq([card8])
            expect(player2.deck.cards).to eq([card7, card1, card2, card5, card4, card3, card6])
        end
    end

    describe :mutually_assured_destruction do
        it "can be mutually assured destruction" do
            card1 = Card.new(:heart, 'Jack', 11)
            card2 = Card.new(:heart, '10', 10)
            card3 = Card.new(:heart, '9', 9)
            card4 = Card.new(:diamond, 'Jack', 11)
            card5 = Card.new(:heart, '8', 8)
            card6 = Card.new(:diamond, '8', 8)
            card7 = Card.new(:heart, '3', 3)
            card8 = Card.new(:diamond, '2', 2)

            deck1 = Deck.new([card1, card2, card5, card8])
            deck2 = Deck.new([card4, card3, card6, card7])

            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)

            turn = Turn.new(player1, player2)

            expect(turn.type).to be(:mutually_assured_destruction)
        end

        it "has no winner" do
            card1 = Card.new(:heart, 'Jack', 11)
            card2 = Card.new(:heart, '10', 10)
            card3 = Card.new(:heart, '9', 9)
            card4 = Card.new(:diamond, 'Jack', 11)
            card5 = Card.new(:heart, '8', 8)
            card6 = Card.new(:diamond, '8', 8)
            card7 = Card.new(:heart, '3', 3)
            card8 = Card.new(:diamond, '2', 2)

            deck1 = Deck.new([card1, card2, card5, card8])
            deck2 = Deck.new([card4, card3, card6, card7])

            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)

            turn = Turn.new(player1, player2)
            
            expect(turn.winner).to eq("No Winner")
        end

        it "can discard cards" do
            card1 = Card.new(:heart, 'Jack', 11)
            card2 = Card.new(:heart, '10', 10)
            card3 = Card.new(:heart, '9', 9)
            card4 = Card.new(:diamond, 'Jack', 11)
            card5 = Card.new(:heart, '8', 8)
            card6 = Card.new(:diamond, '8', 8)
            card7 = Card.new(:heart, '3', 3)
            card8 = Card.new(:diamond, '2', 2)

            deck1 = Deck.new([card1, card2, card5, card8])
            deck2 = Deck.new([card4, card3, card6, card7])

            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)

            turn = Turn.new(player1, player2)

            winner = "No Winner"

            turn.pile_cards

            expect(turn.spoils_of_war).to eq([])
            expect(player1.deck.cards).to eq([card8])
            expect(player2.deck.cards).to eq([card7])
        end
    end
end