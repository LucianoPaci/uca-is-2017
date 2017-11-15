adding
addToAPlayer: aPlayer fromAGame: aGame
(aGame players) do: [:each | (each permanentCardsToBePlayed add: self)].