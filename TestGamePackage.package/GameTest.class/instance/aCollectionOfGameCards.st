as yet unclassified
aCollectionOfGameCards
| aCollectionOfGameDeckCards |
aCollectionOfGameDeckCards := OrderedCollection new.

aCollectionOfGameDeckCards add: (CardCancellation named: 'CardCancellation1').
aCollectionOfGameDeckCards add: (CardCancellation named: 'CardCancellation2').
aCollectionOfGameDeckCards add: (CardDamping named: 'CardDamping1').
aCollectionOfGameDeckCards add: (CardDamping  named: 'CardDamping2').
aCollectionOfGameDeckCards add: (CardUndo named: 'CardUndo1').
aCollectionOfGameDeckCards add: (CardUndo named: 'CardUndo2').
aCollectionOfGameDeckCards add: (CardSpeed named: 'CardSpeed1').
aCollectionOfGameDeckCards add: (CardSpeed  named: 'CardSpeed2').
aCollectionOfGameDeckCards add: (CardOverloading named: 'CardOverloading1').
aCollectionOfGameDeckCards add: (CardSpeed  named: 'CardOverloading2').

^aCollectionOfGameDeckCards
