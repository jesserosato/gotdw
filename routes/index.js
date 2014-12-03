var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var q = require('q');
var title = 'CSC177 Data Warehouse Project';
var dotenv = require('dotenv');
dotenv.load();
var connection = mysql.createConnection({
  host     : process.env.DB_HOST,
  database : process.env.DB_NAME,
  user     : process.env.DB_USER,
  password : process.env.DB_PASSWORD
});
var DIMENSIONS = ['religions', 'regions', 'affiliations', 'books'];

/* GET home page. */
router.get('/', function(req, res) {
  var output = { title: title };
  q.all(getFormData())
    .then(function(formData) {
      output.form = buildForm(formData, req.query);
      return getResults(req.query);
    }, renderError)
    .then(function(results) {
      if (req.query.submitted) {
        output.results                = {};
        output.results.averageAge     = results[0] ? results[0][0]["AVG(characters.age)"].toString().substr(0, 5) : null;
        output.results.bloodiestBook  = results[1].length ? results[1][0].name : null;
        output.results.characters        = results[2];
      }
      res.render('index', output);
    }, renderError);

  function renderError(error)
  {
    res.status(500).render('error', { error: error });
  }
});

/**
 * Generate an array of promises for data to populate the form's menus.
 * @returns {Array}
 */
function getFormData()
{
  var formDataPromises = [];
  var formDataSql = "SELECT * FROM ??";
  DIMENSIONS.forEach(function(dimension) {
    formDataPromises.push(qQuery(mysql.format(formDataSql, [dimension])));
  });
  return formDataPromises;
}

/**
 * Update form data with empty elements and selected values
 * @param data
 * @param query
 * @returns {{}}
 */
function buildForm(data, query)
{
  var formData = {};
  formData.religions    = data[0];
  formData.religions.push({ id: '', name: 'Any' });
  formData.regions      = data[1];
  formData.regions.push({ id: '', name: 'Any' });
  formData.affiliations = data[2];
  formData.affiliations.push({ id: '', name: 'Any' });
  formData.books        = data[3];
  formData.books.push({ id: '', name: 'Any' });
  formData.genders      = [
    {
      id: 0,
      name: 'Female'
    },
    {
      id: 1,
      name: 'Male'
    },
    {
      id: '',
      name: 'Either'
    }
  ];
  formData.ages         = [
    {
      id: 0,
      name: '0-10'
    },
    {
      id: 1,
      name: '10-20'
    },
    {
      id: 2,
      name: '20-30'
    },
    {
      id: 3,
      name: '30-40'
    },
    {
      id: 4,
      name: '40-50'
    },
    {
      id: 5,
      name: '50-60'
    },
    {
      id: 6,
      name: '60+'
    },
    {
      id: '',
      name: 'Any'
    }
  ];
  formData.deads      = [
    {
      id: 0,
      name: 'Alive'
    },
    {
      id: 1,
      name: 'Dead'
    },
    {
      id: '',
      name: 'Either'
    }
  ];
  if (query.submitted) {
    formData.religions    = setSelected(formData.religions, query.religion);
    formData.regions      = setSelected(formData.regions, query.region);
    formData.affiliations = setSelected(formData.affiliations, query.affiliation);
    formData.books        = setSelected(formData.books, query.book);
    formData.genders      = setSelected(formData.genders, query.gender);
    formData.ages         = setSelected(formData.ages, query.age);
    formData.dead         = setSelected(formData.deads, query.dead);
  }
  return formData;
}

/**
 * Set the selected element in a group of options based on submitted form data.
 * @param options
 * @param selected
 * @returns {*}
 */
function setSelected(options, selected)
{
  options.forEach(function(option, index) {
    options[index].selected = false;
    if (option.id == selected) {
      options[index].selected = true;
      options.selected = options[index];
    }
  });
  return options;
}

/**
 * Retrieve query results from the database.
 * @returns {Q.Promise}
 */
function getResults(query)
{
  var deferred = q.defer();
  if (query.submitted) {
    var resultsPromises = [];
    resultsPromises.push(qQuery(getAverageAgeSQL(query)));
    resultsPromises.push(qQuery(getBloodiestBookSQL(query)));
    resultsPromises.push(qQuery(getCharactersSQL(query)));
    return q.all(resultsPromises);
  }
  deferred.resolve();
  return deferred.promise;
}

/**
 * Generate an SQL query string for the average age of characters based on request parameters
 * @param query
 * @returns {*}
 */
function getAverageAgeSQL(query)
{
  var sql = "SELECT AVG(characters.age)"
    + " FROM " + getFromClause(query)
    + " WHERE characters.id = facts.character_id" + getWhereClause(query)
  return sql;
}

/**
 * Generate an SQL string for the average age of characters based on
 * @param query
 * @returns {string}
 */
function getBloodiestBookSQL(query)
{
  var sql = "SELECT books.name, COUNT(books.id) `bookcount`"
    + " FROM " + getFromClause(query)
    + " WHERE characters.id = facts.character_id AND facts.is_dead = 1 AND facts.book_id = books.id AND books.id > 2" + getWhereClause(query)
    + " GROUP BY books.id"
    + " ORDER BY bookcount"
    + " LIMIT 1";
  return sql;
}

/**
 * Generate an SQL query string to retrieve transaction level data
 * @param query
 */
function getCharactersSQL(query)
{
  var attributes = ['characters.name', 'characters.age', 'facts.is_dead'];
  if (isSet(query.affiliation)) {
    attributes.push('affiliations.id');
  }
  if (isSet(query.region)) {
    attributes.push('regions.id');
  }
  if (isSet(query.religion)) {
    attributes.push('religions.id');
  }
  var sql = "SELECT DISTINCT " + attributes.join(', ')
  + " FROM " + getFromClause(query)
  + " WHERE characters.id = facts.character_id" + getWhereClause(query)
  + " ORDER BY characters.name";
  return sql;
}

/**
 * Generate the FROM clause on SQL string based on the query parameters
 * @param query
 * @returns {string}
 */
function getFromClause(query)
{
  var tables = ['facts', 'characters', 'books'];
  if (isSet(query.affiliation)) {
    tables.push('affiliations');
  }
  if (isSet(query.region)) {
    tables.push('regions');
  }
  if (isSet(query.religion)) {
    tables.push('religions');
  }
  return tables.join(', ');
}

/**
 * Generate the WHERE clause of an SQL string based on the query parameters
 * @param query
 * @returns {string}
 */
function getWhereClause(query)
{
  var sql = "";
  if (isSet(query.age) || isSet(query.gender) || isSet(query.dead) || isSet(query.affiliation) || isSet(query.region) || isSet(query.religion)) {
    sql += " AND ";
  }
  sql += generateAgeClause(query)
  + generateGenderClause(query)
  + generateDeadClause(query)
  + generateAffiliationClause(query)
  + generateRegionClause(query)
  + generateReligionClause(query);
  return sql;
}

/**
 * Generate the SQL clause for specifying chracter age.
 * @param query
 * @returns {string}
 */
function generateAgeClause(query)
{
  var clause;
  switch(parseInt(query.age)) {
    case 0:
      clause = "characters.age < 10";
      break;
    case 1:
      clause = "characters.age >= 10 AND characters.age < 20";
      break;
    case 2:
      clause = "characters.age >= 20 AND characters.age < 30";
      break;
    case 3:
      clause = "characters.age >= 30 AND characters.age < 40";
      break;
    case 4:
      clause = "characters.age >= 40 AND characters.age < 50";
      break;
    case 5:
      clause = "characters.age >= 50 AND characters.age < 60";
      break;
    case 6:
      clause = "characters.age >= 60";
      break;
    default:
      return "";
  }
  if (isSet(query.gender) || isSet(query.dead) || isSet(query.affiliation) || isSet(query.region) || isSet(query.religion)) {
    clause += " AND ";
  }
  return clause;
}

/**
 * Generate the SQL clause for specifying gender.
 * @param query
 * @returns {string}
 */
function generateGenderClause(query)
{
  if ( ! isSet(query.gender)) {
    return "";
  }  else {
    var clause = "characters.gender = " + connection.escape(query.gender);
    if (isSet(query.dead) || isSet(query.affiliation) || isSet(query.region) || isSet(query.religion)) {
      clause += " AND ";
    }
    return clause;
  }
}

/**
 * Generate the SQL clause for specifying dead/alive.
 * @param query
 * @returns {string}
 */
function generateDeadClause(query)
{
  if ( ! isSet(query.dead)) {
    return "";
  } else {
    var clause = "facts.is_dead = " + connection.escape(query.dead);
    if (isSet(query.affiliation) || isSet(query.region) || isSet(query.religion)) {
      clause += " AND ";
    }
    return clause;
  }
}

/**
 * Generate the SQL clause for specifying an affiliation.
 * @param query
 * @returns {string}
 */
function generateAffiliationClause(query)
{
  if (!isSet(query.affiliation)) {
    return "";
  } else {
    var clause = "facts.affiliation_id = " + connection.escape(query.affiliation)  + " AND facts.affiliation_id = affiliations.id";
    if (isSet(query.region) || isSet(query.religion)) {
      clause += " AND ";
    }
    return clause;
  }
}

/**
 * Generate the SQL clause for specifying a region.
 * @param query
 * @returns {string}
 */
function generateRegionClause(query)
{
  if (!isSet(query.region)) {
    return "";
  } else {
    var clause = "facts.region_id = " + connection.escape(query.region) + " AND facts.region_id = regions.id";
    if (isSet(query.religion)) {
      clause += " AND ";
    }
    return clause;
  }
}

/**
 * Generate the SQL clause for specifying a religon.
 * @param query
 * @returns {string}
 */
function generateReligionClause(query)
{
  if (!isSet(query.religion)) {
    return "";
  } else {
    return "facts.religion_id = " + connection.escape(query.religion) + "AND facts.religion_id = religions.id";
  }
}

/**
 * Promise-style proxy for mysql query
 * @param sql
 * @returns {*}
 */
function qQuery(sql)
{
  var deferred = q.defer();
  connection.query(sql, function(error, results) {
    if (error) {
      deferred.reject(error);
    } else {
      deferred.resolve(results);
    }
  });
  return deferred.promise;
}

/**
 * Whether a parameter is set.
 * @param variable
 * @returns {boolean}
 */
function isSet(variable)
{
  return ( ! (typeof variable === "undefined")) && ( ! (variable === "")) && ( ! (variable === null));
}

module.exports = router;
