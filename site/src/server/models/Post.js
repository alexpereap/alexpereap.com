const excerptHtml = require('excerpt-html');
const format = require('date-format');

const Post = (sequelize, type) => {
  return sequelize.define('posts', {
      id: {
        type: type.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      title_en: type.STRING,
      title_es: type.STRING,
      content_en: type.STRING,
      content_es: type.STRING,
  },{
    timestamps: false,
  });
};

const getHomePosts = async (sequelize, options ) => {

  console.log(options);

  // calculate offset according to current page
  const limit = 4;
  let offset = 0;
  let page = 1;

  if(options.page){
    let page = parseInt(options.page);

    if(! isNaN(page)){
      offset = (page - 1) * 4;
    }
  }


  posts = await sequelize.query(`SELECT p.*, c.name as category_name, c.slug as category_slug, c.class as category_class
                                         FROM posts p INNER JOIN categories c ON p.category = c.id
                                         LIMIT ${offset}, ${limit}`, { type: sequelize.QueryTypes.SELECT});

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


      post.date = format.asString('yyyy-MM-dd', post.created_at);

      // lang

      try{
        switch(options.lang){
          case 'en':
            post.title = post.title_en;
            post.content = post.content_en;
            break;

          case 'es':
            post.title = post.title_es;
            post.content = post.content_es;
            break;
        }
      }catch(err){
        console.log(err);
        post.title = post.title_en;
        post.content = post.content_en;
      }

      post.excerpt = excerptHtml(post.content,{pruneLength: 500});

    });

    return posts;
};

const getTotalPosts = async (sequelize, category) => {
  count = await sequelize.query(`SELECT count(*) as count FROM posts`, { type: sequelize.QueryTypes.SELECT});
  return count[0].count;
};

module.exports = { Post, getHomePosts, getTotalPosts }
