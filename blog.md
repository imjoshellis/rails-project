# 3 Things I Learned While Building My First Rails App

## Intro

When I started thinking about what to build for my Flatiron School Rails project, I decided I wanted to build something that I can compare to real world products.

Even though I knew I wouldn't be able to get very close to products build by teams that utilize a wider set of technology than Rails, I knew it would be useful to build something that would allow me to taste some of the challenges of building real applications.

## Lesson 1: Start Simple

Initially, I planned something way over my head. There were all sorts of complicated features and connections that I wanted to do. Thinking about the database was a nightmare.

As I planned the application, I cut a lot of features that were unecessary for a student portfoliio project.

You can always add new features, but it’s not as easy to take them away once they’re integrated all over your app, so start simple!

## Lesson 2: Don’t Reinvent the Wheel

When I first started coding the app, one of the pieces I started with (after getting the models and database set up) was the authentication system. At Flatiron, we’re taught how to build authentication from scratch using simple password encryption gems, so I initially started with that.

After spending some time setting everything up, I realized that there’s a Gem that handles all the authentication for you AND makes it easy to set it up so users can login using Google, Github, Facebook, etc.

In Ruby, it’s always worth looking for a Gem that does the functionality that you’re about to start building. Even if you don’t find one that does exactly what you’re looking for, you might find somthing similar and be able to learn from how they did it.

## Lesson 3: Slow Down

Whether you have a hard deadline or all the time in the world, it always helps to take a moment every now and then to breathe. Because this is a student project in a self-paced course, it’s easy for me to take breaks.

Even so, I had to learn that often the quickest way to fix a bug is to walk away from it.

At one point, I was coding a connection between Sprints and Goals (the app is for simple project management), and I couldn’t figure out for the life of me why Rails wouldn’t allow the Goals to be added to Sprints. I tried so many things to make it work, thinking there was a problem in the way I was updating the Sprint in the database.

It wasn’t until after I took a break that I looked wider and noticed the real issue. It was a basic validation error that came up because I seeded the database with Goals that broke the rules. After quickly fixing that, the original issue resolved itself.

If I hadn’t taken that break, I would still be looking in the wrong place for a solution.

## Conclusion

When you’re approaching your next project: Start Simple, Don’t Reinvent the Wheel, and Slow Down. Happy coding!
