Class {
	#name : #Sg319Settings,
	#superclass : #SgBaseSettings,
	#category : #'Signo-Web-Views'
}

{ #category : #'as yet unclassified' }
Sg319Settings class >> m319SettingsOn: aBuilder [

	<systemsettings>
	(aBuilder group: #modelo319)
		label: 'Modelo 319' translated;
		description:
			'Configuración del impuesto del valor añadido correspondiente a la entraga de gasolinas, gasóleos...';
		parent: #modelos
]
