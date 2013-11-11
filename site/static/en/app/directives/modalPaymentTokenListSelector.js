/*!
 * Payment Token List Selector.
 *
 * @author Digital Bazaar
 */
define([], function() {

var deps = ['svcModal'];
return {modalPaymentTokenListSelector: deps.concat(factory)};

function factory(svcModal) {
  function Ctrl($scope) {
    $scope.data = window.data || {};
    $scope.feedback = {};

    var model = $scope.model = {};
    model.loading = false;
    // payment backup source selected
    model.backupSource = null;

    $scope.confirm = function() {
      $scope.modal.close(null, model.backupSource);
    };
  }

  return svcModal.directive({
    name: 'PaymentTokenListSelector',
    // FIXME support not showing duplicates of current list
    //scope: {
    //  current: '='
    //},
    templateUrl: '/partials/modals/payment-token-list-selector.html',
    controller: ['$scope', Ctrl],
    link: function(scope, element) {
      scope.feedbackTarget = element;
    }
  });
}

});
