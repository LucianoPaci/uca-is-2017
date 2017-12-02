use of cards
throwsPotentiationCardsToASquare: aPreviousSquare affecting:  aPlayer withACard: cardEffect
(aPlayer instantCardsToBePlayed) do:[:each | (each) duplicatesAnEffectOf: aPreviousSquare to: aPlayer from: self with: cardEffect]		 
		  