accessing
returnACollectionOfSquaresFromASpecificKind: aKindOfSquare
^squares copy select: [ :each | each isKindOf: aKindOfSquare ]