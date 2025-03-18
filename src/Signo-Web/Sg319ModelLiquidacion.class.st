Class {
	#name : #Sg319ModelLiquidacion,
	#superclass : #Object,
	#instVars : [
		'productos'
	],
	#category : #'Signo-Web-Models-m319'
}

{ #category : #initialization }
Sg319ModelLiquidacion >> initialize [

	super initialize.
	productos := OrderedCollection 
		with: (Sg319ModelProducto volumen: 0.00 precioLitro: 0.00)
		with: (Sg319ModelProducto volumen: 0.00 precioLitro: 0.00)
		with: (Sg319ModelProducto volumen: 0.00 precioLitro: 0.00)
		with: (Sg319ModelProducto volumen: 0.00 precioLitro: 0.00)
		with: (Sg319ModelProducto volumen: 0.00 precioLitro: 0.00)
		with: (Sg319ModelProducto volumen: 0.00 precioLitro: 0.00)
		
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p01 [

	^ (productos at: 1) tipo
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p01: aString [

	(productos at: 1) setTipo: aString
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p02 [

	^ (productos at: 1) volumen
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p02: aNumber [

	(productos at: 1) setVolumen: aNumber
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p03 [

	^ (productos at: 1) precio
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p03: aNumber [

	(productos at: 1) setPrecioLitro: aNumber
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p04 [

	^ (productos at: 1) cuotaIva
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p05 [

	^ (productos at: 2) tipo
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p05: aString [

	^ (productos at: 2) setTipo: aString
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p06 [

	^ (productos at: 2) volumen
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p06: aNumber [

	^ (productos at: 2) setVolumen: aNumber
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p07 [

	^ (productos at: 2) precio
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p07: aNumber [

	^ (productos at: 2) setPrecioLitro: aNumber
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p08 [

	^ (productos at: 2) cuotaIva
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p09 [

	^ (productos at: 3) tipo
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p09: aString [

	^ (productos at: 3) setTipo: aString
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p10 [

	^ (productos at: 3) volumen
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p10: aNumber [

	^ (productos at: 3) setVolumen: aNumber
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p11 [

	^ (productos at: 3) precio
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p11: aNumber [

	^ (productos at: 3) setPrecioLitro: aNumber 
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p12 [

	^ (productos at: 3) cuotaIva
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p13 [

	^ (productos at: 4) tipo
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p13: aString [

	^ (productos at: 4) setTipo: aString
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p14 [

	^ (productos at: 4) volumen
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p14: aNumber [

	^ (productos at: 4) setVolumen: aNumber 
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p15 [

	^ (productos at: 4) precio
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p15: aNumber [

	^ (productos at: 4) setPrecioLitro: aNumber 
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p16 [

	^ (productos at: 4) cuotaIva
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p17 [

	^ (productos at: 5) tipo
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p17: aString [

	^ (productos at: 5) setTipo: aString
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p18 [
	^ (productos at: 5) volumen
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p18: aNumber [
	^ (productos at: 5) setVolumen: aNumber 
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p19 [

	^ (productos at: 5) precio
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p19: aNumber [

	^ (productos at: 5) setPrecioLitro: aNumber 
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p20 [

	^ (productos at: 5) cuotaIva
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p21 [

	^ (productos at: 6) tipo
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p21: aString [

	^ (productos at: 6) setTipo: aString
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p22 [
	^ (productos at: 6) volumen
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p22: aNumber [

	^ (productos at: 6) setVolumen: aNumber 
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p23 [

	^ (productos at: 6) precio
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p23: aNumber [

	^ (productos at: 6) setPrecioLitro: aNumber 
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p24 [

	^ (productos at: 6) cuotaIva
]

{ #category : #'as yet unclassified' }
Sg319ModelLiquidacion >> p25 [

	^ (productos collect: #cuotaIva) inject: 0.00s2 into: [ :total :iva | total + iva ]
]

{ #category : #printing }
Sg319ModelLiquidacion >> printOn: aStream [
	"Generate a string representation of the receiver based on its instance variables."

	super printOn: aStream.
	aStream
		nextPutAll: ' productos: '; cr.
	productos do: [ :each | 
		aStream tab; print: each; cr
		 ]
]
