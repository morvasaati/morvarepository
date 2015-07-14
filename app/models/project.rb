class Project < ActiveRecord::Base
  belongs_to :user
  has_many :reports
  has_attached_file :avatar, :styles => { :medium => "100x100>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


end
