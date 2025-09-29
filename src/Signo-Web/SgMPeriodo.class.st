Class {
	#name : 'SgMPeriodo',
	#superclass : 'Object',
	#classVars : [
		'Anual',
		'Mensuales',
		'Trimestrales'
	],
	#category : 'Signo-Web-Models',
	#package : 'Signo-Web',
	#tag : 'Models'
}

{ #category : 'as yet unclassified' }
SgMPeriodo class >> anual [

	^ Anual ifNil: [Anual := OrderedCollection with: '0A' -> 'Anual']
]

{ #category : 'as yet unclassified' }
SgMPeriodo class >> mensuales [

	^ Mensuales ifNil: [ Mensuales := OrderedCollection new
		  add: '01' -> 'Enero';
		  add: '02' -> 'Febrero';
		  add: '03' -> 'Marzo';
		  add: '04' -> 'Abril';
		  add: '05' -> 'Mayo';
		  add: '06' -> 'Junio';
		  add: '07' -> 'Julio';
		  add: '08' -> 'Agosto';
		  add: '09' -> 'Septiembre';
		  add: '10' -> 'Octubre';
		  add: '11' -> 'Noviembre';
		  add: '12' -> 'Diciembre';
		  yourself]
]

{ #category : 'as yet unclassified' }
SgMPeriodo class >> trimestrales [

	^ Trimestrales ifNil: [
		  Trimestrales := OrderedCollection
			                  with: '1T' -> 'Primer Trimestre'
			                  with: '2T' -> 'Segundo Trimestre'
			                  with: '3T' -> 'Tercer Trimestre'
			                  with: '4T' -> 'Cuarto Trimestre' ]
]

{ #category : 'as yet unclassified' }
SgMPeriodo >> anual [ 
	
	^ self class anual
]

{ #category : 'as yet unclassified' }
SgMPeriodo >> mensuales [ 

	^ self class mensuales
]

{ #category : 'as yet unclassified' }
SgMPeriodo >> trimestrales [
	^ self class trimestrales
]
