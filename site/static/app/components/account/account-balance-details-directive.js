/*!
 * Account Balance Details directive. To be paired w/Account Balance Summary.
 *
 * @author Dave Longley
 */
define([], function() {

var deps = ['AlertService', 'PaymentTokenService'];
return {accountBalanceDetails: deps.concat(factory)};

function factory(AlertService, PaymentTokenService) {
  return {
    scope: {
      account: '=accountBalanceDetails',
      expand: '='
    },
    replace: true,
    templateUrl: '/app/components/account/account-balance-details.html',
    controller: ['$scope', function($scope) {
      var model = $scope.model = {};
      model.paymentMethodIsCollapsed = true;
      model.creditBar = {
        width: 0,
        textWidth: 0
      };
      model.hasCreditLine = ($scope.account ?
        parseFloat($scope.account.creditLimit || '0') > 0 : false);
    }],
    link: function(scope, element, attrs) {
      var model = scope.model;

      // update progress bar when account changes
      scope.$watch('account', function(account) {
        // get balance and credit limit
        model.balance = parseFloat(account ? account.balance : 0);
        model.creditLimit = parseFloat(
          account ? account.creditLimit || '0' : 0);

        // calculate remaining credit
        model.remainingCredit = model.creditLimit;
        if(model.balance < 0) {
          model.remainingCredit = model.creditLimit + model.balance;
        }

        // get total balance (includes remaining credit)
        model.totalBalance = model.remainingCredit;
        if(model.balance > 0) {
          model.totalBalance += model.balance;
        }

        // credit info display
        model.hasCreditLine = (model.creditLimit > 0);
        if(model.hasCreditLine) {
          // get backup source token
          model.backupSource = null;
          if(account.backupSource && account.backupSource.length) {
            PaymentTokenService.get(account.backupSource[0])
              .then(function(token) {
                model.backupSource = token;
                scope.$apply();
              }).catch(function(err) {
                AlertService.add('error', err);
                scope.$apply();
              });
          }

          // credit bar width
          if(model.balance >= 0) {
            model.creditBar.width = 100;
          } else {
            var p = model.remainingCredit / model.creditLimit * 100;
            model.creditBar.width = Math.max(0, Math.min(p, 100));
          }
        }
        model.creditBar.textWidth = 100 / model.creditBar.width * 100;
      }, true);
    }
  };
}

});
