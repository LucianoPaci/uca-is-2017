testing
nextTurnFor2: aPlayer
	| movesToBeMade |
	(self wrongTurnFor: aPlayer)
		ifFalse: [ movesToBeMade := 0.
			movesToBeMade := dices sumNumbers: [ :dice | dice roll ].
			self moveForward: aPlayer positions: movesToBeMade.
			self winnerOfGame: aPlayer.
			self changePreviousTurnPlayer: aPlayer ]