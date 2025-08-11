Class {
	#name : #Sg309IdentificacionSettings,
	#superclass : #SgIdentificacionSettings,
	#category : #'Signo-Web-Views'
}

{ #category : #'as yet unclassified' }
Sg309IdentificacionSettings class >> identificacionSettingsOn: aBuilder [

	(aBuilder group: #m309Identificacion)
				label: 'Identificación';
				description:
					'Sección para la configuración de la vista de Identificación';
				parent: #m309
]
