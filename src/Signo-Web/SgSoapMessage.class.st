Class {
	#name : 'SgSoapMessage',
	#superclass : 'SgSoap',
	#instVars : [
		'header',
		'body'
	],
	#category : 'Signo-Web-Utils',
	#package : 'Signo-Web',
	#tag : 'Utils'
}

{ #category : 'converting' }
SgSoapMessage >> asString [ 

	| writer |
	
	writer := XMLWriter new.
	writer isEscaping: false.
	((writer 
		tag: self prefix, ':Envelope') 
			xmlnsDeclarations: (Array with: self prefix -> 'http://www.w3.org/2003/05/soap-envelope');
  			attributes: (Array with: self prefix,':encodingStyle' -> 'http://www.w3.org/2003/05/soap-encoding')) with: [  
			writer raw: self header asString.
			writer tag: self prefix, ':Body' with: body asString
	].
	
	^ writer asString.
]

{ #category : 'accessing' }
SgSoapMessage >> body: aXml [

	body := aXml
]

{ #category : 'accessing' }
SgSoapMessage >> header [

	^ header ifNil: [  header := SgSoapHeader new ]
]

{ #category : 'accessing' }
SgSoapMessage >> header: aXmlWriter [

	header := aXmlWriter asString 
]
