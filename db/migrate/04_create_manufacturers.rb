class CreateManufacturers < ActiveRecord::Migration

	def change
		create_table :manufacturers do |t|
			t.string :name
			t.text :description
			t.string :web_address
		end
	end
	
	def down
		drop_table :manufacturers
	end

end