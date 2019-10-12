# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :homepage
      t.string :facebook_id
      t.string :twitter_id
      t.string :facebook_url
      t.string :twitter_url
      t.date :birth_date
      t.text :address
      t.text :bio
      t.text :signature
      t.string :time_zone, default: 'Budapest'
      t.string :locale

      t.timestamps
    end

    add_reference :profiles, :user, foreign_key: true, null: false
    add_index :profiles, :name
    add_index :profiles, %i[name bio signature]
  end
end
