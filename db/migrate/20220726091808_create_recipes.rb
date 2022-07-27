class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :preparation_time
      t.string :cooking_time
      t.string :desciption
      t.boolean :public
      t.belongs_to  :user,  index:true, foreign_key:true
      t.timestamps
    end
  end
end
