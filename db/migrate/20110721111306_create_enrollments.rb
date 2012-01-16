class CreateEnrollments < ActiveRecord::Migration
  def self.up
    create_table :enrollments do |t|
      
      t.integer :employee_id
      t.integer :skill_id
      t.float :level
      t.boolean :active
      t.float :currency
      t.float :score
      t.date :last_performed
      t.string :status
      t.string :comment
      t.boolean :reportable
      t.timestamps
    end
  end

  def self.down
    drop_table :enrollments
  end
end
