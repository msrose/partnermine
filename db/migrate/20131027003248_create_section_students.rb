class CreateSectionStudents < ActiveRecord::Migration
  def change
    create_table :section_students do |t|
      t.integer :section_id
      t.integer :student_id

      t.timestamps
    end
  end
end
