Class {
	#name : #SgMDevengo,
	#superclass : #SgMBase,
	#instVars : [
		'ejercicio',
		'periodo',
		'fechaInicioPeriodoImpositivo',
		'fechaFinPeriodoImpositivo'
	],
	#category : #'Signo-Web-Models'
}

{ #category : #accessing }
SgMDevengo >> ejercicio [

	^ ejercicio
]

{ #category : #accessing }
SgMDevengo >> fechaFinPeriodoImpositivo [

	^ fechaFinPeriodoImpositivo
]

{ #category : #accessing }
SgMDevengo >> fechaInicioPeriodoImpositivo [

	^ fechaInicioPeriodoImpositivo
]

{ #category : #initialization }
SgMDevengo >> initialize [ 

	super initialize.
	ejercicio := DateAndTime now year
]

{ #category : #accessing }
SgMDevengo >> periodo [

	^ periodo
]

{ #category : #printing }
SgMDevengo >> printOn: aStream [
	"Generate a string representation of the receiver based on its instance variables."

	super printOn: aStream.
	aStream
		nextPutAll: ' ejercicio: ';
		print: ejercicio.
	aStream
		nextPutAll: ' periodo: ';
		print: periodo.
	aStream
		nextPutAll: ' fechaInicioPeriodoImpositivo: ';
		print: fechaInicioPeriodoImpositivo.
	aStream
		nextPutAll: ' fechaFinPeriodoImpositivo: ';
		print: fechaFinPeriodoImpositivo.
	
]

{ #category : #initialization }
SgMDevengo >> setEjercicio: aNumber [

	ejercicio := aNumber.
	
]

{ #category : #initialization }
SgMDevengo >> setFechaFinPeriodoImpositivo: aDateAndTime [

	fechaFinPeriodoImpositivo := aDateAndTime 
]

{ #category : #initialization }
SgMDevengo >> setFechaInicioPeriodoImpositivo: aDateAndTime [

	fechaInicioPeriodoImpositivo := aDateAndTime 
]

{ #category : #initialization }
SgMDevengo >> setPeriodo: aPeriodo [

	periodo := aPeriodo
]

{ #category : #accessing }
SgMDevengo >> validate [

	^ OrderedCollection new
]
