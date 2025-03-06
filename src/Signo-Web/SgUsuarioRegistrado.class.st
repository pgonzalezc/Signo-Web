Class {
	#name : #SgUsuarioRegistrado,
	#superclass : #Object,
	#instVars : [
		'userId',
		'email',
		'apellidos',
		'nombre',
		'password',
		'fechaBaja'
	],
	#category : #'Signo-Web-DBs'
}

{ #category : #accessing }
SgUsuarioRegistrado >> apellidos [

	^ apellidos
]

{ #category : #accessing }
SgUsuarioRegistrado >> email [

	^ email
]

{ #category : #accessing }
SgUsuarioRegistrado >> fechaBaja [

	^ fechaBaja
]

{ #category : #accessing }
SgUsuarioRegistrado >> nombre [

	^ nombre
]

{ #category : #accessing }
SgUsuarioRegistrado >> password [

	^ password
]

{ #category : #initialization }
SgUsuarioRegistrado >> setApellidos: aString [

	apellidos := aString
]

{ #category : #initialization }
SgUsuarioRegistrado >> setEmail: aEmailString [

	email := WAEmailAddress new address: aEmailString
]

{ #category : #initialization }
SgUsuarioRegistrado >> setFechaBaja: aTimestamp [

	fechaBaja := aTimestamp
]

{ #category : #initialization }
SgUsuarioRegistrado >> setNombre: aString [

	nombre := aString
]

{ #category : #initialization }
SgUsuarioRegistrado >> setPassword: aString [

	password := aString
]

{ #category : #initialization }
SgUsuarioRegistrado >> setUserId: aInteger [

	userId := aInteger
]

{ #category : #accessing }
SgUsuarioRegistrado >> userId [

	^ userId
]
