Class {
	#name : #Sg113Settings,
	#superclass : #SgBaseSettings,
	#category : #'Signo-Web-Views'
}

{ #category : #'as yet unclassified' }
Sg113Settings class >> m113SettingsOn: aBuilder [

	<systemsettings>
	(aBuilder group: #modelo113 )
		label: 'Modelo 113' translated;
		description:
			'Configuración del impuesto ...';
		parent: #modelos
]
