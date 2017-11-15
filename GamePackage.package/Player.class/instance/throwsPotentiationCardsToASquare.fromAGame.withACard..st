use of cards
throwsPotentiationCardsToASquare: aPreviousSquare fromAGame:  aGame withACard: cardEffect
(instantCardsToBePlayed notNil)
ifTrue: [(instantCardsToBePlayed) do:[:each | (each) duplicatesAnEffectFrom: aPreviousSquare toAPlayer: self fromAGame: aGame withPermanentCardEffects: 			cardEffect]]			 
		  