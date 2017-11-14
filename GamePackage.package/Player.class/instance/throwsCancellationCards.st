as yet unclassified
throwsCancellationCards
	(instantCardsToBePlayed notNil)
ifTrue: [(instantCardsToBePlayed) do:[:each | (each) removePermanentCardFrom: self ] ]