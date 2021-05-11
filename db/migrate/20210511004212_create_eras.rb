class CreateEras < ActiveRecord::Migration[5.2]
  def change
    create_table :eras do |t|
      t.string :name
    end
  end
end
