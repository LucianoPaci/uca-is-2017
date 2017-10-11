baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'GamePackage';
				package: 'TestGamePackage' with: [ spec requires: 'GamePackage' ].
			spec
				group: 'Deployment' with: #('GamePackage');
				group: 'Development' with: #('TestGamePackage');
				group: 'default' with: #('Development') ]