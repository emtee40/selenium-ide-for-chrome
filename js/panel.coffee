do =>
	"use strict"

	global = @
	global.scopes = {};

	global.selenium = new SeleniumIDE()
	global.selenium.init()

	document.addEventListener 'DOMContentLoaded', ->
		mod = angular.module 'ng'

		for elem in document.querySelectorAll('[ng-controller]')
			name = elem.getAttribute('ng-controller')
			mod.controller name, ['$scope', global[name]]
			global.scopes[name] = angular.element(elem).scope()


		global.addEventListener 'DOMContentLoaded', ->
			chrome.extension.onMessage.addListener (msg)->
				return if msg.command isnt 'event'
				delete msg.command
				global.scopes['testCommandCtrl'].add msg