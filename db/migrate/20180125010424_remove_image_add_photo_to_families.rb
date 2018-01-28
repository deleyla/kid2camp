class RemoveImageAddPhotoToFamilies < ActiveRecord::Migration[5.1]
  def change
    remove_column :families, :family_image, :string
    add_column :families, :photo, :string
  end
end
