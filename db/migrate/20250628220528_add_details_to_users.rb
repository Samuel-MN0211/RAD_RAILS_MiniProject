class AddDetailsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :nome, :string
    add_column :users, :cpf, :string
    add_index :users, :cpf, unique: true
    add_column :users, :data_nascimento, :date
  end
end
