Class {
	#name : #Sg113RootView,
	#superclass : #SgBaseView,
	#instVars : [
		'children'
	],
	#category : #'Signo-Web-Views'
}

{ #category : #'class initialization' }
Sg113RootView class >> initialize [ 

	WAAdmin register:  self asApplicationAt: 'signo/m113'
]

{ #category : #'as yet unclassified' }
Sg113RootView >> doSubmit [

	(children at: 1) model inspect.
	(children at: 2) model inspect.
	
]

{ #category : #initialization }
Sg113RootView >> initialize [

	super initialize.
	cssProvider := #semantic.
	children := OrderedCollection with: Sg113Bloque3View new with: Sg113Bloque4View new
]

{ #category : #rendering }
Sg113RootView >> renderContentOn: html [

	html form: [
		html render: (SgModelHeaderView new
				 setTitle:
					 #( 'Comunicación de datos relativos a las ganancias patrimoniales por cambio de residencia cuando se produzca a otro Estado Miembro de la Unión Europea o del Espacio Económmico Europeo con efectivo intercambio de información tributaria'
					    'Artículo 95 bis de la ley de IRPF' );
				 setModel: '113').
		html render: (children at: 1).
		html render: (children at: 2).
		html div
			style: 'text-align: right';
			with: [
				html submitButton
					callback: [ self doSubmit ];
					value: 'Enviar' ] ]
]

{ #category : #updating }
Sg113RootView >> updateRoot: aHtmlRoot [

	super updateRoot: aHtmlRoot.
	aHtmlRoot javascript url: '/static-files/js/m113/custom.js'
]
