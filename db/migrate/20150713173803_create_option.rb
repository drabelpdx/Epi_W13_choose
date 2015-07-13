class CreateOption < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.column :text, :string

      t.timestamps
    end
  end
end
