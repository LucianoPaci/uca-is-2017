tests
testWhenACardIsNotEqualToAnotherCard
	| cardDamping cardCancellation |
	cardDamping := CardDamping named: 'CardDamping1'.
	cardCancellation := CardCancellation named: 'CardCancellation1'.
	self assert: (cardDamping isEqualTo: cardCancellation) equals: false.
	self assert: (cardCancellation isEqualTo: cardDamping ) equals: false.