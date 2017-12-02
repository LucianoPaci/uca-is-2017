tests
testWhenACardIsCreatedAnItsNameIsEmptyAnErrorMessageIsThrown
| aCardSpeed |
self should: [ aCardSpeed := CardSpeed named:'' ] raise: Error.

