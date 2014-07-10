class AddPictureToEpictures < ActiveRecord::Migration
  def change
  	add_attachment :epictures, :picture
  end
end
