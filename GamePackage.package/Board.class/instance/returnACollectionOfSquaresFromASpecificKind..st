as yet unclassified
returnACollectionOfSquaresFromASpecificKind: aKindOfSquare
^squares select: [ :each | each isKindOf: aKindOfSquare ]