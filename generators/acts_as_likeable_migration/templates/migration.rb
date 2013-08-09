class ActsAsLikeableMigration < ActiveRecord::Migration
  def self.up
    create_table :likes do |t|
      t.column :user_id, :integer
      t.column :likeable_id, :integer
      t.column :likeable_type, :string, :limit => 32
      t.timestamps
    end

    add_index :likes, [:likeable_id, :likeable_type]
  end

  def self.down
    drop_table :likes
  end
end
