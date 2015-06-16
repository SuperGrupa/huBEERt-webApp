ENV = require('../../../config/development.json').constants.ENV

module.exports =
  baseURL: ENV.API_URL
