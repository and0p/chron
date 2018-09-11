# Chron Pizzeria

http://chron-pizzeria.herokuapp.com/

Outstanding tasks:

- ~~Ordering menu non-interactive~~ **This was implemented pretty painlessly with Cocoon**
  - ~~I initially built the application as a Rails API, intending on using React as the front-end. However, proper React integration proved unweildy (even with newer methods like webpacker). I didn't want to hack away at something on short notice. They also required complex dependencies to run, in some cases.~~
  - ~~I changed the app back to the normal, non-API version (and replaced missing assets etc) and built the front-end functionality using standard Rails form helpers.~~
  - ~~Need to implement jquery to allow user to add to nested forms, ie~~ [this railscast](http://railscasts.com/episodes/196-nested-model-form-revised)
- No controller specs
- Model specs not very DRY
  - They get the job done but could be cleaner?
  - Haven't used rspec in forever. I found solid rspec tutorials for rails, but they're pretty monolithic / opinionated, and require a ton of gems which drastically alter how the specs read.
- No validations on price, tax, total, etc
  - Need to find right callback, if one exists, for calculating prices after associations are built. May simply be using wrong pattern?
- No validation on association model for order_id
  - Fails for some reason. NOT_NULL exists on db level, so it works.
- Could use an authenticated section for adding pizzas
  - Pizzas created with db:seed, seemed sufficient for exercise
  - I've played with devise before. It's convenient but heavier than I had time to re-research.
- Client-side validations + some back-end validations aren't implemented
  - The user can submit multiple line items of the same item, rather than rolling them into the same item with a higher count, etc.
  
Other notes:

- Non-ideal VCS pattern
  - I typically follow [this pattern](https://nvie.com/posts/a-successful-git-branching-model/), but in case something came up I wanted the exercise to be at least partially complete, so I went with more of an "onion" pattern.
- Heroku deployment is easier than it used to be.
  - And thankfully now free for all smaller dynos? I was expecting to get charged since I was already using my one free dyno to do [important work](https://twitter.com/classicrockjb).