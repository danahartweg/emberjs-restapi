# [Ember](https://github.com/emberjs/ember.js) example REST API

Originally based on the [Grape + Goliath Example REST API](https://github.com/djones/grape-goliath-example) by [David Jones](https://github.com/djones)

## What is this project for

This project is intended to be used as the base for a REST API that can be consumed by Ember out of the box, and is able to be deployed to Heroku.

Please take a moment to read the documentation from the [original project](https://github.com/djones/grape-goliath-example#readme). That will cover installation, as well as heroku deployment.

## Notable additions so far from the original project

* CORS support, using the [Rack CORS gem](https://github.com/cyu/rack-cors)
* JSON response templating using the [Grape-Rabl gem](https://github.com/LTe/grape-rabl)
* Modification to allow the API to respond to requests for a set of specific resources using url params, bypassing the standard path request
* Additional rake db:seed command (that runs during rake db:setup) to seed the database with test data

# Resources

* [Ember guides](http://emberjs.com/guides/) | if you're not familiar with Ember
* [Ember Data](https://github.com/emberjs/data) | if you need more information on consuming a REST API in your Ember app with Ember Data

# Todo

Please see the [todo section](https://github.com/djones/grape-goliath-example#todo) for the original project. If any of these are implemented (and I haven't implemented them myself) I'll try to get them merged.

* Authentication, more than likely OAuth

# Disclaimer

All of these changes have developed because they were needed to support both consumption by Ember, and refinements as a standalone API (not tied to a rails app).

If you find any issues, or notice something that could be accomplished in a better fashion, please let me know. Most all of this is new to me.

Other than that, hopefully someone out there finds this helpful!