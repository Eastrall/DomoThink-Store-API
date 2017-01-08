/**
 * DBModels.js
 * Defines the database models.
 *
 */

let instance = null;

class Models {
  constructor() {
    if (!instance)
      instance = this;
    return instance;
  }

  setDb(db) { // Need to be called at the beginning
    this.db = db;
  }

  defineModels() {
    this.defineStorePlugins();
    this.defineStorePluginComments();
  }

  defineStorePlugins() {
    this.StorePluginsModel = this.db.define('storeplugins', {
      idPlugin: {type: 'serial', key: true},
      name: {type: 'text'},
      repository: {type: 'text'},
      language: {type: 'text'},
      date: {type: "date", time: false},
      keyLoginHash: {type: 'text'}
    });
  }

  defineStorePluginComments() {
    this.StorePluginCommentsModel = this.db.define('storeplugincomments', {
      idComment: {type: 'serial', key: true},
      author: {type: 'text'},
      rate: {type: 'number'},
      comment: {type: 'text'},
      date: {type: "date", time: false},
      storeplugins_idPlugin: {type: 'number'}, // eslint-disable-line camelcase
      keyLoginHash: {type: 'text'}
    });
    this.StorePluginCommentsModel.hasOne('storeplugins', this.StorePluginsModel, {reverse: "storeplugincomments"});
  }
}

const DBModels = new Models();

export default DBModels;
