var tools = require(__libdir + '/payswarm-auth/tools');

var schema = {
  required: true,
  title: 'Password',
  description: 'A secure phrase used to protect information.',
  type: 'string',
  minLength: 6,
  maxLength: 32,
  errors: {
    invalid: 'The password must be between 6 and 32 characters in length.',
    missing: 'Please enter a password.',
    mask: true
  }
};

module.exports = function(extend) {
  if(extend) {
    return tools.extend(true, tools.clone(schema), extend);
  }
  return schema;
};
