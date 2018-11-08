class CreateOrdersCreateOrderGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :order_groups do |t|
      t.references :user, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true
    end
    
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :order_group, null: false, foreign_key: true
      t.text :text, null: false
      t.text :note
    end
  end
end
