Class {
	#name : 'Sg113Bloque3View',
	#superclass : 'SgBaseView',
	#instVars : [
		'modelo'
	],
	#category : 'Signo-Web-Views',
	#package : 'Signo-Web',
	#tag : 'Views'
}

{ #category : 'initialization' }
Sg113Bloque3View >> initialize [ 

	super initialize.
	modelo := Sg113ModelBloque3 new
]

{ #category : 'accessing' }
Sg113Bloque3View >> model [

	^ modelo
]

{ #category : 'accessing' }
Sg113Bloque3View >> modelo [

	^ modelo
]

{ #category : 'rendering' }
Sg113Bloque3View >> renderBloqueLiquidacionOn: html [

	self focusId ifNotEmpty: [
		html document addLoadScript:
			(html jQuery id: self focusId) triggerSelect ].

	self renderDenominacionOn: html.
	self renderPorcetajeTitularidadOn: html.
	self renderValorMercadoOn: html.
	self renderValorAdquisicionOn: html.
	self renderGananciaPatrimonialOn: html.
	self renderTotalGananciasPatrimoniales: html
]

{ #category : 'rendering' }
Sg113Bloque3View >> renderContentOn: html [

	html div with: [
		html heading
			level: 4;
			with: self tituloBloque.
		html div
			class: 'row';
			with: [
				html div
					class: 'column column-40';
					with: ''.
				html div
					class: 'column column-30';
					with: 'Entidad emisora 1'.
				html div
					class: 'column column-30';
					with: 'Entidad emisora 2' ].
		html fieldSet
			id: 'datos-liquidacion';
			with: [
				self renderBloqueLiquidacionOn: html
				 ] ]
]

{ #category : 'rendering' }
Sg113Bloque3View >> renderDenominacionOn: html [

	html div
		class: 'row';
		with: [
			html div
				class: 'column column-40';
				with: 'Denominación de los valores (entidad emisora)'.
			html div
				class: 'column column-30';
				with: [ html textInput ].
			html div
				class: 'column column-30';
				with: [ html textInput ] ]
]

{ #category : 'rendering' }
Sg113Bloque3View >> renderGananciaPatrimonialOn: html [

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
						id: 'ganancia-patrimonial-1';
						min: '-999999999999999,99';
						max: '999999999999999,99';
						step: 0.01;
						value: (ConversorImp print: self modelo gananciaPatrimonial1) ].
			html div
				class: 'column column-30';
				with: [
					html numberInput disabled
						id: 'ganancia-patrimonial-2';
						min: '-999999999999999,99';
						max: '999999999999999,99';
						step: 0.01;
						value: (ConversorImp print: self modelo gananciaPatrimonial2) ] ]
]

{ #category : 'rendering' }
Sg113Bloque3View >> renderPorcetajeTitularidadOn: html [

	html div
		class: 'row';
		with: [
			html div
				class: 'column column-40';
				with: 'Porcentaje titularidad'.
			html div
				class: 'column column-30';
				with: [
					html numberInput
						id: 'porcentaje-titularidad-1';
						min: '0,00';
						max: '100,00';
						step: 0.01;
						value: self modelo porcentajeTitularidad1;
						onChange: (html jQuery ajax
								 callback: [ :value |
									 self setFocusId: 'valor-mercado-1'.
									 self modelo setPorcentajeTitularidad1:
											 (value asNumber asScaledDecimal: 2) ]
								 value: html jQuery this value;
								 script: [ :s |
									 s << (s jQuery id: 'datos-liquidacion') load html: [ :r |
											 self renderBloqueLiquidacionOn: r ] ]) ].
			html div
				class: 'column column-30';
				with: [
					html numberInput
					id: 'porcentaje-titularidad-2';
						min: '0,00';
						max: '100,00';
						step: 0.01;
						value: self modelo porcentajeTitularidad2;
						onChange: (html jQuery ajax
								 callback: [ :value |
									 self setFocusId: 'valor-mercado-2'.
									 self modelo setPorcentajeTitularidad2:
											 (value asNumber asScaledDecimal: 2) ]
								 value: html jQuery this value;
								 script: [ :s |
									 s << (s jQuery id: 'datos-liquidacion') load html: [ :r |
											 self renderBloqueLiquidacionOn: r ] ]) ] ]
]

{ #category : 'rendering' }
Sg113Bloque3View >> renderTotalGananciasPatrimoniales: html [

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
						disabled
						style: 'text-align: right';
						min: '0,00';
						max: '999999999999999,99';
						step: 0.01;
						value: (ConversorImp print: self modelo gananciaPatrimonial) ] ]
]

{ #category : 'rendering' }
Sg113Bloque3View >> renderValorAdquisicionOn: html [

	html div
		class: 'row';
		with: [
			html div
				class: 'column column-40';
				with: 'Valor de adquisición de los valores'.
			html div
				class: 'column column-30';
				with: [
					html numberInput
						id: 'valor-adquisicion-1';
						min: '0,00';
						max: '999999999999999,99';
						step: 0.01;
						value: self modelo valorAdquisicion1;
						onChange: (html jQuery ajax
								 callback: [ :value |
									self setFocusId: 'porcentaje-titularidad-2'.
									 self modelo setValorAdquisicion1:
											 (value asNumber asScaledDecimal: 2) ]
								 value: html jQuery this value;
								 script: [ :s |
									 s << (s jQuery id: 'datos-liquidacion') load html: [
											 :renderer | self renderBloqueLiquidacionOn: renderer ] ]) ].
			html div
				class: 'column column-30';
				with: [
					html numberInput
						id: 'valor-adquisicion-2';
						min: '0,00';
						max: '999999999999999,99';
						step: 0.01;
						value: self modelo valorAdquisicion2;
						onChange: (html jQuery ajax
								 callback: [ :value |
									 self modelo setValorAdquisicion2:
											 (value asNumber asScaledDecimal: 2) ]
								 value: html jQuery this value;
								 script: [ :s |
									 s << (s jQuery id: 'datos-liquidacion') load html: [
											 :renderer | self renderBloqueLiquidacionOn: renderer ] ]) ] ]
]

{ #category : 'rendering' }
Sg113Bloque3View >> renderValorMercadoOn: html [

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
						id: 'valor-mercado-1';
						min: '0,00';
						max: '999999999999999,99';
						step: 0.01;
						value: self modelo valorMercado1;
						onChange: (html jQuery ajax
								 callback: [ :value |
									 self setFocusId: 'valor-adquisicion-1'.
									 self modelo setValorMercado1:
											 (value asNumber asScaledDecimal: 2) ]
								 value: html jQuery this value;
								 script: [ :s |
									 s << (s jQuery id: 'datos-liquidacion') load html: [ :r |
											 self renderBloqueLiquidacionOn: r ] ]) ].
			html div
				class: 'column column-30';
				with: [
					html numberInput
						id: 'valor-mercado-2';
						min: '0,00';
						max: '999999999999999,99';
						step: 0.01;
						value: self modelo valorMercado2;
						onChange: (html jQuery ajax
								 callback: [ :value |
									self setFocusId: 'valor-adquisicion-2'.
									 self modelo setValorMercado2:
											 (value asNumber asScaledDecimal: 2) ]
								 value: html jQuery this value;
								 script: [ :s |
									 s << (s jQuery id: 'datos-liquidacion') load html: [ :r |
											 self renderBloqueLiquidacionOn: r ] ]) ] ]
]

{ #category : 'as yet unclassified' }
Sg113Bloque3View >> tituloBloque [

	^ '3. Comunicación de la opción por las especialidades previstas en el apartado 6 del artículo 95 bis de la Ley del Impuesto sobre la Renta de las Personas Fisicas'
]
