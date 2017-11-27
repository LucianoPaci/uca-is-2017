use of cards
throwsPotentiationCardsToASquare: aPreviousSquare from:  aGame withACard: cardEffect
(instantCardsToBePlayed) do:[:each | (each) duplicatesAnEffectFrom: aPreviousSquare toAPlayer: self fromAGame: aGame withPermanentCardEffects: cardEffect]		 
		  