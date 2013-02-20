class CreateCollections < ActiveRecord::Migration

	def change
		create_table :collections do |t|
			t.string :name
			t.text :description
			
			t.integer :domain_id
		end
	end
	
	def down
		drop_table :collections
	end

end