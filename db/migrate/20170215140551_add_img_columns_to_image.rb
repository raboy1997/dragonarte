class AddImgColumnsToImage < ActiveRecord::Migration[5.0]
  def up
    add_attachment :images, :img
  end

  def down
    remove_attachment :images, :img
  end
end
