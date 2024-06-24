// var Post = require('../models/post');
// var mongoose = require('mongoose');
// var faker = require('faker');

// if(process.env.DB_HOST) {
//   mongoose.connect(process.env.DB_HOST);

//   Post.remove({} , function(){
//     console.log('Database Cleared');
//   });

//   var count = 0;
//   var num_records = 100;

//   for(var i = 0; i < num_records; i++) {
//     Post.create({
//       title: faker.random.words(),
//       body: faker.lorem.paragraphs()
//     }, function(){
//       count++;
//       if(count >= num_records) {
//         mongoose.connection.close();
//         console.log("Database Seeded");
//       }
//     }); 
//   }
// }

const Post = require('../models/post');
const mongoose = require('mongoose');
const faker = require('faker');

if (process.env.DB_HOST) {
  mongoose.connect(process.env.DB_HOST, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  }).then(() => {
    console.log('Database connected');
    seedDatabase();
  }).catch(err => {
    console.error('Database connection error:', err);
  });
}

async function seedDatabase() {
  try {
    await Post.deleteMany({});
    console.log('Database Cleared');

    const num_records = 100;
    const posts = [];

    for (let i = 0; i < num_records; i++) {
      posts.push({
        title: faker.random.words(),
        body: faker.lorem.paragraphs(),
      });
    }

    await Post.insertMany(posts);
    console.log("Database Seeded");
  } catch (err) {
    console.error('Error seeding database:', err);
  } finally {
    mongoose.connection.close();
  }
}
