use of cards
throwsCancellationCards
	(instantCardsToBePlayed notNil)
ifTrue: [(instantCardsToBePlayed) do:[:each | (each) removePermanentCardFrom: self ] ]