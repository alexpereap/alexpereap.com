import express from 'express';
import expressLayouts from 'express-ejs-layouts'

const path = require('path');
const PORT = process.env.PORT || 3006;
const app = express();

app.use(express.static('./dist'));
app.set('view engine', 'ejs');
app.use(expressLayouts);

app.get('/', (req, res) => {
  res.render('home');
});

app.listen(PORT, () => {
  console.log(`😎 Server is listening on port ${PORT}`);
});
