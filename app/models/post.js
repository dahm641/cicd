// var mongoose = require('mongoose');

// var PostSchema = new mongoose.Schema({
//   title: String,
//   body: String
// });

// module.exports = mongoose.model('Post', PostSchema);

const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const PostSchema = new Schema({
  title: { type: String, required: true },
  body: { type: String, required: true },
});

module.exports = mongoose.model('Post', PostSchema);
