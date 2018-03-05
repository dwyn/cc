# cc
Concept Community.

Concept Community is a platform for Flatiron faculty and students to submit concepts for future students to build for portfolio projects. Pretty excited about this actually. 

At a high level, the app will have Users, Concepts, Sections, and languages. I am not 100% certain of how I will associate everything, but my gut tells me this is a good starting point for creating my tables or what have you... 

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) 
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
- [x] Include signup (how e.g. Devise)
- [x] Include login (how e.g. Devise)
- [x] Include logout (how e.g. Devise)
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate


Users
  <!-- Devise will take care of most of the user functionality with regards to log in credentials -->
  <!-- OmniAuth will help with using Flatirons API -->
  <!-- Only flatiron students and faculty can log in. So no need for a sign up page -->

Concepts
  Title
  Description
  resource_links

Sections
  Title
  Description

Languages
  name
  section_id

conceptsjoin <--- Not sure what to name this fella> 
  User_id
  Concept_id
  section_id
  language_id
