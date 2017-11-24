accessing
selectAPermanentCardToBePlayedEqualsTo: aCard
^(permanentCardsToBePlayed select:  [:each | self  aCard:aCard isEqualTo:  each ]).