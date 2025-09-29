Class {
	#name : 'Sg113ModelBloque3',
	#superclass : 'Object',
	#instVars : [
		'entidad1',
		'entidad2',
		'fechaCambioResidencia',
		'estadoResidencia'
	],
	#category : 'Signo-Web-Models',
	#package : 'Signo-Web',
	#tag : 'Models'
}

{ #category : 'accessing' }
Sg113ModelBloque3 >> gananciaPatrimonial [

	^ entidad1 gananciaPatrimonial + entidad2 gananciaPatrimonial
]

{ #category : 'as yet unclassified' }
Sg113ModelBloque3 >> gananciaPatrimonial1 [

	
	^ entidad1 gananciaPatrimonial
]

{ #category : 'as yet unclassified' }
Sg113ModelBloque3 >> gananciaPatrimonial2 [

	^ entidad2 gananciaPatrimonial
]

{ #category : 'initialization' }
Sg113ModelBloque3 >> initialize [ 

	entidad1 := Sg113ModelEntidad new.
	entidad2 := Sg113ModelEntidad new
]

{ #category : 'as yet unclassified' }
Sg113ModelBloque3 >> porcentajeTitularidad1 [

	^ entidad1 porcentajeTitularidad 
]

{ #category : 'as yet unclassified' }
Sg113ModelBloque3 >> porcentajeTitularidad2 [

	^ entidad2 porcentajeTitularidad
]

{ #category : 'initialization' }
Sg113ModelBloque3 >> setPorcentajeTitularidad1: aScaledDecimal [

	entidad1 setPorcentajeTitularidad: aScaledDecimal 
]

{ #category : 'initialization' }
Sg113ModelBloque3 >> setPorcentajeTitularidad2: aScaledDecimal [

	entidad2 setPorcentajeTitularidad: aScaledDecimal
]

{ #category : 'as yet unclassified' }
Sg113ModelBloque3 >> setValorAdquisicion1: aScaledDecimal [

	^ entidad1 setValorAdquisicion: aScaledDecimal
]

{ #category : 'as yet unclassified' }
Sg113ModelBloque3 >> setValorAdquisicion2: aScaledDecimal [

	^ entidad2 setValorAdquisicion: aScaledDecimal
]

{ #category : 'initialization' }
Sg113ModelBloque3 >> setValorMercado1: aScaledDecimal [

	entidad1 setValorMercado: aScaledDecimal 
]

{ #category : 'initialization' }
Sg113ModelBloque3 >> setValorMercado2: aScaledDecimal [

	entidad2 setValorMercado: aScaledDecimal
]

{ #category : 'as yet unclassified' }
Sg113ModelBloque3 >> valorAdquisicion1 [

	^ entidad1 valorAdquisicion
]

{ #category : 'as yet unclassified' }
Sg113ModelBloque3 >> valorAdquisicion2 [

	^ entidad2 valorAdquisicion
]

{ #category : 'as yet unclassified' }
Sg113ModelBloque3 >> valorMercado1 [

	^ entidad1 valorMercado
]

{ #category : 'as yet unclassified' }
Sg113ModelBloque3 >> valorMercado2 [

	^ entidad2 valorMercado
]
