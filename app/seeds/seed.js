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

const mongoose = require('mongoose');
const Post = require('../models/post');
const faker = require('faker');

// Connect to the database
async function connectToDatabase() {
  if (process.env.DB_HOST) {
    try {
      await mongoose.connect(process.env.DB_HOST, {
        useNewUrlParser: true,
        useUnifiedTopology: true,
      });
      console.log('Database connected');
      await seedDatabase(); // Call the seed function if needed
    } catch (err) {
      console.error('Database connection error:', err);
    } finally {
      mongoose.connection.close();
    }
  }
}

// Seed the database
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
    console.log('Database Seeded');
  } catch (err) {
    console.error('Error seeding database:', err);
  }
}

connectToDatabase();