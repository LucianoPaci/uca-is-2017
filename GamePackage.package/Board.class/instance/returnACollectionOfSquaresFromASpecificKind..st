accessing
returnACollectionOfSquaresFromASpecificKind: aKindOfSquare
^squares select: [ :each | each isKindOf: aKindOfSquare ]