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

const PostModel = require('./models/Post');
const Post = PostModel.Post(sequelize, Sequelize);

const TagModel = require('./models/Tag');
const tag = TagModel(sequelize, Sequelize);

const AuthorModel = require('./models/Author');
const author = AuthorModel(sequelize, Sequelize);

const paginator = require('./utils/paginator');

app.use(express.static('./dist'));
app.set('view engine', 'ejs');
app.use(expressLayouts);

app.locals.blog_articles_menu = [];

async function server(){

  // sets catevories in locals variable
  app.locals.blog_articles_menu = await Category.findAll();

  // sets the language
  let lang;

  const middleware = async (req, res, next) => {
    console.log(req.params.lang);
    lang = req.params.lang ? req.params.lang : 'en';
    app.locals.lang = lang;
    app.locals.tags = await tag.findAll({ order: Sequelize.literal('RAND()'), limit: 6 });
    next();
  };

  app.get('/:lang?', middleware, async (req, res) => {
    console.log(lang);
    const posts =  await PostModel.getHomePosts(
      sequelize,
      {
        lang,
        page: req.query.page
      }
    );

    const posts_count = await PostModel.getTotalPosts(sequelize);
    // TODO: change post to be a class, so posts count is a class attribute
    const pagination = paginator(req.query.page, posts_count, 4);
    const author_profile = await author.findOne({
      where:{id:1}
    });

    console.log(author_profile);

    res.render('home', {posts, pagination, author_profile});
  });
}

server().then( () =>{
  app.listen(PORT, () => {
    console.log(`😎 Server is listening on port ${PORT}`);
  });
});
