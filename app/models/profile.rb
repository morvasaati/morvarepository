class Profile < ActiveRecord::Base
	belongs_to :user
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

   has_attached_file :document,
   :path => ':rails_root/assets/documents/:id/:basename.:extension'
  	attr_protected :document_file_name, :document_content_type, :document_file_size
end
