Class {
	#name : 'Sg319IdentificacionSettings',
	#superclass : 'SgIdentificacionSettings',
	#category : 'Signo-Web-Settings',
	#package : 'Signo-Web',
	#tag : 'Settings'
}

{ #category : 'as yet unclassified' }
Sg319IdentificacionSettings class >> identificacionSettingsOn: aBuilder [

	<systemsettings>
	(aBuilder group: #m319)
		label: 'Modelo 319';
		description: 'Valores de configuración del modelo 319';
		parent: #modelos;
		noOrdering;
	with: [ 	(aBuilder group: #m319Identificacion)
				label: 'Identificación';
				description:
					'Sección para la configuración de la vista de Identificación';
				parent: #m319 ].
	self
		settingsOn: aBuilder
		at: #m319Identificacion
]
