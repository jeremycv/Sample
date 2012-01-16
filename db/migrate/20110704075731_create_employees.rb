class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|
      t.string :name
      t.string :employee_id
      t.integer :team_id
      t.string :status
      t.string :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :employees
  end
end
