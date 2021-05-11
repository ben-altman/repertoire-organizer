class CreateCompositions < ActiveRecord::Migration[5.2]
  def change
    create_table :compositions do |t|
      t.string :title
      t.string :composer
      t.string :instrumentation
      t.integer :list_type_id
    end
  end
end
