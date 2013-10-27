class CreatePartnerships < ActiveRecord::Migration
  def change
    create_table :partnerships do |t|
      t.integer :from_id
      t.integer :to_id
      t.integer :section_id
      t.boolean :accepted, :default => false

      t.timestamps
    end
  end
end
