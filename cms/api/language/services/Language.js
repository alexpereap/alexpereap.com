/* global Language */
'use strict';

/**
 * Language.js service
 *
 * @description: A set of functions similar to controller's actions to avoid code duplication.
 */

// Public dependencies.
const _ = require('lodash');

// Strapi utilities.
const utils = require('strapi-hook-bookshelf/lib/utils/');
const { convertRestQueryParams, buildQuery } = require('strapi-utils');


module.exports = {

  /**
   * Promise to fetch all languages.
   *
   * @return {Promise}
   */

  fetchAll: (params, populate) => {
    // Select field to populate.
    const withRelated = populate || Language.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    const filters = convertRestQueryParams(params);

    return Language.query(buildQuery({ model: Language, filters }))
      .fetchAll({ withRelated })
      .then(data => data.toJSON());
  },

  /**
   * Promise to fetch a/an language.
   *
   * @return {Promise}
   */

  fetch: (params) => {
    // Select field to populate.
    const populate = Language.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    return Language.forge(_.pick(params, 'id')).fetch({
      withRelated: populate
    });
  },

  /**
   * Promise to count a/an language.
   *
   * @return {Promise}
   */

  count: (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = convertRestQueryParams(params);

    return Language.query(buildQuery({ model: Language, filters: _.pick(filters, 'where') })).count();
  },

  /**
   * Promise to add a/an language.
   *
   * @return {Promise}
   */

  add: async (values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Language.associations.map(ast => ast.alias));
    const data = _.omit(values, Language.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = await Language.forge(data).save();

    // Create relational data and return the entry.
    return Language.updateRelations({ id: entry.id , values: relations });
  },

  /**
   * Promise to edit a/an language.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Language.associations.map(ast => ast.alias));
    const data = _.omit(values, Language.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = await Language.forge(params).save(data);

    // Create relational data and return the entry.
    return Language.updateRelations(Object.assign(params, { values: relations }));
  },

  /**
   * Promise to remove a/an language.
   *
   * @return {Promise}
   */

  remove: async (params) => {
    params.values = {};
    Language.associations.map(association => {
      switch (association.nature) {
        case 'oneWay':
        case 'oneToOne':
        case 'manyToOne':
        case 'oneToManyMorph':
          params.values[association.alias] = null;
          break;
        case 'oneToMany':
        case 'manyToMany':
        case 'manyToManyMorph':
          params.values[association.alias] = [];
          break;
        default:
      }
    });

    await Language.updateRelations(params);

    return Language.forge(params).destroy();
  },

  /**
   * Promise to search a/an language.
   *
   * @return {Promise}
   */

  search: async (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = strapi.utils.models.convertParams('language', params);
    // Select field to populate.
    const populate = Language.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    const associations = Language.associations.map(x => x.alias);
    const searchText = Object.keys(Language._attributes)
      .filter(attribute => attribute !== Language.primaryKey && !associations.includes(attribute))
      .filter(attribute => ['string', 'text'].includes(Language._attributes[attribute].type));

    const searchInt = Object.keys(Language._attributes)
      .filter(attribute => attribute !== Language.primaryKey && !associations.includes(attribute))
      .filter(attribute => ['integer', 'decimal', 'float'].includes(Language._attributes[attribute].type));

    const searchBool = Object.keys(Language._attributes)
      .filter(attribute => attribute !== Language.primaryKey && !associations.includes(attribute))
      .filter(attribute => ['boolean'].includes(Language._attributes[attribute].type));

    const query = (params._q || '').replace(/[^a-zA-Z0-9.-\s]+/g, '');

    return Language.query(qb => {
      if (!_.isNaN(_.toNumber(query))) {
        searchInt.forEach(attribute => {
          qb.orWhereRaw(`${attribute} = ${_.toNumber(query)}`);
        });
      }

      if (query === 'true' || query === 'false') {
        searchBool.forEach(attribute => {
          qb.orWhereRaw(`${attribute} = ${_.toNumber(query === 'true')}`);
        });
      }

      // Search in columns with text using index.
      switch (Language.client) {
        case 'mysql':
          qb.orWhereRaw(`MATCH(${searchText.join(',')}) AGAINST(? IN BOOLEAN MODE)`, `*${query}*`);
          break;
        case 'pg': {
          const searchQuery = searchText.map(attribute =>
            _.toLower(attribute) === attribute
              ? `to_tsvector(${attribute})`
              : `to_tsvector('${attribute}')`
          );

          qb.orWhereRaw(`${searchQuery.join(' || ')} @@ to_tsquery(?)`, query);
          break;
        }
      }

      if (filters.sort) {
        qb.orderBy(filters.sort.key, filters.sort.order);
      }

      if (filters.skip) {
        qb.offset(_.toNumber(filters.skip));
      }

      if (filters.limit) {
        qb.limit(_.toNumber(filters.limit));
      }
    }).fetchAll({
      withRelated: populate
    });
  }
};
