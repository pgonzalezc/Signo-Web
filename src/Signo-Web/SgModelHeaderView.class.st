Class {
	#name : 'SgModelHeaderView',
	#superclass : 'WAComponent',
	#instVars : [
		'title',
		'model',
		'subtitle'
	],
	#category : 'Signo-Web-Views',
	#package : 'Signo-Web',
	#tag : 'Views'
}

{ #category : 'rendering' }
SgModelHeaderView >> renderContentOn: html [

	html div
		class: 'row';
		id: 'model-header';
		with: [
			html div
				class: 'column column-10';
				with: [
					html image
						width: 75;
						height: 75;
						url: '/static-files/img/usuario-sin-foto.png' ].
			html div
				class: 'column column-20';
				style:
					'border: 3px solid #909090; border-radius: 7px; margin: 2px';
				style: 'font-size: x-small';
				with: [
					html div style: 'display: block'; with: [
							html image
								width: 22;
								height: 22;
								url: '/static-files/img/usuario-sin-foto.png'.
							html space.
							html strong: 'Agencia Tributaria' ].
					html break.
					html div
						style: 'display: block;vertical-align: bottom';
						with: [
							html text: 'Teléfono: 91 554 87 70/901 33 55 33'.
							html break.
							html anchor
								url: 'https://sede.agenciatributaria.gob.es';
								with: 'https://sede.agenciatributaria.gob.es' ] ].
			html div
				class: 'column column-60';
				style:
					'border: 3px solid #909090; border-radius: 7px; margin: 2px';
				with: [
					title do: [ :each |
							html text: each.
							html break ].
					subtitle ifNotNil: [
							subtitle do: [ :each |
									html small: each.
									html break ] ] ].
			html div
				class: 'column column-10';
				style:
					'border: 3px solid #909090; border-radius: 7px; text-align: center; margin: 2px';
				with: [
					html span
						style: 'font-size: 16pt';
						with: 'Modelo'.
					html break.
					html strong
						style: 'font-size: 22pt';
						with: model ] ]
]

{ #category : 'initialization' }
SgModelHeaderView >> setModel: aString [

	model := aString
]

{ #category : 'initialization' }
SgModelHeaderView >> setSubtitle: aCollectionOfStrings [

	subtitle := aCollectionOfStrings 
]

{ #category : 'initialization' }
SgModelHeaderView >> setTitle: aString [

	title := aString
]
