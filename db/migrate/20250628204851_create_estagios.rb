class CreateEstagios < ActiveRecord::Migration[8.0]
  def change
    create_table :estagios do |t|
      t.date :data_inicio
      t.date :data_termino
      t.decimal :valor_bolsa
      t.references :user, null: false, foreign_key: true
      t.references :oferta, null: false, foreign_key: true

      t.timestamps
    end
  end
end
