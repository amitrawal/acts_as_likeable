Acts As Likeable
=============
A Rails plugin to add Like feature to your rails app.


== Usage

=== Prepare database

Generate and apply the migration:

  ruby script/generate acts_as_likeable_migration
  rake db:migrate

Add acts_as_likeable to the model to which you want to apply the like behavior e.g

  class Comment < ActiveRecord::Base
    acts_as_likeable
  end

The Like system expects a user id to identify the person who has liked any entity. e.g.
  comment.like(user_id)
