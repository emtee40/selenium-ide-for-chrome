// Generated by CoffeeScript 1.6.2
(function() {
  "use strict";  this.menuPanelCtrl = function($scope) {
    chrome.tabs.query({
      'active': true,
      'windowType': 'normal'
    }, function(tabs) {
      return chrome.tabs.executeScript(tabs[0].id, {
        'code': 'location.origin'
      }, function(results) {
        $scope.baseURL = results[0];
        return $scope.$apply();
      });
    });
    $scope.executeTestCase = function() {
      return selenium.send();
    };
    $scope.quitBrowser = function() {
      return selenium.quit();
    };
    return this;
  };

}).call(this);