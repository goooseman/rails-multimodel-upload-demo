class Upload < ActiveRecord::Base
	belongs_to :item
	has_attached_file :upload, :styles => { :large => "800x800", :medium => "400x400>", :small => "200x200>" }
end
