const Category = (sequelize, type) => {
  return sequelize.define('categories', {
      id: {
        type: type.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      name: type.STRING,
      slug: type.STRING,
      class: type.STRING,
      created_at: type.DATE,
  },{
    timestamps: false,
  });
};

module.exports = Category;
