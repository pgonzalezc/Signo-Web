Class {
	#name : #Sg113ModelEntidad,
	#superclass : #Object,
	#instVars : [
		'denominacion',
		'porcentajeTitularidad',
		'valorMercado',
		'valorAdquisicion'
	],
	#category : #'Signo-Web-Models'
}

{ #category : #accessing }
Sg113ModelEntidad >> denominacion [ 

	^ denominacion ifNil: [ denominacion := '' ]
]

{ #category : #accessing }
Sg113ModelEntidad >> gananciaPatrimonial [

	^ self valorMercado - self valorAdquisicion
	  * self porcentajeTitularidad / 100.00s
]

{ #category : #accessing }
Sg113ModelEntidad >> porcentajeTitularidad [

	^ porcentajeTitularidad ifNil: [ porcentajeTitularidad := 100.00s2 ]
]

{ #category : #initialization }
Sg113ModelEntidad >> setDenominacion: aString [

	denominacion := aString
]

{ #category : #initialization }
Sg113ModelEntidad >> setPorcentajeTitularidad: aScaledDecimal [

	porcentajeTitularidad := aScaledDecimal 
]

{ #category : #initialization }
Sg113ModelEntidad >> setValorAdquisicion: aScaledDecimal [

	valorAdquisicion := aScaledDecimal 
]

{ #category : #initialization }
Sg113ModelEntidad >> setValorMercado: aScaledDecimal [

	valorMercado := aScaledDecimal
]

{ #category : #accessing }
Sg113ModelEntidad >> valorAdquisicion [

	^ valorAdquisicion ifNil: [ valorAdquisicion := 0.00s2 ]
]

{ #category : #accessing }
Sg113ModelEntidad >> valorMercado [

	^ valorMercado ifNil: [ valorMercado := 0.00s2 ]
]
