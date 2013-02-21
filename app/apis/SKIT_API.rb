module SKit

	class API < Grape::API
	  
	  # grape config
	  version 'v1', :using => :path
	  format :json
	  formatter :json, Grape::Formatter::Rabl
	  
	  default_format :json
	  
	  # setting headers for CORS
	  before do
	  	# this also needs to be set in "server.rb" for the initial request headers
	  	header['Access-Control-Allow-Origin'] = 'http://localhost:8888',
  		header['Access-Control-Allow-Methods'] = 'GET, PUT, POST, DELETE, OPTIONS',
	  	header['Access-Control-Allow-Headers'] = 'Content-Type, Accept, Origin'
  	end
	  
	  resource 'swatches' do
	  	
	  	# requests with ids as url params will override returning all swatches
	  	desc "Return all available swatches, or a specific set by id."
	    get "/", :rabl => "swatches.rabl" do
	    	if params['ids']
	    		@swatches = Swatch.find(params['ids'])
	    	else
	    		@swatches = Swatch.all
	    	end
	    end
	    
	    desc "Return a specific swatch."
	    get "/:id", :rabl => "swatch.rabl" do
	      @swatch = Swatch.find(params['id'])
	    end
	    
	    desc "Create a new swatch."
	    params do
	    	group :swatch do
		    	requires :name, type: String, desc: "Name of the swatch."
		    	optional :collection_id, type: Integer, desc: "Associated collection."
		    	optional :domain_id, type: Integer, desc: "Associated domain."
	    	end
    	end
	    post "/" do
	    	Swatch.create(params['swatch'])
	    end
	    
	  end
	  
	  resource 'manufacturers' do
	  
	  	desc "Return all available manufacturers."
	    get "/" do
	      Manufacturer.all
	    end
	    
	    desc "Return a specific manufacturer."
	    get "/:id" do 
	      Manufacturer.find(params['id'])
	    end
	    
	    desc "Return all swatches for a manufacturer."
	    get "/:id/swatches" do
	    	Manufacturer.find(params['id']).swatches
	    end
	    
	    desc "Create a new manufacturer."
	    post "/" do
	    	Manufacturer.create(params['manufacturer'])
	    end
	    
	  end
	  
	  resource 'collections' do
	  	desc "Return all available collections."
	    get "/", :rabl => "collections.rabl" do
	      @collections = Collection.all
	    end
	    
	    desc "Return a specific collection."
	    get "/:id", :rabl => "collection.rabl" do 
	      @collection = Collection.find(params['id'])
	    end
	    
	    desc "Return all swatches for a collection."
	    get "/:id/swatches", :rabl => "swatches.rabl" do
	    	@swatches = Collection.find(params['id']).swatches
	    end
	    
	    desc "Create a new collection."
	    params do
	    	group :collection do
	    		requires :name, type: String, desc: "Name of the collection."
	    	end
	    end
	    post "/" do
	      Collection.create(params['collection'])
	    end
	  end
	  
	  resource 'domains' do
	  	desc "Return all available domains."
	    get "/" do
	      Domain.all
	    end
	    
	    desc "Return a specific domain."
	    get "/:id" do 
	      Domain.find(params['id'])
	    end
	    
	    desc "Return all collections for a domain."
	    get "/:id/collections" do
	    	Domain.find(params['id']).collections
	    end
	    
	    desc "Create a new domain."
	    params do
	    	group :domain do
	    		requires :display_name, type: String, desc: "Display name for the domain."
	    		requires :suffix, type: String, desc: "Suffix used to map users to a domain."
	    	end
	    end
	    post "/" do
	      Domain.create(params['domain'])
	    end
	  end
	  
	end
end