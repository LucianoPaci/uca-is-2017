instance creation
named: aName protectedBy: aCollectionOfProtectionCards
self assertShouldNotBeEmpty: aName.
^self new initializedWithAName: aName withProtectionCards: aCollectionOfProtectionCards 