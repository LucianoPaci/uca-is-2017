setter
changePosition: anAmountOfPositions
	position add: (PlayerPosition at: anAmountOfPositions withLaps: 0)
	"must add new object to player History collection"