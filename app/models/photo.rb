require 'mime/types'

class Photo < ActiveRecord::Base
  belongs_to :photoable, polymorphic: true
  has_attached_file :photo, :styles => { :medium => "300x225>", :avatar => "150x150>" }

end
