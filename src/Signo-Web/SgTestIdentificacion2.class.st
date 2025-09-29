Class {
	#name : 'SgTestIdentificacion2',
	#superclass : 'SgBaseView',
	#instVars : [
		'children'
	],
	#category : 'Signo-Web-Views',
	#package : 'Signo-Web',
	#tag : 'Views'
}

{ #category : 'testing' }
SgTestIdentificacion2 class >> canBeRoot [ 
	
	^true
]

{ #category : 'class initialization' }
SgTestIdentificacion2 class >> initialize [

	<script>
	WAAdmin register: self asApplicationAt: 'signo/test/identificacion2'
]

{ #category : 'hooks' }
SgTestIdentificacion2 >> children [

	^ children values
]

{ #category : 'initialization' }
SgTestIdentificacion2 >> initialize [

	super initialize.
	children := Dictionary new.
	children at: #contribuyente put:  (SgIdentificacion new
				             addDecoration:
					             (WAMessageDecoration new message:
							              'Identificación del contribuyente');
				             addDecoration: SgAcceptDecoration new;
				             yourself).
	children at: #conyuge put: (SgIdentificacion new
				             addDecoration:
					             (WAMessageDecoration new message:
							              'Identificación del conyuge');
				             addDecoration: SgAcceptDecoration new;
				             yourself)

]

{ #category : 'rendering' }
SgTestIdentificacion2 >> renderAnchorFor: aSymbol on: html [

	html anchor
		class: 'button button-outline';
		callback: [ self call: (children at: aSymbol) ];
		with: [
			html text: ('Identificacion {1}' format: { aSymbol asString }).
			html space.
			html image
				height: 12;
				width: 12;
				url: '/static-files/img/external-link-symbolic.svg' ]
]

{ #category : 'rendering' }
SgTestIdentificacion2 >> renderContentOn: html [

	html div
		class: 'container';
		with: [
			html heading
				level2;
				with: 'Test de identificación II'.
			html div
				class: 'row';
				with: [
					html div
						class: 'column column-50';
						with: [
							self renderAnchorFor: #contribuyente on: html.
							html break.
							(children at: #contribuyente) identificacion renderHtmlOn: html ].
					html div
						class: 'column';
						with: [
							self renderAnchorFor: #conyuge on: html.
							html break.
							(children at: #conyuge) identificacion renderHtmlOn: html ] ] ]
]
