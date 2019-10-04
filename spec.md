Specifications for the Sinatra Assessment
Specs:

 x Use Sinatra to build the app
    Sinatra is a Domain Specific Language (situation-specific) web framework that sits on Rack. MVC: model, view, controller. Controllers define an HTTP method using the sinatra routing DSL provided by methods like get and post. Web browser makes a get request, Sinatra looks for route, runs code in the block in controller, , it sends back to browser

 x Use ActiveRecord for storing information in a database

 x Include more than one model class (e.g. User, Post, Category)
    Meals and Users models

 x Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    User has many meals

 x Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    Meals belong to a user

 x Include user accounts with unique login attribute (username or email)
    User logs in with email and password

 x Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    Meals can be created, read, updated and deleted by restaurant users

 x Ensure that users can't modify content created by other users
    Restaurant users can only modify their meals, and regular users can't modify any meals

 x Include user input validations
 x BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
 x Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm:

 x You have a large number of small Git commits
 x Your commit messages are meaningful
 x You made the changes in a commit that relate to the commit message
 x You don't include changes in a commit that aren't related to the commit message
