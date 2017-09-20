testing
nextTurnFor: aPlayer
	
	| movesToBeMade |
	(self wrongTurnFor: aPlayer) ifFalse: [
	
		movesToBeMade := dices sumNumbers:  [ :dice | dice roll ].
	
		self moveForward: aPlayer  positions: movesToBeMade.
		self winnerOfGame: aPlayer.
		self changePreviousTurnPlayer: aPlayer.
	].
