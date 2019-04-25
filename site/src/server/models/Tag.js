const Tag = (sequelize, type) => {
  return sequelize.define('tags', {
      id: {
        type: type.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      name: type.STRING,
  },{
    timestamps: false,
  });
};

module.exports = Tag;
