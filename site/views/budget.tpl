${set(
  pageTitle = "Budget Details",
  jsList.push("modules/budget")
)}
{{partial "head.tpl"}}

<div class="row">
  <h2 class="headline">${pageTitle}</h2>
</div>

{{verbatim}}
<div data-ng-controller="BudgetCtrl" class="ng-cloak">

<table class="table table-condensed table-hover">
<tr>
  <td>Id</td>
  <td>{{budget.id}}</td>
</tr>
<tr>
  <td>Label</td>
  <td>{{budget.label}}</td>
</tr>
<tr>
  <td>Total Amount</td>
  <td class="money">
    <span class="currency">USD</span>
    <span class="money right" title="USD ${{budget.amount}}">
      {{budget.amount | floor | currency:'$'}}
    </span>
  </td>
</tr>
<tr>
  <td>Current Balance</td>
  <td class="money">
    <span class="currency">USD</span>
    <span class="money right" title="USD ${{budget.balance}}">
      {{budget.balance | floor | currency:'$'}}
    </span>
  </td>
</tr>
<tr>
  <td>Max Per Use</td>
  <td class="money">
    <span class="currency">USD</span>
    <span class="money right" title="USD ${{budget.psaMaxPerUse}}">
      {{budget.psaMaxPerUse | floor | currency:'$'}}
    </span>
  </td>
</tr>
<tr>
  <td>Refill</td>
  <td data-ng-switch="getRefreshDuration(budget)">
    <span data-ng-switch-when="never">Never</span>
    <span data-ng-switch-when="PT1H">Hourly</span>
    <span data-ng-switch-when="P1D">Daily</span>
    <span data-ng-switch-when="P1W">Weekly</span>
    <span data-ng-switch-when="P1M">Monthly</span>
    <span data-ng-switch-when="P1Y">Yearly</span>
  </td>
</tr>
<tr>
  <td>Last Refreshed</td>
  <td>{{getLastRefresh(budget) | date:'medium'}}</td>
</tr>
<tr>
  <td>Expires</td>
  <td data-ng-switch="getExpiration(budget)">
    <span data-ng-switch-when="never">Never</span>
    <span data-ng-switch-default>{{getExpiration(budget) | date:'medium'}}</span>
  </td>
</tr>
<tr>
  <td>Source</td>
  <td>
    <div data-account-selector data-selected="account"
      data-invalid="invalidAccount" data-fixed="true"></div>
  </td>
</tr>
<tr>
  <td>Vendors</td>
  <td data-ng-show="state.loading || budget.vendor.length > 0">
    <table class="table table-condensed">
      <thead>
        <tr>
          <th class="name">Vendor</th>
          <th class="name">Website</th>
          <th class="action">Delete</th>
        </tr>
      </thead>
      <tbody>
        <tr data-ng-repeat="vendor in vendors[budget.id].vendors | orderBy:'label'"
          class="vendor" data-fadeout="vendor.deleted">
          <!-- Label -->
          <td class="name">
            <a href="{{vendor.id}}">{{vendor.label || vendor.id}}</a>
          </td>
          <td class="name">
            <a data-ng-show="vendor.website" href="{{vendor.website}}">{{vendor.website}}</a>
            <span data-ng-hide="vendor.website">&nbsp;</span>
          </td>
          <!-- Delete -->
          <td class="action">
            <button class="btn btn-danger" title="Delete" data-ng-click="deleteVendor(vendor)"><i class="icon-remove icon-white"></i></button>
          </td>
        </tr>
      </tbody>
      <tfoot data-ng-show="state.loading">
        <tr>
          <td colspan="5" style="text-align: center">
            <span class="center">
              <span data-spinner="state.loading" data-spinner-class="table-spinner"></span>
            </span>
          </td>
        </tr>
      </tfoot>
    </table>
  </td>
  <td data-ng-show="!state.loading && budget.vendor.length == 0">
    You have no vendors configured for this budget.
  </td>
</table>

<!-- Delete vendor alert -->
<div data-modal-alert="showDeleteVendorAlert"
  data-modal-header="Warning"
  data-modal-ok="Delete"
  data-modal-cancel="Cancel"
  data-modal-on-close="confirmDeleteVendor(err, result)">
  <div>
    <p>Are you sure that you want to remove this vendor from the budget?</p>
    <table class="table table-condensed">
      <thead>
        <tr>
          <th class="name">Vendor</th>
          <th class="name">Website</th>
        </tr>
      </thead>
      <tbody>
        <tr class="vendor">
          <!-- Label -->
          <td class="name">
            <a href="{{vendorToDelete.id}}">{{vendorToDelete.label || vendorToDelete.id}}</a>
          </td>
          <td class="name">
            <a data-ng-show="vendorToDelete.website" href="{{vendorToDelete.website}}">{{vendorToDelete.website}}</a>
            <span data-ng-hide="vendorToDelete.website">&nbsp;</span>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>    

</div>
{{/verbatim}}

{{partial "foot.tpl"}}
