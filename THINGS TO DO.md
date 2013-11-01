THINGS TO DO

Gems:
DONE -Devise for user signin
DONE -Pundit for role restrictions
DONE -Omniauth for Twitter/Other integration
DONE -Turn(?) for prettier tests (optional)

Models/Controllers:
DONE -User, must run the devise model setup, then alter the migration to add our attributes

-Items (for Menu view) (DONE)
  -Dish name - Validate uniqueness, presence
  -Price - Validate presence
  -Description (text field)
  -Subcategory (dinner, lunch, app, etc.)
  -Inventory quantity (amount in stock)

-Order, placed by both types of user (normal and owner) (DONE-Mostly)
  -Dish name(checkbox form)
  -Quantity(number field)
  -Notes from customer (text field)

-Restaurant (DONE)
  -name
  -address
  -category (food)
  -phone_number
  -website(link)

Associations: (DONE)
-Item, belongs_to :restaurant
-Order, belongs_to :user, belongs_to :restaurant
-User, has_many :restaurants, :through => :orders
-Restauarant, has_many :users, :through => :orders, has_many :items

MERGING
http://git-scm.com/book/en/Git-Branching-Basic-Branching-and-Merging

git checkout -b BranchName
git commit (like normal)
git checkout master
git merge BranchName

git status (if conflict)
git add (after fixed files in sublime)
git commit, push like normal


Things to talk about:
-Have to create an "owner" field for restaurants, migrate the DB
  -We don't necessarily need a has_many association, just set the owner field to have to match the username in order to be able to do any CRUD actions for it
