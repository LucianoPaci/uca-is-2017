tests
testWhenAPlayerCardIsEqualsToAnotherCard
| aPlayer aPlayerCard anotherCard |
anotherCard := CardUndo named: 'CardUndo1'.
aPlayerCard := CardUndo named: 'CardUndo1'.
aPlayer := Player named: 'Scorpion'.

self assert: (aPlayer aCard: aPlayerCard  isEqualsTo: anotherCard) equals: true.