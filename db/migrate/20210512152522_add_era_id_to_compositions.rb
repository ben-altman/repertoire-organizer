class AddEraIdToCompositions < ActiveRecord::Migration[5.2]
  def change
    add_column :compositions, :era_id, :integer
  end
end
