class RestaurantsChangeZipColName < ActiveRecord::Migration
  def up
    remove_column :restaurants, :zip_code, :string

    add_column :restaurants, :zip, :string
  end

  def down
    add_column :restaurants, :zip_code, :string

    remove_column :restaurants, :zip, :string
  end
end
