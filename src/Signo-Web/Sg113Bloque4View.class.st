Class {
	#name : 'Sg113Bloque4View',
	#superclass : 'SgBaseView',
	#instVars : [
		'modelo'
	],
	#category : 'Signo-Web-Views',
	#package : 'Signo-Web',
	#tag : 'Views'
}

{ #category : 'initialization' }
Sg113Bloque4View >> initialize [ 

	super initialize.
	modelo := Sg113ModelBloque4 new
]

{ #category : 'accessing' }
Sg113Bloque4View >> model [ 

	^ modelo
]

{ #category : 'rendering' }
Sg113Bloque4View >> renderCheckBoxAOn: html [

	html html:
		'a) <strong>COMUNICO</strong> el cambio de Estado de residencia'.
	html space.
	html strong
		class: 'box';
		id: 'p019';
		with: '019'.
	html space.
	html checkbox
		id: 'check-box-a';
		callback: [ :value |
			self model setOpcionA: value ];
		value: self model opcionA.
	html break
]

{ #category : 'rendering' }
Sg113Bloque4View >> renderCheckBoxBOn: html [

	html html: 'b) <strong>COMUNICO</strong> el cambio de domicilio'.
	html space.
	html strong
		class: 'box';
		id: 'p020';
		with: '020'.
	html space.
	html checkbox
		id: 'check-box-b';
		callback: [ :value | self model setOpcionB: value ];
		value: self model opcionB.
	html break
]

{ #category : 'rendering' }
Sg113Bloque4View >> renderCheckBoxCOn: html [

	html html:
		'c) <strong>COMUNICO</strong> la transmisión intervivos de los siguientes valores'.
	html space.
	html strong
		class: 'box';
		id: 'p021';
		with: '021'.
	html space.
	html checkbox
		id: 'check-box-c';
		callback: [ :value | self model setOpcionC: value ];
		value: self model opcionC.
	html break
]

{ #category : 'rendering' }
Sg113Bloque4View >> renderCheckBoxesOn: html [

	self renderCheckBoxAOn: html.
	self renderCheckBoxBOn: html.
	self renderCheckBoxCOn: html
]

{ #category : 'rendering' }
Sg113Bloque4View >> renderContentOn: html [

	html document addLoadScript: (JSStream on: 'main()').
	html div with: [
		html heading
			level: 4;
			with: self tituloBloque.
		self renderCheckBoxesOn: html.
		self renderLiquidacionOn: html ]
]

{ #category : 'rendering' }
Sg113Bloque4View >> renderDenominacionOn: html [

	html div
		class: 'row';
		with: [
			html div
				class: 'column column-40';
				with: 'Denominación de los valores (entidad emisora)'.
			html div
				class: 'column column-30';
				with: [ html textInput id: '4-denominacion-1'; callback: [ :value | self model setDenominacion1: value ]; value: self model denominacion1].
			html div
				class: 'column column-30';
				with: [ html textInput id: '4-denominacion-2'; callback: [ :value | self model setDenominacion2: value ]; value: self model denominacion2 ] ]
]

{ #category : 'rendering' }
Sg113Bloque4View >> renderGananciaPatrimonialOn: html [

	html div
		class: 'row';
		with: [
			html div
				class: 'column column-40';
				with: 'Ganancia patrimonial'.
			html div
				class: 'column column-30';
				with: [
					html numberInput disabled
						id: '4-ganancia-patrimonial-1';
						step: '0.01';
						min: '0.00';
						max: '999999999999999.99';
						value: self model gananciaPatrimonial1 ].
			html div
				class: 'column column-30';
				with: [
					html numberInput disabled
						id: '4-ganancia-patrimonial-2';
						step: '0.01';
						min: '0.00';
						max: '999999999999999.99';
						value: self model gananciaPatrimonial2 ] ]
]

{ #category : 'rendering' }
Sg113Bloque4View >> renderHeadersOn: html [

	html div class: 'row';
		with: [ 
			html div class: 'column column-40'; with: ''.
			html div class: 'column column-30'; with: 'Entidad emisora 1'.
			html div class: 'column column-30'; with: 'Entidad emisora 2'
			 ]
]

{ #category : 'rendering' }
Sg113Bloque4View >> renderLiquidacionOn: html [

	self renderHeadersOn: html.
	self renderDenominacionOn: html.
	self renderPorcentajeTitularidadOn: html.
	self renderValorMercadoOn: html.
	self renderValorTransmisionOn: html.
	self renderValorAdquisionOn: html.
	self renderGananciaPatrimonialOn: html.
	self renderTotalGanaciasPatrimoniales: html
]

{ #category : 'rendering' }
Sg113Bloque4View >> renderPorcentajeTitularidadOn: html [

	html div
		class: 'row';
		with: [
			html div
				class: 'column column-40';
				with: 'Porcentaje de titularidad'.
			html div
				class: 'column column-30';
				with: [
					html numberInput
						id: '4-porcentaje-titularidad-1';
						step: '0.01';
						min: '0.00';
						max: '999999999999999.99';
						value: self model porcentajeTitularidad1 ].
			html div
				class: 'column column-2';
				with: [
					html numberInput
						id: '4-porcentaje-titularidad-2';
						step: '0.01';
						min: '0.00';
						max: '999999999999999.99';
						value: self model porcentajeTitularidad2 ] ]
]

{ #category : 'rendering' }
Sg113Bloque4View >> renderTotalGanaciasPatrimoniales: html [

	html div
		class: 'row';
		with: [
			html div
				class: 'column column-40';
				with: 'Total ganancias patrimoniales'.
			html div
				class: 'column column-30';
				with: ''.
			html div
				class: 'column column-30';
				with: [
					html numberInput
						disabled;
						id: '4-total-ganancia-patrimonial';
						value: self model totalGananciasPatrimoniales ] ]
]

{ #category : 'rendering' }
Sg113Bloque4View >> renderValorAdquisionOn: html [

	html div
		class: 'row';
		with: [
			html div
				class: 'column column-40';
				with: 'Valor de adquisión de los valores'.
			html div
				class: 'column column-30';
				with: [
					html numberInput
						id: '4-valor-adquisicion-1';
						step: '0.01';
						min: '0.00';
						max: '999999999999999.99';
						callback: [ :value |
							self model setValorAdquisicion1:
									(value asNumber asScaledDecimal: 2) ];
						value: self model valorAdquisicion1 ].
			html div
				class: 'column column-30';
				with: [
					html numberInput
						id: '4-valor-adquisicion-2';
						step: '0.01';
						min: '0.00';
						max: '999999999999999.99';
						callback: [ :value |
							self model setValorAdquisicion2:
									(value asNumber asScaledDecimal: 2) ];
						value: self model valorAdquisicion2 ] ]
]

{ #category : 'rendering' }
Sg113Bloque4View >> renderValorMercadoOn: html [

	html div
		class: 'row';
		with: [
			html div
				class: 'column column-40';
				with: 'Valor de mercado de los valores (art. 95 bis 3)'.
			html div
				class: 'column column-30';
				with: [
					html numberInput
						id: '4-valor-mercado-1';
						step: '0.01';
						min: '0.00';
						max: '999999999999999.99';
						callback: [ :value |
							self model setValorMercado1:
									(value asNumber asScaledDecimal: 2) ];
						value: self model valorMercado1 ].
			html div
				class: 'column column-30';
				with: [
					html numberInput
						id: '4-valor-mercado-2';
						step: '0.01';
						min: '0.00';
						max: '999999999999999.99';
						callback: [ :value |
					self model setValorMercado2: (value asNumber asScaledDecimal: 2) ];
				value: self model valorMercado2]
				 ]
]

{ #category : 'rendering' }
Sg113Bloque4View >> renderValorTransmisionOn: html [

	html div
		class: 'row';
		with: [
			html div
				class: 'column column-40';
				with: 'Valor de transmisión de los valores (art. 95 bis 6.b)'.
			html div
				class: 'column column-30';
				with: [
					html numberInput
						id: '4-valor-transmision-1';
						step: '0.01';
						min: '0.00';
						max: '999999999999999.99';
						callback: [ :value |
							self model setValorTransmision1:
									(value asNumber asScaledDecimal: 2) ];
						value: self model valorTransmision1 ].
			html div
				class: 'column column-30';
				with: [
					html numberInput
						id: '4-valor-transmision-2';
						step: '0.01';
						min: '0.00';
						max: '999999999999999.99';
						callback: [ :value |
							self model setValorTransmision2:
									(value asNumber asScaledDecimal: 2) ];
						value: self model valorTransmision2 ] ]
]

{ #category : 'as yet unclassified' }
Sg113Bloque4View >> tituloBloque [ 

	^ '4. Comunicación de variación de circustancias.'
]
