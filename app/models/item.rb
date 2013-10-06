class Item < ActiveRecord::Base
	has_many :uploads
  	accepts_nested_attributes_for :uploads, :allow_destroy => true
end
