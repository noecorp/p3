var tools = require('../lib/payswarm-auth/payswarm.tools');

var payswarmId = require('./payswarmId');
var jsonldType = require('./jsonldType');

var schema = {
  required: true,
  title: 'Payment Token',
  description: 'A tokenized source of monetary funds.',
  type: 'object',
  properties: {
    type: jsonldType('com:PaymentToken'),
    owner: payswarmId(),
    paymentToken: {
      required: true,
      type: 'string'
    },
    paymentGateway: {
      required: false,
      type: 'string',
      minLength: 1,
      errorMessage: 'Gateway too short; 1 character minimum.'
    },
    paymentMethod: {
      required: true,
      type: 'string',
      enum: ['ccard:CreditCard', 'bank:BankAccount']
    }
  }
};

module.exports = function(extend) {
  if(extend) {
    return tools.extend(true, tools.clone(schema), extend);
  }
  return schema;
};
