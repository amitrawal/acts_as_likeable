class Like < ActiveRecord::Base
  belongs_to :likeable, :polymorphic => true

  validates_uniqueness_of :user_id, :scope => [:likeable_id, :likeable_type]

  named_scope :by_user, lambda {|user_id|
    {
      :conditions => {:user_id => user_id}
    }
  }
end
