class CreateHabilidades < ActiveRecord::Migration[8.0]
  def change
    create_table :habilidades do |t|
      t.string :nome

      t.timestamps
    end
  end
end
