Class {
	#name : 'SgIdentificacionSettings',
	#superclass : 'SgBaseSettings',
	#classInstVars : [
		'apellidosSeparados',
		'titulo',
		'informacionContacto',
		'domicilioExtranjero',
		'domicilioTerritorioEspañol'
	],
	#category : 'Signo-Web-Settings',
	#package : 'Signo-Web',
	#tag : 'Settings'
}

{ #category : 'as yet unclassified' }
SgIdentificacionSettings class >> apellidosSeparados [ 

	^ apellidosSeparados ifNil: [ apellidosSeparados := false ]
]

{ #category : 'as yet unclassified' }
SgIdentificacionSettings class >> apellidosSeparados: aBoolean [

	apellidosSeparados := aBoolean
]

{ #category : 'accessing' }
SgIdentificacionSettings class >> domicilioExtranjero [

	^ domicilioExtranjero ifNil: [ domicilioExtranjero := false ]
]

{ #category : 'accessing' }
SgIdentificacionSettings class >> domicilioExtranjero: aBoolean [

	domicilioExtranjero := aBoolean
]

{ #category : 'accessing' }
SgIdentificacionSettings class >> domicilioTerritorioEspañol [

	^ domicilioTerritorioEspañol ifNil: [ domicilioTerritorioEspañol := true ]
]

{ #category : 'accessing' }
SgIdentificacionSettings class >> domicilioTerritorioEspañol: aBoolean [

	domicilioTerritorioEspañol := aBoolean
]

{ #category : 'accessing' }
SgIdentificacionSettings class >> informacionContacto [

	^ informacionContacto ifNil: [ informacionContacto := false ]
]

{ #category : 'accessing' }
SgIdentificacionSettings class >> informacionContacto: aBoolean [

	informacionContacto := aBoolean
]

{ #category : 'as yet unclassified' }
SgIdentificacionSettings class >> settingsOn: aBuilder at: aParent [

	(aBuilder setting: #apellidosSeparados)
		label: '¿Recoger los apellidos en campos separados?';
		description:
			'Marque esta opción si el modelo recoge el primer u segundo apellidos en campos separados.';
		parent: aParent;
		target: self.
	(aBuilder setting: #titulo)
		label: 'Titulo del componente';
		description:
			'Introduzca el título que aparecerá en la cabecera de la vista';
		parent: aParent;
		target: self.
	(aBuilder setting: #informacionContacto)
		label: '¿Recoger información de la persona de contacto?';
		description:
			'Marque esta opción si el modelo debe recoger el teléfono y nombre de la persona de contacto';
		parent: aParent;
		target: self.
	
]

{ #category : 'accessing' }
SgIdentificacionSettings class >> titulo [

	^ titulo ifNil: [ titulo := 'Identificación' ]
]

{ #category : 'accessing' }
SgIdentificacionSettings class >> titulo: aString [

	titulo := aString
]
