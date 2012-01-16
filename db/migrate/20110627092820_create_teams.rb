class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.string :name, :limit => 50, :null => false, :unique => true
      t.string :business_unit
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :teams
  end
end
