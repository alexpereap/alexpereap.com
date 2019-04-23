const path = require('path');
const nodeExternals = require('webpack-node-externals');
const CleanWebpackPlugin = require('clean-webpack-plugin');

module.exports = {
  entry: './src/server/index.js',

  target: 'node',

  externals: [nodeExternals()],

  output: {
    path: path.resolve('dist'),
    filename: 'server.js'
  },

  module: {
    rules: [
      {
        test: /\.js$/,
        use: 'babel-loader'
      }
    ]
  }
};
