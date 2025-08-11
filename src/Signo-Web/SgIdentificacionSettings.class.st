Class {
	#name : #SgIdentificacionSettings,
	#superclass : #SgBaseSettings,
	#classInstVars : [
		'apellidosSeparados',
		'titulo'
	],
	#category : #'Signo-Web-Views'
}

{ #category : #'as yet unclassified' }
SgIdentificacionSettings class >> apellidosSeparados [ 

	^ apellidosSeparados ifNil: [ apellidosSeparados := false ]
]

{ #category : #'as yet unclassified' }
SgIdentificacionSettings class >> apellidosSeparados: aBoolean [

	apellidosSeparados := aBoolean
]

{ #category : #'as yet unclassified' }
SgIdentificacionSettings class >> settingsOn: aBuilder at: aParent [

	(aBuilder setting: #apellidosSeparados)
		label: '¿Recoger los apellidos en campos separados?';
		description:'Marque esta opción si el modelo recoge el primer u segundo apellios en campos separados.';
		parent: aParent;
		target: self.
	(aBuilder setting: #titulo)
		label: 'Titulo del componente';
		description: 'Introduzca el título que aparecerá en la cabecera de la vista';
		parent: aParent;
		target: self
		
]

{ #category : #accessing }
SgIdentificacionSettings class >> titulo [

	^ titulo ifNil: [ titulo := 'Identificación' ]
]

{ #category : #accessing }
SgIdentificacionSettings class >> titulo: aString [

	titulo := aString
]
