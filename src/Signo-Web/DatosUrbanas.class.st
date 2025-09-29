Class {
	#name : 'DatosUrbanas',
	#superclass : 'Object',
	#classVars : [
		'Urbanas'
	],
	#category : 'Signo-Web-Models',
	#package : 'Signo-Web',
	#tag : 'Models'
}

{ #category : 'initialization' }
DatosUrbanas class >> initialize [

	Urbanas := OrderedCollection
		           with: (SgFincaUrbana new
				            refCatastral: '15017A012000620000MW';
				            area: 1460;
				            nombre: 'COBELO';
				            naturaleza: 'SUNC-AR-PERI-0901')
		           with: (SgFincaUrbana new
				            refCatastral: '15017A011000830000MU';
				            area: 1145;
				            nombre: 'SAR';
				            naturaleza: 'SRPA')
		           with: (SgFincaUrbana new
				            refCatastral: '15017A012000780000MR';
				            area: (GRNumberPrinter new
						             separator: $.;
						             delimiter: $,;
											precision: 2;
						             print: 1844.0);
				            nombre: 'ORDIAS';
				            naturaleza: 'U2.3')
		           with: (SgFincaUrbana new
				            refCatastral: '5945502NH5954N0001DQ';
				            area: 1116;
				            nombre: 'POMBO';
				            naturaleza: '?')
]

{ #category : 'rendering' }
DatosUrbanas class >> renderTableHeaderOn: html [

	html tableRow: [ html tableHeading: 'ref. Catastral'.
		html tableHeading: 'Area'.
		html tableHeading: 'Nombre'.
		html tableHeading: 'Naturaleza' ]
]

{ #category : 'initialization' }
DatosUrbanas class >> reset [

	<script>
	Urbanas := nil
]

{ #category : 'as yet unclassified' }
DatosUrbanas class >> urbanas [ 

	^ Urbanas
]

{ #category : 'initialization' }
DatosUrbanas >> initialize [
	^ self class initialize
]
