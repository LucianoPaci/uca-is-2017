tests
testWhenACardIsCreatedAndItsNameIsEmptyAnErrorMessageIsThrown
| aCardSpeed |
self should: [ aCardSpeed := CardSpeed named:'' ] raise: Error.

