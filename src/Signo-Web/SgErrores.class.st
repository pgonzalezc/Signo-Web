Class {
	#name : #SgErrores,
	#superclass : #Object,
	#classVars : [
		'Errores'
	],
	#category : #'Signo-Web-Views'
}

{ #category : #'error handling' }
SgErrores class >> atCode: anInteger [

	^ Errores at: anInteger ifAbsent: (SgError message:
			   ('Código de error {1} no definido' format: { anInteger }))
]

{ #category : #'error handling' }
SgErrores class >> atCode: anInteger withText: anArray [

	| err |
	err := Errores at: anInteger ifAbsent: (SgError message:
			   ('Código de error {1} no definido' format: { anInteger })).
	^ err copy withText: anArray
]

{ #category : #'error handling' }
SgErrores class >> error100 [

	^ self atCode: 100

	
	
]

{ #category : #'error handling' }
SgErrores class >> error101 [

	^ self atCode: 101
]

{ #category : #'error handling' }
SgErrores class >> error102 [

	^ self atCode: 102
]

{ #category : #'class initialization' }
SgErrores class >> initialize [

	<script>
	Errores := Dictionary new.
	Errores at: 100 put: (SgError
			 message: 'Las contraseñas introducidas no coinciden'
			 widgetId: 'input-password').
	Errores at: 101 put: (SgError
			 message: 'Apellidos no informado. Debe introducir sus apellidos'
			 widgetId: 'input-apellidos').
	Errores at: 102 put: (SgError
			 message:
			 'Correo electrónico no informado. Debe introducir su correo electŕnico'
			 widgetId: 'input-email').
	Errores at: 103 put: (SgError
			 message: 'Nombre no informado. Debe introducir su nombre'
			 widgetId: 'input-nombre').
	Errores at: 104 put: (SgError
			 message: 'Contraseña no informada. Debe introducir su contraseña'
			 widgetId: 'input-password').
	Errores at: 105 put: (SgError
			 message:
			 'Repeticion de contraseña no informada. Debe introducir la repetición de contraseña'
			 widgetId: 'input-passwordbis').
	Errores at: 106 put: (SgError message: 'Importe invalido en la partida [{1}]').
	Errores at: 107 put: (SgError message: 'Precio por litro en partida [{1}] inválido. No puede ser inferiore a 1.70€')
			
]
