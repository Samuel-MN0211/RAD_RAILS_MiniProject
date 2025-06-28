class AddCompanyAndCoordinatorFieldsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :cnpj, :string
    add_index :users, :cnpj, unique: true
    add_column :users, :matricula, :string
    add_index :users, :matricula, unique: true
    add_column :users, :endereco, :text
    add_column :users, :telefone, :string
    add_column :users, :pessoa_contato, :string
    add_column :users, :atividade_principal, :string
    add_column :users, :url_empresa, :string
  end
end
