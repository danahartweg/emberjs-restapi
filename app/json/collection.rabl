object @collection

attributes :id, :name, :description

node :swatches do |s|
	s.swatches.map do |swatch|
		swatch.id
	end
end