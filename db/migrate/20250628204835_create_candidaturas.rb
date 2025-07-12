class CreateCandidaturas < ActiveRecord::Migration[8.0]
  def change
    create_table :candidaturas do |t|
      t.integer :status
      t.references :user, null: false, foreign_key: true
      t.references :oferta, null: false, foreign_key: { to_table: :ofertas } 

      t.timestamps
    end
  end
end
