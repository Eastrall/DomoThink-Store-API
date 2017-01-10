/**
 * devices.js
 * Managing objects
 *
 */

import logger from './../modules/logger';
import httpCode from './../modules/httpCode';
import dbModels from './../models/DBModels';

class Update {

  /**
   * /get route for update
   *
   * @param {object} req The incoming request.
   * @param {object} res The outgoing result.
   * @returns {object} codeode The success/error code
   */
  get(req, res) {
    dbModels.ApiVersion.one({},
      (err, apiversion) => {
        if (err) {
          return httpCode.error500(res, "Impossible to get version");
        } else if (!apiversion) { // eslint-disable-line no-negated-condition
          return httpCode.error404(res, "Api version not found");
        }
        logger.notice(`Getting api version`);
        return res.json(Object.assign({}, {version: apiversion.version}));
      });
  }

  /**
   * /post route for update
   *
   * @param {object} req The incoming request. Password and new version are in the req.body
   * @param {object} res The outgoing result.
   * @returns {object} codeode The success/error code
   */
  post(req, res) {
    dbModels.ApiVersion.one({},
      (err, apiversion) => {
        if (err) {
          return httpCode.error500(res, "Impossible to post version");
        } else if (!apiversion) { // eslint-disable-line no-negated-condition
          return httpCode.error404(res, "Api version not found");
        } else if (req.body.password !== apiversion.password) { // eslint-disable-line no-negated-condition
          return httpCode.error403(res, "You're not allowed to do this");
        }
        console.log('Api version', apiversion);
        apiversion.save(req.body, err => {
          return (err ?
            httpCode.error500(res, 'Error: Could not update version') :
            httpCode.success(res, `Version updated to ${req.body.version} !`)
          );
        });
        logger.notice(`Updating plugin {${req.body.idPlugin}}`);
      });
  }

}

const update = new Update();

export default update;
