Class {
	#name : 'Sg113IdentificacionSettings',
	#superclass : 'SgIdentificacionSettings',
	#category : 'Signo-Web-Settings',
	#package : 'Signo-Web',
	#tag : 'Settings'
}

{ #category : 'as yet unclassified' }
Sg113IdentificacionSettings class >> identificacionSettingsOn: aBuilder [

	<systemsettings>
	(aBuilder group: #m113)
		label: 'Modelo 113';
		description: 'Valores de configuración del modelo 113';
		parent: #modelos;
		noOrdering;
		with: [
				(aBuilder group: #m113Identificacion)
					label: 'Identificación';
					description:
						'Sección para la configuración de la vista de Identificación';
					parent: #m113 ].
	(aBuilder setting: #domicilioExtranjero)
		label: 'Domicilio en el país de residencia';
		description:
			'Marque esta opción para recoger los datos del domicilio fuera del territorio Español';
		parent: #m113Identificacion;
		target: self.
	(aBuilder setting: #domicilioTerritorioEspañol)
		label: 'Domicilio en territorio Español';
		description:
			'Marque esta opción para recoger los datos del domicilio dentro del territorio Español';
		parent: #m113Identificacion;
		target: self.
	self settingsOn: aBuilder at: #m113Identificacion
]
