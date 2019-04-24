import express from 'express';
import expressLayouts from 'express-ejs-layouts';
import Sequelize from 'sequelize';

const path = require('path');
const PORT = process.env.PORT || 3006;
const app = express();

const sequelize = new Sequelize('alexpereap_node_site', 'alexpereap', 'Williams.Fw14b', {
  host: 'localhost',
  dialect: 'mysql',

  pool: {
    max: 5,
    min: 0,
    idle: 10000
  },
});

const CategoryModel = require('./models/Category');
const Category = CategoryModel(sequelize, Sequelize);

app.use(express.static('./dist'));
app.set('view engine', 'ejs');
app.use(expressLayouts);

app.locals.blog_articles_menu = [];

async function server(){
  app.locals.blog_articles_menu = await Category.findAll();
  app.get('/', (req, res) => {
    res.render('home');
  });
}

server().then( () =>{
  app.listen(PORT, () => {
    console.log(`😎 Server is listening on port ${PORT}`);
  });
});
