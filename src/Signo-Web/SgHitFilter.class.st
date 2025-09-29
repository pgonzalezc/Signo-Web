Class {
	#name : 'SgHitFilter',
	#superclass : 'WARequestFilter',
	#category : 'Signo-Web-Views',
	#package : 'Signo-Web',
	#tag : 'Views'
}

{ #category : 'processing' }
SgHitFilter >> handleFiltered: aRequestContext [

	Transcript
		show: 'SgHitFiltered -- done';
		cr.
	aRequestContext request isGet ifTrue: [
		(aRequestContext responseGenerator htmlPageForGetInfo:
			 aRequestContext request queryFields) value respond ].
	aRequestContext request isPost ifTrue: [
		aRequestContext responseGenerator methodNotAllowed respond ].
	super handleFiltered: aRequestContext
]
