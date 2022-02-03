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

ActiveRecord::Schema.define(version: 2022_02_03_093833) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adherents", force: :cascade do |t|
    t.string "rue", null: false
    t.string "codepostal", null: false
    t.string "ville", null: false
    t.string "departement", null: false
    t.string "nom", null: false
    t.string "prenom", null: false
    t.string "siret", null: false
    t.string "tauxhorairesemaine", null: false
    t.string "naissance", null: false
    t.string "sexe", null: false
    t.string "telephone", null: false
    t.string "numsecu", null: false
    t.string "respactnucleaire", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.string "detailadresse"
    t.string "email"
    t.string "statut"
    t.string "etablissement_id"
    t.index ["user_id"], name: "index_adherents_on_user_id"
  end

  create_table "capteurbases", force: :cascade do |t|
    t.string "marque", null: false
    t.string "modele", null: false
    t.string "typecap", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "etablissements", force: :cascade do |t|
    t.string "rue", null: false
    t.string "codepostal", null: false
    t.string "ville", null: false
    t.string "departement", null: false
    t.string "address", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
    t.string "email"
    t.string "telephone"
    t.string "complementrue"
    t.string "statut", default: "yes"
    t.string "pcr_id"
    t.string "siret"
    t.string "typeeta"
    t.string "nom"
    t.string "medecin_id"
  end

  create_table "generateurbases", force: :cascade do |t|
    t.string "marque", null: false
    t.string "modele", null: false
    t.string "typegen", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "materiels", force: :cascade do |t|
    t.string "etablissement_id", default: "NC"
    t.string "statut", default: "NC"
    t.string "typemat", default: "NC"
    t.string "marque", default: "NC"
    t.string "modele", default: "NC"
    t.string "numserie", default: "NC"
    t.string "anfab", default: "NC"
    t.string "anmes", default: "NC"
    t.string "empla", default: "NC"
    t.string "numasn", default: "NC"
    t.string "datasn", default: "NC"
    t.string "numsigis", default: "NC"
    t.string "tensionmax", default: "NC"
    t.string "intensitemax", default: "NC"
    t.string "tempsmoyen", default: "NC"
    t.string "capteurbase_id", default: "NC"
    t.string "mesorgagree", default: "NC"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "medecins", force: :cascade do |t|
    t.string "nom", null: false
    t.string "prenom", null: false
    t.string "sexe", null: false
    t.string "rpps", null: false
    t.string "email", null: false
    t.string "nometa", null: false
    t.string "rue", null: false
    t.string "complementrue"
    t.string "codepostal", null: false
    t.string "ville", null: false
    t.string "siret", null: false
    t.string "telephone", null: false
    t.string "siseri"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "nom", null: false
    t.string "prenom", null: false
    t.string "adresse", null: false
    t.string "email", null: false
    t.string "telephone", null: false
    t.text "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pcrs", force: :cascade do |t|
    t.string "nom", null: false
    t.string "prenom", null: false
    t.string "rue", null: false
    t.string "codepostal", null: false
    t.string "ville", null: false
    t.string "telephone", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.string "email"
    t.string "datenaissance"
    t.string "statut"
    t.string "dateexpdiplome"
    t.text "content"
    t.index ["user_id"], name: "index_pcrs_on_user_id"
  end

  create_table "personnels", force: :cascade do |t|
    t.string "nom", null: false
    t.string "prenom", null: false
    t.string "numsecu", default: "NC"
    t.string "emploi", default: "NC"
    t.string "statut", default: "yes"
    t.string "sexe", default: "NC"
    t.string "etablissement_id", default: "NC"
    t.string "radiocomp", default: "NC"
    t.string "datenaissance", default: "NC"
    t.string "rue", default: "NC"
    t.string "codepostal", default: "NC"
    t.string "ville", default: "NC"
    t.string "email", default: "NC"
    t.string "telephone", default: "NC"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "statut", default: "adherent"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "adherents", "users"
  add_foreign_key "pcrs", "users"
end
