require File.dirname(__FILE__) + '/lib/acts_as_likeable'
ActiveRecord::Base.send(:include, ActiveRecord::Acts::Likeable)
