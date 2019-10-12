# frozen_string_literal: true

class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.boolean :releaser
      t.boolean :editor
      t.boolean :admin
      t.string :color

      t.timestamps
    end
  end
end
