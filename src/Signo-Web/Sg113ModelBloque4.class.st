Class {
	#name : 'Sg113ModelBloque4',
	#superclass : 'Object',
	#instVars : [
		'entidad1',
		'entidad2',
		'opcionA',
		'opcionB',
		'opcionC'
	],
	#category : 'Signo-Web-Models',
	#package : 'Signo-Web',
	#tag : 'Models'
}

{ #category : 'as yet unclassified' }
Sg113ModelBloque4 >> denominacion1 [

	^ entidad1 denominacion
]

{ #category : 'as yet unclassified' }
Sg113ModelBloque4 >> denominacion2 [

	^ entidad2 denominacion
]

{ #category : 'as yet unclassified' }
Sg113ModelBloque4 >> gananciaPatrimonial1 [

	^ entidad1 ganaciaPatrimonial 
]

{ #category : 'as yet unclassified' }
Sg113ModelBloque4 >> gananciaPatrimonial2 [

	^ entidad2 ganaciaPatrimonial
]

{ #category : 'initialization' }
Sg113ModelBloque4 >> initialize [ 

	super initialize.
	entidad1 := Sg113ModelEntidadBlq4 new.
	entidad2 := Sg113ModelEntidadBlq4 new
]

{ #category : 'accessing' }
Sg113ModelBloque4 >> opcionA [

	^ opcionA
]

{ #category : 'accessing' }
Sg113ModelBloque4 >> opcionB [

	^ opcionB
]

{ #category : 'accessing' }
Sg113ModelBloque4 >> opcionC [
	^ opcionC 
	
]

{ #category : 'as yet unclassified' }
Sg113ModelBloque4 >> porcentajeTitularidad1 [ 

	^ entidad1 porcentajeTitularidad 
]

{ #category : 'as yet unclassified' }
Sg113ModelBloque4 >> porcentajeTitularidad2 [

	^ entidad2 porcentajeTitularidad
]

{ #category : 'initialization' }
Sg113ModelBloque4 >> setDenominacion1: aString [

	entidad1 setDenominacion: aString
]

{ #category : 'initialization' }
Sg113ModelBloque4 >> setDenominacion2: aString [

	entidad2 setDenominacion: aString
]

{ #category : 'initialization' }
Sg113ModelBloque4 >> setOpcionA: aBoolean [

	opcionA := aBoolean
]

{ #category : 'initialization' }
Sg113ModelBloque4 >> setOpcionB: aBoolean [

	opcionB := aBoolean
]

{ #category : 'initialization' }
Sg113ModelBloque4 >> setOpcionC: aBoolean [

	opcionC := aBoolean
]

{ #category : 'initialization' }
Sg113ModelBloque4 >> setValorAdquisicion1:  aScaledDecimal [

	entidad1 setValorAdquisicion: aScaledDecimal
]

{ #category : 'initialization' }
Sg113ModelBloque4 >> setValorAdquisicion2: aScaledDecimal [

	entidad2 setValorAdquisicion: aScaledDecimal
]

{ #category : 'initialization' }
Sg113ModelBloque4 >> setValorMercado1: aScaledDecimal [

	entidad1 setValorMercado: aScaledDecimal 
]

{ #category : 'initialization' }
Sg113ModelBloque4 >> setValorMercado2: aScaledDecimal [

	entidad2 setValorMercado: aScaledDecimal
]

{ #category : 'initialization' }
Sg113ModelBloque4 >> setValorTransmision1: aScaledDecimal [

	entidad1 setValorTransmision: aScaledDecimal
]

{ #category : 'initialization' }
Sg113ModelBloque4 >> setValorTransmision2: aScaledDecimal [

	entidad2 setValorTransmision: aScaledDecimal
]

{ #category : 'accessing' }
Sg113ModelBloque4 >> totalGananciasPatrimoniales [

	^ entidad1 ganaciaPatrimonial + entidad2 ganaciaPatrimonial
]

{ #category : 'as yet unclassified' }
Sg113ModelBloque4 >> valorAdquisicion1 [ 
	
	^ entidad1 valorAdquisicion 
]

{ #category : 'as yet unclassified' }
Sg113ModelBloque4 >> valorAdquisicion2 [

	^ entidad2 valorAdquisicion
]

{ #category : 'as yet unclassified' }
Sg113ModelBloque4 >> valorMercado1 [ 

	^ entidad1 valorMercado
]

{ #category : 'as yet unclassified' }
Sg113ModelBloque4 >> valorMercado2 [

	^ entidad2 valorMercado
]

{ #category : 'as yet unclassified' }
Sg113ModelBloque4 >> valorTransmision1 [

	^ entidad1 valorTransmision 
]

{ #category : 'as yet unclassified' }
Sg113ModelBloque4 >> valorTransmision2 [

	^ entidad2 valorTransmision
]
