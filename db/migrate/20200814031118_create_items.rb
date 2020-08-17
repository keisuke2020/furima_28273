class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.blob       :exhibition_image,      null: false
      t.text       :name,                  null: false
      t.text       :product_explanation,   null: false
      t.integer    :price,                 null: false
      t.integer    :category_id,           null: false
      t.integer    :status_id,             null: false
      t.integer    :origin_id,             null: false
      t.integer    :charge_id,             null: false
      t.integer    :delivery_id,           null: false
      t.references :user,       foreign_key: true
      t.timestamps
    end
  end
end
