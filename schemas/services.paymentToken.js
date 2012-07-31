var label = require('./label');
var creditCard = require('./creditCard');
var bankAccount = require('./bankAccount');
var jsonldContext = require('./jsonldContext');

var postPaymentTokens = {
  type: 'object',
  properties: {
    '@context': jsonldContext(),
    label: label(),
    paymentGateway: {
      type: 'string',
      minLength: 1,
      errors: {
        missing: 'No payment gateway was specified.'
      }
    },
    source: {
      type: [creditCard, bankAccount]
    }
  },
  additionalProperties: false
};

module.exports.postPaymentTokens = function() {
  return postPaymentTokens;
};
