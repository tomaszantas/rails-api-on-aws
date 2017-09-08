class CreatePlaces < ActiveRecord::Migration[5.1]
  def change

    create_table :places do |t|
      t.string :name
      t.st_point :coords, :geographic => true

      t.timestamps
    end

    change_table :places do |t|
      t.index :coords, using: :gist
    end

  end
end
