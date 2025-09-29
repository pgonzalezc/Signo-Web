Class {
	#name : 'SgBaseSettings',
	#superclass : 'Object',
	#classVars : [
		'Settings'
	],
	#category : 'Signo-Web-Settings',
	#package : 'Signo-Web',
	#tag : 'Settings'
}

{ #category : 'as yet unclassified' }
SgBaseSettings class >> baseSettingsOn: aBuilder [	
	<systemsettings>
	(aBuilder group: #modelos)
		label: 'Modelos tributarios' translated;
		description:
			'Definición de los atributos configurables de los modelos'
]
