const Author = (sequelize, type) => {
  return sequelize.define('authors', {
      id: {
        type: type.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      name: type.STRING,
      role: type.STRING,
      github: type.STRING,
      linkedin: type.STRING,
  },{
    timestamps: false,
  });
};

module.exports = Author;
