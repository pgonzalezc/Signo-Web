Class {
	#name : #Sg319Liquidacion3,
	#superclass : #SgBaseView,
	#instVars : [
		'p01',
		'p02',
		'p03',
		'p04'
	],
	#category : #'Signo-Web-Views'
}

{ #category : #initialization }
Sg319Liquidacion3 >> initialize [ 

	super initialize.
	p01 := 0.00 asScaledDecimal: 2.
	p02 := 0.00 asScaledDecimal: 2.
	p03 := 1.34 asScaledDecimal: 2.
	p04 := 0.00 asScaledDecimal: 2
]

{ #category : #rendering }
Sg319Liquidacion3 >> renderCabecerasProductosOn: html [

	html div class: 'row'; with: [ 
		html div class: 'column'.
		html div class: 'column'; with: [ html label: 'Tipo de producto' ].
		html div class: 'column'; with: [ html label: 'Volumen (Litros a temperatura de 15º C)' ].
		html div class: 'column'; with: [ html label: 'Precio/litro' ].
		html div class: 'column'; with: [ html label: 'Cuota IVA operación asimilada a la importación' ]
		 ]
]

{ #category : #rendering }
Sg319Liquidacion3 >> renderContentOn: html [

	html div
		class: 'row';
		with: [
			html div
				class: 'column';
				with: [
					html label
						for: 'CAE';
						with: 'Deposito fiscal (C.A.E.)'.
					html textInput id: 'CAE' ].
			html div
				class: 'column';
				with: [
					html label
						for: 'NEX';
						with: 'Número de extraccion'.
					html textInput id: 'NEX' ] ].
			self renderProductosOn: html
]

{ #category : #rendering }
Sg319Liquidacion3 >> renderProductosOn: html [

	self renderCabecerasProductosOn: html.
	html div
		class: 'row';
		with: [
			html div class: 'column'; with: [ html label: 'Producto 1' ].
			html div class: 'column'; with: [ html textInput id: 'p01'; placeholder: '[01]'; style: 'text-align: right'; value: p01 ].
			html div class: 'column'; with: [ html textInput id: 'p02'; placeholder: '[02]'; style: 'text-align: right'; value: p02 ].
			html div class: 'column'; with: [ html textInput id: 'p03'; placeholder: '[03]'; style: 'text-align: right'; value: p03 ].
			html div class: 'column'; with: [ html textInput id: 'p04'; placeholder: '[04]'; style: 'text-align: right'; value: p04 ].
		]
]
