var bedrock = require('bedrock');
var tools = bedrock.tools;

var schema = {
  required: true,
  title: 'Validity interval',
  description: 'The interval during which a budget is valid.',
  type: 'string',
  pattern: '^([2-9][0-9]{3}-(0[1-9]|1[0-2])-([0-2][0-9]|3[0-1])T([0-1][0-9]|2[0-3]):([0-5][0-9]):(([0-5][0-9])|60)(\\.[0-9]+)?(Z|((\\+|-)([0-1][0-9]|2[0-3]):([0-5][0-9])))?)|(R(\\d+)?\\/[2-9][0-9]{3}-(0[1-9]|1[0-2])-([0-2][0-9]|3[0-1])T([0-1][0-9]|2[0-3]):([0-5][0-9]):(([0-5][0-9])|60)(\\.[0-9]+)?(Z|((\\+|-)([0-1][0-9]|2[0-3]):([0-5][0-9])))?\\/P((\\d+Y)?(\\d+M)?(\\d+W)?(\\d+D)?)?(T(\\d+H)?(\\d+M)?(\\d+S)?)?)$',
  errors: {
    invalid: 'Please enter a valid validity interval.',
    missing: 'Please enter a validity interval.'
  }
};

module.exports = function(extend) {
  if(extend) {
    return tools.extend(true, tools.clone(schema), extend);
  }
  return schema;
};
