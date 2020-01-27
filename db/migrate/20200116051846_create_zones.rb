class CreateZones < ActiveRecord::Migration[5.2]
  def change
    create_table :zones do |t|
      t.text :name
      t.text :on_url
      t.text :off_url

      t.timestamps
    end
  end
end
