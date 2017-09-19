tests
testWhenPlayerIsCreatedNameShouldntBeEmpty
self should: [ Player named: '' ] raise: Error