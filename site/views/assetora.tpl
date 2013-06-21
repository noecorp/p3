${set([
  pageTitle = "Assetora",
  jsList.push("forge/forge.rsa.bundle"),
  jsList.push("filesaver/FileSaver"),
  jsList.push("modules/assetora"),
  inav = "assetora"
])}  
{{partial "head.tpl"}}

{{verbatim}}
<div class="container ng-cloak" data-ng-controller="AssetoraCtrl">

  <div class="row">
    <div class="title-section span12">
      <h1 class="headline">Assetora</h1>
      
      <p>Assetora is a service that makes it easier for you to sell the
      creations you host on your website. Using Assetora, you can set what
      your customers will see when they try to purchase items from your
      website and set the parameters for what they'll pay you (or others) in
      order to gain access to those items.</p>
      <p>This service provides you with the tools to design assets and listings
      for your creations. An asset describes your creation and may optionally
      set royalties for it if you want to allow other people to resell your
      work. A listing sets the price and licensing terms for purchasing an
      asset. Assetora allows you to host both asset descriptions and listings
      directly on Meritora, which means there's less for you to set up before
      you can start selling.</p>
    </div>
  </div>
  
  <div class="row">
    <div class="section span12">
      <h3 class="headline">Search</h3>
      <form class="form-search">
        <input type="text" name="search" class="input-xlarge search-query"
          data-ng-model="model.search.input">
        <span data-input-watcher="model.search.input"
          data-input-watcher-state="model.search.state"
          data-input-change="search(input, state, callback)">
        </span>
        <span data-spinner="model.search.state.loading || state.assets.loading || state.listings.loading"
          data-spinner-class="append-btn-spinner"></span>
        <button data-ng-show="!(model.search.state.loading || state.assets.loading || state.listings.loading)"
          class="btn btn-success btn-add"
          data-ng-click="model.modals.showAddAsset=true"><i class="icon-plus icon-white"></i> Add Asset</button>
      </form>
    </div>
  </div>
  
  <div class="row">
    <div class="section section-asset-search span6">
      <h3 class="headline">Asset Search Results</h3>
      
      <table class="table table-condensed"
        data-ng-show="!state.assets.loading && model.search.assets.length > 0">
        <thead>
          <tr>
            <th class="date">Date</th>
            <th class="name">Title</th>
            <th class="name">Creator</th>
            <th class="action">Action</th>
          </tr>
        </thead>
        <tbody>
          <tr data-ng-repeat="asset in model.search.assets" class="asset"
            data-fadein="asset.added" data-fadeout="asset.deleted">
            <!-- Date -->
            <td>
              <span class="date">{{asset.created | date:'medium'}}</span>
            </td>
            <!-- Title -->
            <td>
              <span class="name">{{asset.title}}</span>
            </td>
            <!-- Creator -->
            <td>
              <span class="name">{{asset.creator.fullName}}</span>
            </td>
            <!-- Action -->
            <td class="action">
              <div class="btn-group">
                <a href="#" class="btn dropdown-toggle" data-toggle="dropdown">
                  <i class="icon-chevron-down"></i>
                </a>
                <ul class="dropdown-menu">
                  <li>
                    <a data-ng-click="model.modals.asset=asset; model.modals.showAddListing=true">
                      <i class="icon-plus"></i> Add Listing
                    </a>
                  </li>
                  <li>
                    <a data-ng-click="model.modals.asset=asset; model.modals.showEditAsset=true">
                      <i class="icon-pencil"></i> Edit
                    </a>
                  </li>
                  <li>
                    <a data-ng-click="model.modals.asset=asset; model.modals.showProtectAsset=true">
                      <i class="icon-lock"></i> Protect
                    </a>
                  </li>
                  <li class="divider"></li>
                  <li class="btn-danger">
                    <a data-ng-click="deleteAsset(asset)">
                      <i class="icon-remove icon-white"></i> Delete
                    </a>
                  </li>
                </ul>
              </div>
            </td>
          </tr>
        </tbody>
        <tfoot>
          <tr data-ng-show="state.assets.loading">
            <td colspan="3" style="text-align: center">
              <span class="center">
                <span data-spinner="state.assets.loading" data-spinner-class="table-spinner"></span>
              </span>
            </td>
          </tr>
        </tfoot>
      </table>
      <div data-ng-show="!state.assets.loading && model.search.assets.length == 0">
        <p class="center">No matches.</p>
      </div>
    </div>
  
    <div class="section section-listing-search span6">
      <h3 class="headline">Listing Search Results</h3>
      
      <table class="table table-condensed"
        data-ng-show="!state.listings.loading && model.search.listings.length > 0">
        <thead>
          <tr>
            <th class="date">Date</th>
            <th class="name">Title</th>
            <th class="name">Creator</th>
            <th class="action">Action</th>
          </tr>
        </thead>
        <tbody>
          <tr data-ng-repeat="listing in model.search.listings" class="listing"
            data-fadein="listing.added" data-fadeout="listing.deleted">
            <!-- Date -->
            <td>
              <span class="date">{{listing.asset.created | date:'medium'}}</span>
            </td>
            <!-- Title -->
            <td>
              <span class="name">{{listing.asset.title}}</span>
            </td>
            <!-- Creator -->
            <td>
              <span class="name">{{listing.asset.creator.fullName}}</span>
            </td>
            <!-- Action -->
            <td class="action">
              <div class="btn-group">
                <a href="#" class="btn dropdown-toggle" data-toggle="dropdown">
                  <i class="icon-chevron-down"></i>
                </a>
                <ul class="dropdown-menu">
                  <li>
                    <a data-ng-click="model.modals.listing=listing; model.modals.showEditListing=true">
                      <i class="icon-pencil"></i> Edit
                    </a>
                  </li>
                  <li class="divider"></li>
                  <li class="btn-danger">
                    <a data-ng-click="deleteListing(listing)">
                      <i class="icon-remove icon-white"></i> Delete
                    </a>
                  </li>
                </ul>
              </div>
            </td>
          </tr>
        </tbody>
        <tfoot>
          <tr data-ng-show="state.listings.loading">
            <td colspan="3" style="text-align: center">
              <span class="center">
                <span data-spinner="state.listings.loading" data-spinner-class="table-spinner"></span>
              </span>
            </td>
          </tr>
        </tfoot>
      </table>
      <div data-ng-show="!state.listings.loading && model.search.listings.length == 0">
        <p class="center">No matches.</p>
      </div>
    </div>
  </div>  
  
  <div class="row">
    <div class="section section-recent-assets span6">
      <h3 class="headline">Recent Assets</h3>
      
      <table class="table table-condensed" data-ng-show="state.assets.loading || model.recentAssets.length > 0">
        <thead>
          <tr>
            <th class="date">Date</th>
            <th class="name">Title</th>
            <th class="name">Creator</th>
            <th class="action">Action</th>
          </tr>
        </thead>
        <tbody>
          <tr data-ng-repeat="asset in model.recentAssets" class="asset"
            data-fadein="asset.added" data-fadeout="asset.deleted">
            <!-- Date -->
            <td>
              <span class="date">{{asset.created | date:'medium'}}</span>
            </td>
            <!-- Title -->
            <td>
              <span class="name">{{asset.title}}</span>
            </td>
            <!-- Creator -->
            <td>
              <span class="name">{{asset.creator.fullName}}</span>
            </td>
            <!-- Action -->
            <td class="action">
              <div class="btn-group">
                <a href="#" class="btn dropdown-toggle" data-toggle="dropdown">
                  <i class="icon-chevron-down"></i>
                </a>
                <ul class="dropdown-menu">
                  <li>
                    <a data-ng-click="model.modals.asset=asset; model.modals.showAddListing=true">
                      <i class="icon-plus"></i> Add Listing
                    </a>
                  </li>
                  <li>
                    <a data-ng-click="model.modals.asset=asset; model.modals.showEditAsset=true">
                      <i class="icon-pencil"></i> Edit
                    </a>
                  </li>
                  <li>
                    <a data-ng-click="model.modals.asset=asset; model.modals.showProtectAsset=true">
                      <i class="icon-lock"></i> Protect
                    </a>
                  </li>
                  <li class="divider"></li>
                  <li class="btn-danger">
                    <a data-ng-click="deleteAsset(asset)">
                      <i class="icon-remove icon-white"></i> Delete
                    </a>
                  </li>
                </ul>
              </div>
            </td>
          </tr>
        </tbody>
        <tfoot>
          <tr data-ng-show="state.assets.loading">
            <td colspan="3" style="text-align: center">
              <span class="center">
                <span data-spinner="state.assets.loading" data-spinner-class="table-spinner"></span>
              </span>
            </td>
          </tr>
        </tfoot>
      </table>
      <div data-ng-show="!state.assets.loading && model.recentAssets.length == 0">
        <p class="center">You have no recent assets for this identity.</p>
      </div>
    </div>
  
    <div class="section section-recent-listings span6">
      <h3 class="headline">Recent Listings</h3>
      
      <table class="table table-condensed" data-ng-show="state.listings.loading || model.recentListings.length > 0">
        <thead>
          <tr>
            <th class="date">Date</th>
            <th class="name">Title</th>
            <th class="name">Creator</th>
            <th class="action">Action</th>
          </tr>
        </thead>
        <tbody>
          <tr data-ng-repeat="listing in model.recentListings" class="listing"
            data-fadein="listing.added" data-fadeout="listing.deleted">
            <!-- Date -->
            <td>
              <span class="date">{{listing.asset.created | date:'medium'}}</span>
            </td>
            <!-- Title -->
            <td>
              <span class="name">{{listing.asset.title}}</span>
            </td>
            <!-- Creator -->
            <td>
              <span class="name">{{listing.asset.creator.fullName}}</span>
            </td>
          </tr>
        </tbody>
        <tfoot>
          <tr data-ng-show="state.listings.loading">
            <td colspan="3" style="text-align: center">
              <span class="center">
                <span data-spinner="state.listings.loading" data-spinner-class="table-spinner"></span>
              </span>
            </td>
          </tr>
        </tfoot>
      </table>
      <div data-ng-show="!state.listings.loading && model.recentListings.length == 0">
        <p class="center">You have no recent listings for this identity.</p>
      </div>
    </div>
  </div>
  
  <!-- Delete asset alert -->
  <div data-modal-alert="showDeleteAssetAlert"
    data-modal-header="Warning"
    data-modal-ok="Delete"
    data-modal-cancel="Cancel"
    data-modal-on-close="confirmDeleteAsset(err, result)">
    <div>
      <p>Are you sure that you want to delete this asset?</p>
      <div>FIXME: display asset</div>
    </div>
  </div>
  
  <!-- Delete listing alert -->
  <div data-modal-alert="showDeleteListingAlert"
    data-modal-header="Warning"
    data-modal-ok="Delete"
    data-modal-cancel="Cancel"
    data-modal-on-close="confirmDeleteListing(err, result)">
    <div>
      <p>Are you sure that you want to delete this listing?</p>
      <div>FIXME: display listing</div>
    </div>
  </div>

  <!-- Modals -->
  <div data-modal-add-asset="model.modals.showAddAsset"></div>
  <div data-modal-protect-asset="model.modals.showProtectAsset"
    data-asset="model.modals.asset"></div>
  <div data-modal-add-listing="model.modals.showAddListing"
    data-asset="model.modals.asset"></div>

</div>
{{/verbatim}}

{{partial "demo-warning.tpl"}}

{{partial "foot.tpl"}}
