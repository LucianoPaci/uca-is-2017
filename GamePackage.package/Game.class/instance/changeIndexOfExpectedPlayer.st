playing
changeIndexOfExpectedPlayer
self playerCollectionOutOfBound
ifTrue:[ indexOfExpectedPlayer := 1]
ifFalse:[  indexOfExpectedPlayer := indexOfExpectedPlayer +1]