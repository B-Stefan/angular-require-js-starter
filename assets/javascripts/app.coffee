define [
	'ang'
	'c/controllers'
	'filters/filters'
	'services/services'
  'angular-ui-router'
  'angular-ui-bootstrap'
	], (angular) ->
	'use strict'

	angular.module 'app', [
		'controllers'
		'filters'
    'ui.bootstrap'
    'ui.router'
		'services'
	]
