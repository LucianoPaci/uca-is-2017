as yet unclassified
throwsPotentiationCardsToASquare: aPreviousSquare to:  aPlayer withACard: cardEffect
(aPlayer instantCardsToBePlayed) do:[:each | (each) duplicatesAnEffectFrom: aPreviousSquare toAPlayer: aPlayer fromAGame: self withPermanentCardEffects: cardEffect]		 
		  