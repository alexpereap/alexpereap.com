import express from 'express';
import expressLayouts from 'express-ejs-layouts';
import Sequelize from 'sequelize';
import excerptHtml from 'excerpt-html';

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

const PostModel = require('./models/Post');
const Post = PostModel(sequelize, Sequelize);

app.use(express.static('./dist'));
app.set('view engine', 'ejs');
app.use(expressLayouts);

app.locals.blog_articles_menu = [];

async function server(){
  app.locals.blog_articles_menu = await Category.findAll();

  app.get('/', async (req, res) => {
    const posts = await sequelize.query(`SELECT p.*, c.name as category_name, c.slug as category_slug, c.class as category_class
                                         FROM posts p INNER JOIN categories c ON p.category = c.id`, { type: sequelize.QueryTypes.SELECT});

    posts.forEach( (post, index) => {
      switch(post.category_class){
        case 'nav-elipse-red':
          posts[index].article_class = 'red-article';
          break;

        case 'nav-elipse-yellow':
          post.article_class = 'yellow-article';
          break;

        case 'nav-elipse-light-green':
          post.article_class = 'light-green-article';
          break;

        case 'nav-elipse-light-purple':
          post.article_class = 'purple-article';
          break;

        case 'nav-elipse-blue':
          post.article_class = 'blue-article';
          break;

        case 'nav-elipse-dark-grey':
          post.article_class = 'dark-grey-article';
          break;
      }

      post.excerpt = excerptHtml(post.content_en,{pruneLength: 500});
    });

    res.render('home', {posts: posts});
  });
}

server().then( () =>{
  app.listen(PORT, () => {
    console.log(`😎 Server is listening on port ${PORT}`);
  });
});
