tests
testWhenACardIsEqualsToAnotherCard
	| cardDamping cardCancellation |
	cardDamping := CardDamping named: 'CardDamping1'.
	cardCancellation := CardCancellation named: 'CardCancellation1'.
	self assert: (cardDamping isEqualTo: cardDamping) equals: true.
	self assert: (cardCancellation isEqualTo: cardCancellation  ) equals: true.