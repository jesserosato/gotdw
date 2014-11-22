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
  var formDataPromises = [];
  var formDataSql = "SELECT * FROM ??";
  DIMENSIONS.forEach(function(dimension) {
    formDataPromises.push(qQuery(mysql.format(formDataSql, [dimension])));
  });
  q.all(formDataPromises).then(function(data) {
    var form = buildForm(data, req.query);
    if (req.query.submitted) {
      var sql = generateSQL(req.query);
      qQuery(sql).then(function(results) {
        res.render('index', { title: title, form: form, results: results });
      }, renderError);
    } else {
      res.render('index', { title: title, form: form });
    }
  }, renderError);

  function renderError(error)
  {
    res.status(500).render('error', { error: error });
  }
});

/**
 * Generate an SQL query string based on request parameters
 * @param query
 * @returns {*}
 */
function generateSQL(query)
{
  // TODO: Use COUNT(*) instead of *
  // age, gender, status, affiliation, region, religion
  var sql = "SELECT * FROM facts,characters WHERE characters.id = facts.character_id";
  if (isSet(query.age) || isSet(query.gender) || isSet(query.dead) || isSet(query.affiliation) || isSet(query.region) || isSet(query.religion)) {
    sql += " AND ";
  }
  sql  += generateAgeClause(query)
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
    var clause = "facts.affiliation_id = " + connection.escape(query.affiliation);
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
    var clause = "facts.region_id = " + connection.escape(query.region);
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
    return "facts.religion_id = " + connection.escape(query.region);
  }
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
    options[index].selected = option.id == selected;
  });
  return options;
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

module.exports = router;
