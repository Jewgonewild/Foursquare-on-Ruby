#Overview

Simple Ruby wrapper to the foursquare RESTful API. I'll package this as a GEM shortly.

#Usage

Simplest example would be to fire up irb and include the class. This could easily be integrated in to a web app, but for simplicity lets use the ruby shell.

	#Make sure to give it the path to where foursquare.rb resides.
	require 'foursquare.rb'
	
	>> f = Foursquare.new('user','pass') #user must be phone number or email
	=> #<Foursquare:0x11468f0>
	
	>> f.test
	=> {"response"=>"ok"}
	
That's it, all other functions are called the same way, just make sure to pass the appropriate parameters. Full documentation of the Foursquare API is available here:
http://groups.google.com/group/foursquare-api/web/api-documentation

