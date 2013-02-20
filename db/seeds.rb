# requires needed because when running db rake:seed the application hasn't loaded yet
require './app/models/swatch'
require './app/models/manufacturer'
require './app/models/domain'
require './app/models/collection'

seedDomains = [
	{
	:display_name => "Main Domain",
	:suffix => "@gmail.com"
	}
]

seedCollections = [
	{
	:name => "Manufactured",
	:description => "This is the description for the manufactured collection.",
	:domain_id => 1
	},
	{
	:name => "Not Manufactured",
	:description => "This is the best description for the not manufactured collection.",
	:domain_id => 1
	}
]

seedManufacturers = [
	{
	:name => "Main Manufacturer",
	:description => "One of the first ever, anywhere.",
	:web_address => "google.com"
	}
]

seedSwatches = [
	{
	:name => "Swatch 1",
	:description => "Description for the test swatch.",
	:thumb_link => "http://placehold.it/100",
	:collection_id => 1,
	:manufacturer_id => 1
	},
	{
	:name => "Swatch 2",
	:description => "Description for the secondary test swatch.",
	:thumb_link => "http://placehold.it/100",
	:collection_id => 1,
	},
	{
	:name => "Swatch 3",
	:description => "Description for the tertiary test swatch.",
	:thumb_link => "ghttp://placehold.it/100",
	:collection_id => 2,
	}
]

seedDomains.each do |s|
	Domain.create(s)
end

seedCollections.each do |s|
	Collection.create(s)
end

seedManufacturers.each do |s|
	Manufacturer.create(s)
end

seedSwatches.each do |s|
	Swatch.create(s)
end