Class {
	#name : #SgHitFilter,
	#superclass : #WARequestFilter,
	#category : #'Signo-Web-Views'
}

{ #category : #processing }
SgHitFilter >> handleFiltered: aRequestContext [

	Transcript
		show: 'SgHitFiltered -- done';
		cr.
	aRequestContext request isGet ifTrue: [
		(aRequestContext responseGenerator HtmlPageForGetInfo:
			 aRequestContext request queryFields) value respond ].
	aRequestContext request isPost ifTrue: [
		aRequestContext responseGenerator methodNotAllowed respond ].
	super handleFiltered: aRequestContext
]
