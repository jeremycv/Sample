class CreateSkills < ActiveRecord::Migration
  def self.up
    create_table :skills do |t|

      t.string :name
      t.integer :team_id
      t.datetime :last_changed
      t.string :complexity, :null => false
      t.integer :red_threshold
      t.integer :amber_threshold
      t.float :currency_level
      t.integer :number_people_required
      t.boolean :availability
      t.string :status
      
      t.timestamps
    end
  end

  def self.down
    drop_table :skills
  end
end
