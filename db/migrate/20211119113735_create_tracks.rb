class CreateTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :tracks do |t|

        t.string :url
        t.string :name
        t.string :credits
        t.boolean :available
        t.time :length
        
      t.timestamps
    end
  end
end
