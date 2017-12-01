use of cards
throwsPotentiationCardsToASquare: aPreviousSquare affecting:  aPlayer withACard: cardEffect
(aPlayer instantCardsToBePlayed) do:[:each | (each) duplicatesAnEffectFrom: aPreviousSquare toAPlayer: aPlayer fromAGame: self withPermanentCardEffects: cardEffect]		 
		  