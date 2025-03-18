Class {
	#name : #Sg319Liquidacion3,
	#superclass : #SgBaseView,
	#instVars : [
		'modelo'
	],
	#category : #'Signo-Web-Views'
}

{ #category : #initialization }
Sg319Liquidacion3 >> initialize [ 

	super initialize.
	modelo := Sg319ModelLiquidacion new.
]

{ #category : #accessing }
Sg319Liquidacion3 >> model [ 

	^ modelo
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

	html div class: 'container'; with: [ 
	self renderDepositoFiscalOn: html.
	self renderCabecerasProductosOn: html.
	self renderProductosOn: html ]
]

{ #category : #rendering }
Sg319Liquidacion3 >> renderCuotaTotalOn: html [

	html div id: #cuotaTotal; class: 'row'; with: [ 
		html div class: 'column column-80'; style: 'text-align: right'; with: 'Cuota total de la operación asimilada a la importacion'.
		html div class: 'column'; with: [ html textInput id: 'p25'; readonly: true;  style: 'text-align: right'; value: self model p25 ]
	]
]

{ #category : #rendering }
Sg319Liquidacion3 >> renderDepositoFiscalOn: html [

	html div class: 'row'; with: [
		html div class: 'column'; with: [
			html label for: 'CAE'; with: 'Deposito fiscal (C.A.E.)'.
			html textInput id: 'CAE' ]].
]

{ #category : #rendering }
Sg319Liquidacion3 >> renderProductosOn: html [

	html div id: #liquidacion; with: [ 
		html div id: #producto1; class: 'row'; with: [ self renderRowProducto1On: html ].
		html div id: #producto2; class: 'row'; with: [ self renderRowProducto2On: html ].
		html div id: #producto3; class: 'row'; with: [ self renderRowProducto3On: html ].
		html div id: #producto4; class: 'row'; with: [ self renderRowProducto4On: html ].
		html div id: #producto5; class: 'row'; with: [ self renderRowProducto5On: html ].
		html div id: #producto6; class: 'row'; with: [ self renderRowProducto6On: html ].
		
		self renderCuotaTotalOn: html.
	]

]

{ #category : #rendering }
Sg319Liquidacion3 >> renderRowProducto1On: html [


		html div class: 'column'; with: 'Producto 1' .
		html div class: 'column'; with: [ 
		html textInput class: 'input'; id: 'p01';  value: self model p01;
			onChange: (html jQuery ajax callback: [:value | self model p01: value] value:(html jQuery this) value )
		].
		html div class: 'column'; with: [ 
		html textInput id: 'p02';  style: 'text-align: right'; value: self model p02;
			onChange: (html jQuery ajax callback: [ :value | self model p02: value asNumber ] value: (html jQuery this) value; 
			script: [ :s | 
				s << (s jQuery id: #producto1) html: [ :r | self renderRowProducto1On: r ].
				s << (s jQuery id: #cuotaTotal) html: [ :r | self renderCuotaTotalOn: r].
				s << (s jQuery id: #p03) triggerSelect
				] ) 
			].
		html div class: 'column'; with: [ html textInput id: 'p03';  style: 'text-align: right'; value: self model p03;
			onChange: (html jQuery ajax callback: [ :value | self model p03: value asNumber ] value: (html jQuery this) value; 
			script: [ :s | 
					s << (s jQuery id: #producto1) html: [ :r | self renderRowProducto1On: r ].
					s << (s jQuery id: #cuotaTotal) html: [ :r | self renderCuotaTotalOn: r ].
			]) ].
		html div class: 'column'; with: [ html textInput id: 'p04'; readonly: true;  style: 'text-align: right'; value: self model p04 ]
]

{ #category : #rendering }
Sg319Liquidacion3 >> renderRowProducto2On: html [


		html div class: 'column'; with: 'Producto 2' .
		html div class: 'column'; with: [ 
		html textInput class: 'input'; id: 'p05';  value: self model p05;
			onChange: (html jQuery ajax callback: [:value | self model p05: value] value:(html jQuery this) value )
		].
		html div class: 'column'; with: [ 
		html textInput id: 'p06';  style: 'text-align: right'; value: self model p06;
			onChange: (html jQuery ajax callback: [ :value | self model p06: value asNumber ] value: (html jQuery this) value; 
			script: [ :s | 
				s << (s jQuery id: #producto2) html: [ :r | self renderRowProducto2On: r ].
				s << (s jQuery id: #cuotaTotal) html: [ :r | self renderCuotaTotalOn: r ].
				s << (s jQuery id: #p07) triggerSelect
			]) 
		].
		html div class: 'column'; with: [ html textInput id: 'p07';  style: 'text-align: right'; value: self model p07;
			onChange: (html jQuery ajax callback: [ :value | self model p07: value asNumber ] value: (html jQuery this) value; 
			script: [ :s | 
				s << (s jQuery id: #producto2) html: [ :r | self renderRowProducto2On: r ].
				s << (s jQuery id: #cuotaTotal) html: [ :r | self renderCuotaTotalOn: r ].
			]) 
		].
		html div class: 'column'; with: [ html textInput id: 'p08'; readonly: true;  style: 'text-align: right'; value: self model p08 ]

]

{ #category : #rendering }
Sg319Liquidacion3 >> renderRowProducto3On: html [

		html div class: 'column'; with: 'Producto 3' .
		html div class: 'column'; with: [ 
		html textInput class: 'input'; id: #p09;  value: self model p09;
			onChange: (html jQuery ajax callback: [:value | self model p09: value] value:(html jQuery this) value )
		].
		html div class: 'column'; with: [ 
		html textInput id: 'p10';  style: 'text-align: right'; value: self model p10;
			onChange: (html jQuery ajax callback: [ :value | self model p10: value asNumber ] value: (html jQuery this) value; 
			script: [ :s | 
				s << (s jQuery id: #producto3) html: [ :r | self renderRowProducto3On: r ].
				s << (s jQuery id: #cuotaTotal) html: [ :r | self renderCuotaTotalOn: r ].
				s << (s jQuery id: #p11) triggerSelect
			]) 
		].
		html div class: 'column'; with: [ html textInput id: 'p11';  style: 'text-align: right'; value: self model p11;
			onChange: (html jQuery ajax callback: [ :value | self model p11: value asNumber ] value: (html jQuery this) value; 
			script: [ :s | 
				s << (s jQuery id: #producto3) html: [ :r | self renderRowProducto3On: r ].
				s << (s jQuery id: #cuotaTotal) html: [ :r | self renderCuotaTotalOn: r ].
			]) 
		].
		html div class: 'column'; with: [ html textInput id: 'p12'; readonly: true;  style: 'text-align: right'; value: self model p12 ]

]

{ #category : #rendering }
Sg319Liquidacion3 >> renderRowProducto4On: html [

		html div class: 'column'; with: 'Producto 4' .
		html div class: 'column'; with: [ 
		html textInput class: 'input'; id: #p13;  value: self model p13;
			onChange: (html jQuery ajax callback: [:value | self model p13: value] value:(html jQuery this) value )
		].
		html div class: 'column'; with: [ 
		html textInput id: 'p14';  style: 'text-align: right'; value: self model p14;
			onChange: (html jQuery ajax callback: [ :value | self model p14: value asNumber ] value: (html jQuery this) value; 
			script: [ :s | 
				s << (s jQuery id: #producto4) html: [ :r | self renderRowProducto4On: r ].
				s << (s jQuery id: #cuotaTotal) html: [ :r | self renderCuotaTotalOn: r ].
				s << (s jQuery id: #p15) triggerSelect
			]) 
		].
		html div class: 'column'; with: [ html textInput id: 'p15';  style: 'text-align: right'; value: self model p15;
			onChange: (html jQuery ajax callback: [ :value | self model p15: value asNumber ] value: (html jQuery this) value; 
			script: [ :s | 
				s << (s jQuery id: #producto4) html: [ :r | self renderRowProducto4On: r ].
				s << (s jQuery id: #cuotaTotal) html: [ :r | self renderCuotaTotalOn: r ].
			]) 
		].
		html div class: 'column'; with: [ html textInput id: 'p16'; readonly: true;  style: 'text-align: right'; value: self model p16]

]

{ #category : #rendering }
Sg319Liquidacion3 >> renderRowProducto5On: html [

		html div class: 'column'; with: 'Producto 5' .
		html div class: 'column'; with: [ 
		html textInput class: 'input'; id: #p17;  value: self model p17;
			onChange: (html jQuery ajax callback: [:value | self model p17: value] value:(html jQuery this) value )
		].
		html div class: 'column'; with: [ 
		html textInput id: 'p18';  style: 'text-align: right'; value: self model p18;
			onChange: (html jQuery ajax callback: [ :value | self model p18: value asNumber ] value: (html jQuery this) value; 
			script: [ :s | 
				s << (s jQuery id: #producto5) html: [ :r | self renderRowProducto5On: r ].
				s << (s jQuery id: #cuotaTotal) html: [ :r | self renderCuotaTotalOn: r ].
				s << (s jQuery id: #p19) triggerSelect
			]) 
		].
		html div class: 'column'; with: [ html textInput id: 'p19';  style: 'text-align: right'; value: self model p19;
			onChange: (html jQuery ajax callback: [ :value | self model p19: value asNumber ] value: (html jQuery this) value; 
			script: [ :s | 
				s << (s jQuery id: #producto5) html: [ :r | self renderRowProducto5On: r ].
				s << (s jQuery id: #cuotaTotal) html: [ :r | self renderCuotaTotalOn: r ].
			]) 
		].
		html div class: 'column'; with: [ html textInput id: 'p20'; readonly: true;  style: 'text-align: right'; value: self model p20]

]

{ #category : #rendering }
Sg319Liquidacion3 >> renderRowProducto6On: html [

		html div class: 'column'; with: 'Producto 6' .
		html div class: 'column'; with: [ 
		html textInput class: 'input'; id: #p21;  value: self model p21;
			onChange: (html jQuery ajax callback: [:value | self model p21: value] value:(html jQuery this) value )
		].
		html div class: 'column'; with: [ 
		html textInput id: 'p22';  style: 'text-align: right'; value: self model p22;
			onChange: (html jQuery ajax callback: [ :value | self model p22: value asNumber ] value: (html jQuery this) value; 
			script: [ :s | 
				s << (s jQuery id: #producto6) html: [ :r | self renderRowProducto6On: r ].
				s << (s jQuery id: #cuotaTotal) html: [ :r | self renderCuotaTotalOn: r ].
				s << (s jQuery id: #p23) triggerSelect
			]) 
		].
		html div class: 'column'; with: [ html textInput id: 'p23';  style: 'text-align: right'; value: self model p23;
			onChange: (html jQuery ajax callback: [ :value | self model p23: value asNumber ] value: (html jQuery this) value; 
			script: [ :s | 
				s << (s jQuery id: #producto6) html: [ :r | self renderRowProducto6On: r ].
				s << (s jQuery id: #cuotaTotal) html: [ :r | self renderCuotaTotalOn: r ].
			]) 
		].
		html div class: 'column'; with: [ html textInput id: 'p24'; readonly: true;  style: 'text-align: right'; value: self model p24].

]
