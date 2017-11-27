tests
testWhenACardIsCreatedMustHaveAName
	| cardDamping cardCancellation cardOverloading cardSpeed cardPotentiation |
	cardDamping := CardDamping named: 'CardDamping1'.
	cardCancellation := CardCancellation named: 'CardCancellation1'.
	cardOverloading := CardOverloading named: 'CardOverloading1'.
	cardSpeed := CardSpeed named: 'CardSpeed1'.
	cardPotentiation := CardPotentiation named: 'CardPotentiation1'.
	self assert: (cardDamping name isNotEmpty) equals: true.
	self assert: (cardCancellation name isNotEmpty) equals: true.
	self assert: (cardOverloading name isNotEmpty) equals: true.
	self assert: (cardSpeed name isNotEmpty) equals: true.
	self assert: (cardPotentiation name isNotEmpty) equals: true.
	 