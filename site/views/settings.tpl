${set([
  pageTitle = "Identity Settings",
  jsList.push("common/scripts/settings"),
  jsList.push("common/scripts/modals.add-address"),
  jsList.push("common/scripts/modals.add-payment-token"),
  inav = "settings"
])}

{{partial "site/head.tpl"}}
{{partial "modals/add-address.tpl"}}
{{partial "modals/add-payment-token.tpl"}}

{{verbatim}}
<div class="container ng-cloak" data-ng-app="settings"
  data-ng-controller="SettingsCtrl">
  
  <div class="row">
    <div class="span12">
      <h1 class="headline">Settings</h1>
      <h3 class="subheadline">Configure your stuff</h3>
      <hr />
    </div>
  </div>
  
  <div class="tabbable tabs-left">
    <ul class="nav nav-tabs">
      <li class="active"><a href="#external-accounts" data-toggle="tab">External Accounts</a></li>
      <li><a href="#address" data-toggle="tab">Address</a></li>
    </ul>
    <div class="tab-content">
      <!-- External Accounts Tab -->
      <div class="container-fluid tab-pane active"
        id="external-accounts"
        data-ng-controller="ExternalAccountsCtrl">
        <div class="row-fluid">
          <div class="span12">
            <h3 class="headline">Credit Cards</h3>
            <table class="table table-condensed" data-ng-show="loading || creditCards.length > 0">
              <thead>
                <tr>
                  <th class="name">Name</th>
                  <th class="name">Brand</th>
                  <th class="name">Number</th>
                  <th>Expiration</th>
                  <th class="action">Delete</th>
                </tr>
              </thead>
              <tbody>
                <tr data-ng-repeat="card in creditCards">
                  <!-- Name -->
                  <td>
                    <span>{{card.label}}</span>
                  </td>
                  <!-- Brand -->
                  <td>
                    <span><i class="{{card.cardBrand|cardBrand:true}}"></i></span>
                  </td>
                  <!-- Number -->
                  <td>
                    <span>{{card.cardNumber}}</span>
                  </td>
                  <!-- Expiration -->
                  <td>
                    <span>{{card.cardExpMonth}} / {{card.cardExpYear}}</span>
                  </td>
                  <!-- Delete -->
                  <td class="action">
                    <button class="btn btn-danger" title="Delete" data-ng-click="deleteCard(card)"><i class="icon-remove icon-white"></i></button>
                  </td>
                </tr>
              </tbody>
              <tfoot data-ng-show="loading">
                <tr>
                  <td colspan="5" style="text-align: center">
                    <span class="center">
                      <span data-spinner="loading" data-spinner-class="table-spinner"></span>
                    </span>
                  </td>
                </tr>
              </tfoot>
            </table>
            <div data-ng-show="!loading && creditCards.length == 0">
              <p class="center">You have no credit cards associated with this identity.</p>
            </div>
          </div>
        </div>
        
        <!-- Separator -->
        <div class="row-fluid">
          <div class="span12">
          </div>
        </div>
        
        <div class="row-fluid">
          <div class="span12">
            <h3 class="headline">Bank Accounts</h3>
            <table class="table table-condensed" data-ng-show="loading || bankAccounts.length > 0">
              <thead>
                <tr>
                  <th class="name">Name</th>
                  <th class="name">Number</th>
                  <th class="name">Routing</th>
                  <th class="action">Delete</th>
                </tr>
              </thead>
              <tbody>
                <tr data-ng-repeat="bankAccount in bankAccounts">
                  <!-- Name -->
                  <td>
                    <span>{{bankAccount.label}}</span>
                  </td>
                  <!-- Number -->
                  <td>
                    <span>{{bankAccount.bankAccount}}</span>
                  </td>
                  <!-- Routing -->
                  <td>
                    <span>{{bankAccount.bankRoutingNumber}}</span>
                  </td>
                  <!-- Delete -->
                  <td class="action">
                    <button class="btn btn-danger" title="Delete" data-ng-click="deleteBankAccount(card)"><i class="icon-remove icon-white"></i></button>
                  </td>
                </tr>
              </tbody>
              <tfoot data-ng-show="loading">
                <tr>
                  <td colspan="4" style="text-align: center">
                    <span class="center">
                      <span data-spinner="loading" data-spinner-class="table-spinner"></span>
                    </span>
                  </td>
                </tr>
              </tfoot>
            </table>
            <div data-ng-show="!loading && bankAccounts.length == 0">
              <p class="center">You have no bank accounts associated with this identity.</p>
            </div>
          </div>
        </div>
        
        <div class="row-fluid">
          <div class="span12">
            <button id="button-add-token" data-ng-hide="loading" class="btn btn-success" data-ng-click="addToken()"><i class="icon-plus icon-white"></i> Add External Account</button>
          </div>
        </div>
      </div>
      <!-- End External Accounts Tab -->
      
      <!-- Address Tab -->
      <div class="container-fluid tab-pane"
        id="address"
        data-ng-controller="AddressCtrl">
        <div class="row-fluid" data-ng-repeat="address in addresses">
          <div class="span12">
            <h3 class="headline">Addresses</h3>
            <ul class="unstyled">
              <li>{{address.label}}</li>
              <li>{{address.fullName}}</li>
              <li>{{address.streetAddress}}</li>
              <li>{{address.locality}}, {{address.region}} {{address.postalCode}}<li>
              <li>{{address.countryName}}</li>
            </ul>
          </div>
        </div>
      </div>
      <!-- End Address Tab -->
    </div>
  </div>

</div>
{{/verbatim}}

{{! mode warning }}
{{if productionMode == false}}
<hr />
<div class="alert alert-info">
  <strong>NOTE:</strong> This is a demonstration website that does not use real money. Please do not enter any sensitive personal information. [<a href="http://payswarm.com/wiki/Demo_Warning">more info...</a>]
</div>
{{/if}}

{{partial "site/foot.tpl"}}
