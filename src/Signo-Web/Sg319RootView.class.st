Class {
	#name : 'Sg319RootView',
	#superclass : 'SgBaseView',
	#instVars : [
		'modelo',
		'children'
	],
	#category : 'Signo-Web-Views',
	#package : 'Signo-Web',
	#tag : 'Views'
}

{ #category : 'testing' }
Sg319RootView class >> canBeRoot [ 

	^ true
]

{ #category : 'class initialization' }
Sg319RootView class >> initialize [ 

	WAAdmin register:  self asApplicationAt: '/signo/m319'
]

{ #category : 'as yet unclassified' }
Sg319RootView >> doSubmit [ 

	| resp |
	self hayErrores 
		ifTrue: [ 
			resp := self call: (WAYesOrNoDialog new)
		 ]
		ifFalse: [ 
			children do: [ :c |
				Transcript show: c decoratedComponent model asString; cr ]
			]
]

{ #category : 'initialization' }
Sg319RootView >> initialize [

	"Inicializamos los elementos padre"
	super initialize.
	children := OrderedCollection
		            with: (SgIdentificacion new addDecoration:
				             (WAMessageDecoration new message:
					              'Identificacion (1)'))
		            with: ((SgDevengo new periodosValidos:
				              SgMPeriodo mensuales , SgMPeriodo trimestrales)
				             addDecoration:
				             (WAMessageDecoration new message: 'Devengo (2)'))
		            with: (Sg319Liquidacion3 new addDecoration:
				             (WAMessageDecoration new message: 'Liquidacion (3)'))
]

{ #category : 'rendering' }
Sg319RootView >> renderContentOn: html [

	html form: [
		html render: (SgModelHeaderView new
				 setTitle: {
						 self title.
						 self subtitle };
				 setModel: '319').
		html div id: 'areaErrores'.
		children do: [ :each | html render: each ].
		
		html div style: 'text-align: right'; with: [ 
			html button callback: [ self doSubmit ]; value: 'Enviar'
			 ] ]
]

{ #category : 'as yet unclassified' }
Sg319RootView >> subtitle [

	^ 'Pago a cuenta del IVA correspondiente a las entregas de gasolinas, gasóleos y biocarburantes posteriores a la ultimación del régimen de depósito distinto del aduanero'
]

{ #category : 'accessing' }
Sg319RootView >> title [

	^ 'Inpuesto sobre el Valor Añadido'
]
