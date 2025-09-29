Class {
	#name : 'Sg117RootView',
	#superclass : 'SgBaseView',
	#instVars : [
		'children'
	],
	#category : 'Signo-Web-Views',
	#package : 'Signo-Web',
	#tag : 'Views'
}

{ #category : 'class initialization' }
Sg117RootView class >> initialize [

	WAAdmin register: self asApplicationAt: 'signo/m117'
]

{ #category : 'initialization' }
Sg117RootView >> initialize [

	super initialize.
	children := OrderedCollection
		            with: (SgIdentificacion new addDecoration:
				             (WAMessageDecoration new message: 'Declarante (1)'))
		            with: ((SgDevengo new
				             periodosValidos:
				             SgMPeriodo mensuales , SgMPeriodo trimestrales)
				             addDecoration:
				             (WAMessageDecoration new message: 'Devengo (2)'))
]

{ #category : 'rendering' }
Sg117RootView >> renderContentOn: html [

	html form: [
		html render: (SgModelHeaderView new
				 setTitle:
					 #( 'Impuesto sobre la renta de personas físicas. Impuesto sobre sociedades e impuesto sobre la renta de no residentes. Retenciones e ingresos a cuenta' );
				 setSubtitle:
					 #( 'Rentas o ganancias patrimoniales obtenidas como consecuencia de las transmisiones o reembolsos de acciones y participaciones representativas del capital o del patrimonio de las instituciones de inversión colectiva y de las transmisiones de derechos de subscripción' );
				 setModel: '117').
		children ifNotNil: [ 
			children do: [ :each | html render: each ]
			 ] ]
]
