${set([
  pageTitle = "Pricing"
])}
{{partial "head.tpl"}}

<h2>${pageTitle}</h2>

<p>The PaySwarm pricing system is very flexible and each PaySwarm Authority can
set their own pricing models and policies on a site wide basis and adjust and
enforce them for every transaction. The current system is very open and allows
transactions to have details about the full cost breakdown if desired.</p>

<p>The development authority simulates a real authority with the folloing
properties, although many other configurations are possible.</p>

<ul>
<li>All money is in similulated USD but is fake.</li>
<li>Deposits into a PaySwarm account can come from fake credit cards or verified fake bank accounts.</li>
<li>Withdrawals from a PaySwarm account can go to a verified fake bank account.</li>
<li>Fake bank accounts are verified with small deposits. In the real world this can as long as 5 days but the development server will email the fake verification deposits to you.</li>
<li>All fake credit card and fake bank fees are passed on to the account holder.</li>
<li>The PaySwarm Authority takes a small percentage of purchase transactions.</li>
</ul>

<p>The current development authority pricing is as follows:<p>

<table class="table">
  <thead>
    <tr>
      <th>Action</th>
      <th>Amount</th>
      <th>Type</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>PaySwarm Purchase</td>
      <td>2%</td>
      <td><a href="#inclusive">Inclusive</a></td>
    </tr>
    <tr>
      <td>Credit Card Deposit</td>
      <td>2.1867975%</td>
      <td><a href="#exclusive">Exclusive</a></td>
    </tr>
    <tr>
      <td>Bank Account Deposit</td>
      <td>
        <span class="money"><span class="currency">USD</span>$0.50</span>
        + 0.9998010%
      </td>
      <td><a href="#exclusive">Exclusive</a></td>
    </tr>
    <tr>
      <td>Bank Account Withdrawal</td>
      <td>
        <span class="money"><span class="currency">USD</span>$0.50</span>
        + 0.99%
      </td>
      <td><a href="#inclusive">Inclusive</a></td>
    </tr>
  </tbody>
</table>

<p>The pricing is based on PaySwarm Payees which can represent many types of
rates. See the <a href="http://payswarm.com">PaySwarm documentation</a> for the
details. For quick reference, the two types of rates used above are defined
below.</p>

<dl>
  <dt><a name="exclusive">Exclusive</a></dt>
  <dd>Amounts are added to a base amount. For instance, a 2% exclusive credit card deposit fee for a <span class="money">$1</span> deposit would put $1 in your account and charge your credit card <span class="money">$1.02</span>.</dd>
  <dt><a name="inclusive">Inclusive</a></dt>
  <dd>Amounts are included in the base amount. For instance, an authority with a 2% inclusive rate on a <span class="money">$1</span> purchase would debit the buyer <span class="money">$1</span>, credit the authority <span class="money">$0.02</span>, and credit the seller <span class="money">$0.98</span></dd>
</dl>

{{partial "foot.tpl"}}