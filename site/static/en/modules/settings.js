/*!
 * Identity Settings
 *
 * @author Dave Longley
 */
// FIXME: use RequireJS AMD format
(function() {

var module = angular.module('payswarm');

module.controller('SettingsCtrl', function($scope) {
  // initialize model
  var data = window.data || {};
  $scope.session = data.session || null;
  $scope.identity = data.identity || null;
});

module.controller('ExternalAccountsCtrl', function($scope, svcPaymentToken) {
  // types for UI directives
  $scope.allTypes = ['ccard:CreditCard', 'bank:BankAccount'];
  $scope.creditCardTypes = ['ccard:CreditCard'];
  $scope.bankAccountTypes = ['bank:BankAccount'];

  // service data
  $scope.creditCards = svcPaymentToken.creditCards;
  $scope.bankAccounts = svcPaymentToken.bankAccounts;
  $scope.loading = false;

  $scope.deletePaymentToken = function(paymentToken) {
    console.log('XXX dpt', paymentToken);
    /*
    svcPaymentToken.del(paymentToken, function() {
      $scope.$apply();
    });
    */
  };

  svcPaymentToken.get(function() {
    console.log('XXX ptap', $scope, svcPaymentToken);
    $scope.$apply();
  });
});

module.controller('AddressCtrl', function($scope, svcAddress) {
  $scope.addresses = svcAddress.addresses;
  $scope.loading = false;

  $scope.deleteAddress = function(address) {
    svcAddress.del(address, function() {
      $scope.$apply();
    });
  };

  svcAddress.get(function() {
    $scope.$apply();
  });
});

})();
