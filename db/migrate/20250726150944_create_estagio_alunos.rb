class CreateEstagioAlunos < ActiveRecord::Migration[8.0]
  def change
    create_table :estagio_alunos do |t|
      t.references :estagio, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
