/*!
 * Add Asset Modal.
 *
 * @author Dave Longley
 */
define([], function() {

/* @ngInject */
function factory(AlertService, HostedAssetService, ModalService, config) {
  return ModalService.directive({
    name: 'addAsset',
    templateUrl: '/app/components/assetora/add-asset-modal.html',
    link: Link
  });

  function Link(scope) {
    // FIXME: use root/global data, move over to model
    scope.data = config.data || {};
    scope.identity = scope.data.identity || {};
    scope.feedback = {};

    scope.model = {};
    scope.model.loading = false;
    scope.model.asset = {
      '@context': 'https://w3id.org/payswarm/v1',
      type: 'Asset',
      // FIXME: add more asset details
      // FIXME: remove test data
      title: 'TITLE',
      creator: {name: 'My Full Name'},
      assetProvider: scope.identity.id,
      listingRestrictions: {vendor: scope.identity.id},
      assetContent: 'http://wordpress.payswarm.dev/asset-content/test.html',
      // FIXME: figure out whether published flag is desirable
      sysPublished: window.iso8601.w3cDate()
    };

    scope.addAsset = function() {
      var asset = scope.model.asset;
      asset.created = window.iso8601.w3cDate();

      console.log('asset', asset);
      HostedAssetService.add(asset).then(function(asset) {
        scope.loading = false;
        scope.modal.close(null, asset);
      }).catch(function(err) {
        AlertService.add('error', err);
        scope.loading = false;
      });
    };
  }
}

return {addAssetModal: factory};

});
