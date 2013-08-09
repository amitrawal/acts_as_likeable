module ActiveRecord
  module Acts
    module Likeable
      def self.included(base)
        base.extend(ClassMethods)
      end

	    module ClassMethods
	      def acts_as_likeable(options = {})
	        has_many :likes, :as => :likeable, :dependent => :destroy

	        include ActiveRecord::Acts::Likeable::InstanceMethods
	        extend ActiveRecord::Acts::Likeable::SingletonMethods
	      end
	    end

			module SingletonMethods
        #Add singleton methods here if required
			end

			module InstanceMethods
				def like_it(user_id)
          like = Like.new
          like.likeable = self
          like.user_id = user_id
          like.save
          like.new_record? ? false : like
				end

				# Checks whether a user liked the object or not
				def liked_by?( user )
          user_likes = likes.by_user(user.id)
          user_likes.blank? ? false : user_likes.first
				end
			end
		end
  end
end
