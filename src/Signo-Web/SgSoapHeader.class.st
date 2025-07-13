Class {
	#name : #SgSoapHeader,
	#superclass : #SgSoap,
	#category : #'Signo-Web-Utils'
}

{ #category : #converting }
SgSoapHeader >> asString [

	| writer |
	writer := XMLWriter new.
	writer tag: self prefix,':Header'.
	
	^ writer asString
]
