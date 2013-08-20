/*!
 * Directives module.
 *
 * @author Dave Longley
 */
(function() {

define([
  'angular',
  'app/directives/accountSelector',
  'app/directives/addressSelector',
  'app/directives/budgetBar',
  'app/directives/budgetSelector',
  'app/directives/creditCardSelector',
  'app/directives/duplicateChecker',
  'app/directives/fadein',
  'app/directives/fadeout',
  'app/directives/fadeToggle',
  'app/directives/feedback',
  'app/directives/focusToggle',
  'app/directives/helpToggle',
  'app/directives/identitySelector',
  'app/directives/inputWatcher',
  'app/directives/kredit',
  'app/directives/modalAddAccount',
  'app/directives/modalAddAddress',
  'app/directives/modalAddBudget',
  'app/directives/modalAddIdentity',
  'app/directives/modalAddListing',
  'app/directives/modalAddPaymentToken',
  'app/directives/modalAlert',
  'app/directives/modalDeposit',
  'app/directives/modalEditAccount',
  'app/directives/modalEditBudget',
  'app/directives/modalEditKey',
  'app/directives/modalProtectAsset',
  'app/directives/modalRedeemPromoCode',
  'app/directives/modalSelector',
  'app/directives/modalSwitchIdentity',
  'app/directives/modalVerifyBankAccount',
  'app/directives/modalWithdraw',
  'app/directives/mouseoverToggle',
  'app/directives/ngBlur',
  'app/directives/ngFocus',
  'app/directives/paymentTokenSelector',
  'app/directives/placeholder',
  'app/directives/popoverTemplate',
  'app/directives/promoCodeChecker',
  'app/directives/selector',
  'app/directives/slugIn',
  'app/directives/slugOut',
  'app/directives/spinner',
  'app/directives/submitForm',
  'app/directives/tooltipTitle',
  'app/directives/trackState',
  'app/directives/vcardAddress'
], function(angular) {
  angular.module('app.directives', []).directive(angular.extend.apply(
    null, [{}].concat(Array.prototype.slice.call(arguments, 1))));
});

})();
