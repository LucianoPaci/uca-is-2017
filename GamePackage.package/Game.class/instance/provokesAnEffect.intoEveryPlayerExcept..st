playing
provokesAnEffect: upRoundedEffectCalculation intoEveryPlayerExcept: aPlayer.
(players reject: [:player | player = aPlayer ])
do: [:player | (self move: player positions: upRoundedEffectCalculation) ]
