Class {
	#name : 'SgSoapHeader',
	#superclass : 'SgSoap',
	#category : 'Signo-Web-Utils',
	#package : 'Signo-Web',
	#tag : 'Utils'
}

{ #category : 'converting' }
SgSoapHeader >> asString [

	| writer |
	writer := XMLWriter new.
	writer tag: self prefix,':Header'.
	
	^ writer asString
]
