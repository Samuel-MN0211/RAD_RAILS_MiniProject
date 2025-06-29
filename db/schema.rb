# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_06_29_024559) do
  create_table "aluno_habilidades", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "habilidade_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["habilidade_id"], name: "index_aluno_habilidades_on_habilidade_id"
    t.index ["user_id"], name: "index_aluno_habilidades_on_user_id"
  end

  create_table "candidaturas", force: :cascade do |t|
    t.integer "status"
    t.integer "user_id", null: false
    t.integer "oferta_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["oferta_id"], name: "index_candidaturas_on_oferta_id"
    t.index ["user_id"], name: "index_candidaturas_on_user_id"
  end

  create_table "estagios", force: :cascade do |t|
    t.date "data_inicio"
    t.date "data_termino"
    t.decimal "valor_bolsa"
    t.integer "user_id", null: false
    t.integer "oferta_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["oferta_id"], name: "index_estagios_on_oferta_id"
    t.index ["user_id"], name: "index_estagios_on_user_id"
  end

  create_table "habilidades", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "oferta", force: :cascade do |t|
    t.string "titulo"
    t.text "descricao"
    t.string "atividade_principal"
    t.integer "ch_semanal"
    t.decimal "valor_pago"
    t.decimal "vale_transporte"
    t.text "pre_requisitos"
    t.text "habilidades_necessarias"
    t.text "habilidades_desejaveis"
    t.integer "status"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_oferta_on_user_id"
  end

  create_table "ofertas", force: :cascade do |t|
    t.string "titulo"
    t.text "descricao"
    t.string "atividade_principal"
    t.integer "ch_semanal"
    t.decimal "valor_pago"
    t.decimal "vale_transporte"
    t.text "pre_requisitos"
    t.text "habilidades_necessarias"
    t.text "habilidades_desejaveis"
    t.integer "status"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_ofertas_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.string "nome"
    t.string "cpf"
    t.date "data_nascimento"
    t.string "cnpj"
    t.string "matricula"
    t.text "endereco"
    t.string "telefone"
    t.string "pessoa_contato"
    t.string "atividade_principal"
    t.string "url_empresa"
    t.index ["cnpj"], name: "index_users_on_cnpj", unique: true
    t.index ["cpf"], name: "index_users_on_cpf", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["matricula"], name: "index_users_on_matricula", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "aluno_habilidades", "habilidades"
  add_foreign_key "aluno_habilidades", "users"
  add_foreign_key "candidaturas", "oferta", column: "oferta_id"
  add_foreign_key "candidaturas", "users"
  add_foreign_key "estagios", "oferta", column: "oferta_id"
  add_foreign_key "estagios", "users"
  add_foreign_key "oferta", "users"
  add_foreign_key "ofertas", "users"
end
