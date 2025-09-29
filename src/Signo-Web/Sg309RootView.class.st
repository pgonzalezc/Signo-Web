Class {
	#name : 'Sg309RootView',
	#superclass : 'SgBaseView',
	#instVars : [
		'modelo',
		'embedded'
	],
	#category : 'Signo-Web-Views',
	#package : 'Signo-Web',
	#tag : 'Views'
}

{ #category : 'testing' }
Sg309RootView class >> canBeRoot [ 

	^ true
]

{ #category : 'as yet unclassified' }
Sg309RootView class >> identificacionSettingsOn: aBuilder [

	<systemsettings>
	(aBuilder group: #m309)
		label: 'Modelo 309';
		description: 'Valores de configuración del modelo 309';
		parent: #modelosTributarios;
		noOrdering;
	with: [ 	(aBuilder group: #m309Identificacion)
				label: 'Identificación';
				description:
					'Sección para la configuración de la vista de Identificación';
				parent: #m309 ].
	Sg309IdentificacionSettings
		settingsOn: aBuilder
		at: #m309Identificacion
]

{ #category : 'class initialization' }
Sg309RootView class >> initialize [ 
	
	<script>
	WAAdmin register:  self asApplicationAt: 'signo/m309' 
]

{ #category : 'hooks' }
Sg309RootView >> children [

	^ embedded
]

{ #category : 'as yet unclassified' }
Sg309RootView >> doEnviar [

	TinyLogger record: 'Modelo 309 - Pulsado el botón enviar'.
	embedded do: [ :each | Transcript show: each value model; cr ]
]

{ #category : 'initialization' }
Sg309RootView >> initialize [

	super initialize.
	embedded := OrderedCollection
		            with:
			            ((SgIdentificacion new settings:
					              Sg309IdentificacionSettings)
				             addDecoration:
					             (WAMessageDecoration new message: Sg309IdentificacionSettings titulo);
				             yourself)
		            with: ((SgDevengo new periodosValidos:
					              SgMPeriodo anual , SgMPeriodo trimestrales)
				             addDecoration:
					             (WAMessageDecoration new message: 'Devengo');
				             yourself)
]

{ #category : 'rendering' }
Sg309RootView >> renderContentOn: html [

	self renderHeaderOn: html.
	html form: [ 
		embedded do:  [ :each | html render: each ].
		html div id: #botonera; style: 'text-align: right'; with: [ 
			html button 
				callback: [ self doEnviar ];
				value: 'Enviar'
		 ] ]
]

{ #category : 'rendering' }
Sg309RootView >> renderHeaderOn: html [

	html heading level: 2; with: 'Modelo 309'.
]
