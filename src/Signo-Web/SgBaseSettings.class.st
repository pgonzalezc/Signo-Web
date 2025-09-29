Class {
	#name : 'SgBaseSettings',
	#superclass : 'Object',
	#classVars : [
		'Settings'
	],
	#category : 'Signo-Web-Views',
	#package : 'Signo-Web',
	#tag : 'Views'
}

{ #category : 'as yet unclassified' }
SgBaseSettings class >> baseSettingsOn: aBuilder [

	<systemsettings>
	(aBuilder group: #modelosTributarios)
		label: 'Modelos tributarios' translated;
		description:
			'Definición de los atributos configurables de los modelos'
]
