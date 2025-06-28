class CreateAlunoHabilidades < ActiveRecord::Migration[8.0]
  def change
    create_table :aluno_habilidades do |t|
      t.references :user, null: false, foreign_key: true
      t.references :habilidade, null: false, foreign_key: true

      t.timestamps
    end
  end
end
