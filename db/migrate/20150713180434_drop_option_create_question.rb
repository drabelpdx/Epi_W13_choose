class DropOptionCreateQuestion < ActiveRecord::Migration
  def change
    drop_table :options
    create_table :questions do |t|
      t.column :option_a, :string
      t.column :option_b, :string
      t.column :user_id, :integer

      t.timestamps
    end
  end
end
