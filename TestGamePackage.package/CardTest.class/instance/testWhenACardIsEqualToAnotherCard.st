tests
testWhenACardIsEqualToAnotherCard
	| cardDamping cardCancellation |
	cardDamping := CardDamping named: 'CardDamping1'.
	cardCancellation := CardCancellation named: 'CardCancellation1'.
	self assert: (cardDamping == cardDamping) equals: true.
	self assert: (cardCancellation == cardCancellation  ) equals: true.