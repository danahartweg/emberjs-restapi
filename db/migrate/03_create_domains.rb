class CreateDomains < ActiveRecord::Migration

	def change
		create_table :domains do |t|
			t.string :display_name
			t.string :suffix
		end
	end
	
	def down
		drop_table :domains
	end

end