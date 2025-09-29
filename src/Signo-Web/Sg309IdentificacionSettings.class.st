Class {
	#name : #Sg309IdentificacionSettings,
	#superclass : #SgIdentificacionSettings,
	#category : #'Signo-Web-Views'
}

{ #category : #'as yet unclassified' }
Sg309IdentificacionSettings class >> m309SettingsOn: aBuilder [

	<systemsettings>
	(aBuilder group: #m309)
		label: 'Modelo 309';
		description: 'Valores de configuración del modelo 309';
		parent: #modelosTributarios;
		noOrdering;
		with: [
			(aBuilder group: #m309Identificacion)
				label: 'Identificación';
				description:
					'Sección para la configuración de la vista de Identificación';
				parent: #m309 ].
	self settingsOn: aBuilder at: #m309Identificacion
]
