Class {
	#name : #SgTestServlet,
	#superclass : #WARequestHandler,
	#category : #'Signo-Web-Views'
}

{ #category : #'class initialization' }
SgTestServlet class >> initialize [

	<script>
	WAAdmin register: self at: 'signo/testServlet'
]

{ #category : #accessing }
SgTestServlet >> body [

	^ WAHtmlCanvas builder
		  fullDocument: true;
		  rootBlock: [ :root |
			  root title: 'title'.
			  root meta charset: 'utf-8'.
			  root stylesheet url: '/static-files/css/milligram/milligram.css' ];
		  render: [ :html |
			  html heading
				  level: 2;
				  with: 'testServlet'.
			  self renderHttpMethodOn: html.
			  self renderHttpParamsOn: html.
			self renderHttpHeadersOn: html ]
]

{ #category : #handling }
SgTestServlet >> handleFiltered: aRequestContext [

	aRequestContext respond: [ :response |
		response
			contentType: WAMimeType textHtml;
			found.
		response nextPutAll: self body ]
]

{ #category : #rendering }
SgTestServlet >> renderHttpHeadersOn: html [

	html div
		class: 'container';
		with: [
			html heading
				level: 4;
				with: 'Cabeceras'.
			
			self requestContext request headers associations sorted do: [ :assoc |
				html strong: assoc key , ':: '.
				html text: assoc value.
				html break ] ]
]

{ #category : #rendering }
SgTestServlet >> renderHttpMethodOn: html [

	html div class: 'container'; with: [ 
	html strong: 'Método:: '.
	html text: self requestContext request method  ]
]

{ #category : #rendering }
SgTestServlet >> renderHttpParamsOn: html [

	| params |
	html div
		class: 'container';
		with: [
			html heading
				level: 4;
				with: 'Parámetros recibidos'.
			params := Dictionary new.
			params addAll: self requestContext request postFields.
			params addAll: self requestContext request queryFields.
			params associationsDo: [ :assoc |
				html strong: assoc key , ':: '.
				html text: assoc value.
				html break ] ]
]
