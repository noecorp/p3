var bedrock = require('bedrock');
var schemas = bedrock.validation.schemas;

var postIdentifier = {
  type: [{
    type: 'object',
    properties: {
      type: {
        required: true,
        type: 'string',
        enum: ['Identity']
      },
      sysSlug: schemas.slug()
    },
    additionalProperties: false
  }, {
    type: 'object',
    properties: {
      type: {
        required: true,
        type: 'string',
        enum: ['FinancialAccount']
      },
      owner: {
        required: true,
        type: schemas.url()
      },
      sysSlug: schemas.slug()
    },
    additionalProperties: false
  }, {
    type: 'object',
    properties: {
      type: {
        required: true,
        type: 'string',
        enum: ['email']
      },
      email: schemas.email()
    },
    additionalProperties: false
  }]
};

module.exports.postIdentifier = function() {
  return postIdentifier;
};
