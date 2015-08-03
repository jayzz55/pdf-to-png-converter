class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references :document, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
