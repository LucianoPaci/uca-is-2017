accessing
selectAPermanentCardToBePlayedEqualsTo: aCard
^(permanentCardsToBePlayed select:  [:each | aCard isEqualTo:  each ]).