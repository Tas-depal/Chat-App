# frozen_string_literal: true

# Creates user model with username as field
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username

      t.timestamps
    end
  end
end
