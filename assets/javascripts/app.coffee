define [
	'ang'
	'c/controllers'
  'directives/directives'
	'filters/filters'
	'services/services'
  'angular-ui-router'
  'angular-ui-bootstrap'
  'angular-socket-io'
  'angular-scroll'
  'angular-inview'
	],
(angular) ->
	'use strict'

	angular.module 'app', [
		'controllers'
		'filters'
    'directives'
    'ui.bootstrap'
    'ui.router'
    'angular-inview'
		'services'
    'btford.socket-io'
    'duScroll'
	]
