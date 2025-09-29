Class {
	#name : 'SgInfoContactoView',
	#superclass : 'SgBaseView',
	#instVars : [
		'infoContacto',
		'settings'
	],
	#category : 'Signo-Web-Views',
	#package : 'Signo-Web',
	#tag : 'Views'
}

{ #category : 'accessing' }
SgInfoContactoView >> infoContacto [

	^ infoContacto ifNil: [ infoContacto := SgMInfoContacto new ]
]

{ #category : 'accessing' }
SgInfoContactoView >> model [

	^ infoContacto 
]

{ #category : 'rendering' }
SgInfoContactoView >> renderContentOn: html [

	html div class: 'container'; with: [ 
		self renderFieldTelefonoOn: html.
		self renderFieldApellidosYNombreOn: html
	 ]
]

{ #category : 'rendering' }
SgInfoContactoView >> renderFieldApellidosYNombreOn: html [

	html label
			for: 'field-personaContacto';
			with: 'Persona de contacto'.
		html textInput
			id: 'field-personaContacto';
			name: 'field-personaContacto';
			maxLength: 75;
			value: self infoContacto personaContacto ;
			callback: [ :value | infoContacto personaContacto: value ] 
]

{ #category : 'rendering' }
SgInfoContactoView >> renderFieldTelefonoOn: html [

	html label
			for: 'field-telefono';
			with: 'Teléfono'.
		html textInput
			id: 'field-telefono';
			name: 'field-telefono';
			maxLength: 75;
			value: self infoContacto telefono;
			callback: [ :value | infoContacto telefono: value ] 
]
