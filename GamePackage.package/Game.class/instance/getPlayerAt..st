accessing
getPlayerAt: anIndex
^(players at: anIndex ifAbsent: [ GameFailed signal:'El jugador no se encuentra']).