tests
testWhenUsingAFixedNumberSourceDiceMustReturnInOrderValues
| dice |
dice := Dice faces: 6 obtainingValuesFrom: (FixedNumberSource providing: #(1 2 3 4 5 6)).
self assert: dice roll equals: 1.
self assert: dice roll equals: 2.
self assert: dice roll equals: 3.
self assert: dice roll equals: 4.
self assert: dice roll equals: 5.
self assert: dice roll equals: 6.