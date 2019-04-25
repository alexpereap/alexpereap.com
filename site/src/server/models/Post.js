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

module.exports = Post;
