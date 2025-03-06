Class {
	#name : #Sg113ModelEntidadBlq4,
	#superclass : #Sg113ModelEntidad,
	#instVars : [
		'valorTransmision'
	],
	#category : #'Signo-Web-Models'
}

{ #category : #'as yet unclassified' }
Sg113ModelEntidadBlq4 >> ganaciaPatrimonial [

	^ (self valorTransmision - self valorAdquisicion
	  * self porcentajeTitularidad / 100.00s) asScaledDecimal: 2
]

{ #category : #initialization }
Sg113ModelEntidadBlq4 >> setValorTransmision: aScaledDecimal [

	valorTransmision := aScaledDecimal
]

{ #category : #accessing }
Sg113ModelEntidadBlq4 >> valorTransmision [

	^ valorTransmision ifNil: [ valorTransmision := 0.00s2 ]
]
