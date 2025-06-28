class CreateOferta < ActiveRecord::Migration[8.0]
  def change
    create_table :oferta do |t|
      t.string :titulo
      t.text :descricao
      t.string :atividade_principal
      t.integer :ch_semanal
      t.decimal :valor_pago
      t.decimal :vale_transporte
      t.text :pre_requisitos
      t.text :habilidades_necessarias
      t.text :habilidades_desejaveis
      t.integer :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
