addingEffect
applyAnEffect: anEffect inEveryPlayerExcept: aPlayer.
( players reject: [:player | player = aPlayer ])
do: [:player |  self move: player positions: anEffect]