require 'rubygems'
require 'httparty'

class Foursquare
  
  #FOURSQUARE Ruby JSON Class.
  #For more information on required and optional function parameters see 
  #http://groups.google.com/group/foursquare-api/web/api-documentation
  #BY: Emmanuel P
  # TODO: PAckage this as a GEM
  
  include HTTParty
  format :json
  
  def initialize(u,p)
    self.class.basic_auth u, p
  end
  
  #Returns a list of recent checkins from friends. If you pass in a geolat/geolong pair (optional, but recommended), 
  #we'll send you back a <distance> inside each <checkin> object that you can use to sort your results.
  def checkins(params={})
    self.class.get("http://api.foursquare.com/v1/checkins.json", :query=>params)
  end
  
  #Allows you to check-in to a place.
  def checkin(params={})
    self.class.get("http://api.foursquare.com/v1/checkin.json", :query=>params)
  end
  
  #Returns a history of checkins for the authenticated user.
  def checkin_history(params={})
    self.class.get("http://api.foursquare.com/v1/history.json", :query=>params)
  end
  
  #Returns profile information (badges, etc) for a given user. If the user has recent check-in data (ie, if the user is self or is a friend of the authenticating user), this data will be returned as well in a checkin block.
  def user_verifiyCredentials(params={})
    self.class.get("http://api.foursquare.com/v1/user.json", :query=>params)
  end
  
  #Returns a list of friends. If the friend has allowed it, you'll also see links to their Twitter and Facebook accounts.
  def user_friends(params={})
    self.class.get("http://api.foursquare.com/v1/friends.json", :query=>params)
  end
  
  #Returns a list of venues near the area specified or that match the search term. (The distance returned is in meters). If you authenticate, the method will return venue meta-data related to you and your friends. If you do not authenticate, you will not get this data.
  def venue_search(params={})
    self.class.get("http://api.foursquare.com/v1/venues.json", :query=>params)
  end
  
  #Returns venue data, including mayorship, tips/to-dos and tags.
  def venue_details(params={})
    self.class.get("http://api.foursquare.com/v1/venue.json", :query=>params)
  end
  
  #Allows you to add a new venue.
  def venue_add(params={})
    self.class.post("http://api.foursquare.com/v1/addvenue.json", :body=>params)
  end
  
  #Allows you to propose a venue edit.
  def venue_edit(params={})
    self.class.post("http://api.foursquare.com/v1/venue/proposeedit.json", :body=>params)
  end
  
  #Allows you to flag a venue as closed.
  def venue_flag(params={})
    self.class.post("http://api.foursquare.com/v1/venue/flagclosed.json", :body=>params)
  end
  
  #Returns a list of tips near the area specified. (The distance returned is in meters).
  def tip_search(params={})
     self.class.get("http://api.foursquare.com/v1/tips.json", :query=>params)
  end
  
  #Allows you to add a new tip or to-do at a venue.
  def tip_add(params={})
     self.class.post("http://api.foursquare.com/v1/addtip.json", :body=>params)
  end
  
  #Allows you to mark a tip as a to-do item.
  def tip_markTodo(params={})
      self.class.post("http://api.foursquare.com/v1/tip/marktodo.json", :body=>params)
  end
  
  #Allows you to mark a tip as done.
  def tip_markDone(params={})
       self.class.post("http://api.foursquare.com/v1/tip/markdone.json", :body=>params)
  end
  
  #Shows you a list of users with whom you have a pending friend request (ie, they've requested to add you as a friend, but you have not approved).
  def friend_requests(params={})
       self.class.get("http://api.foursquare.com/v1/friend/request.json", :query=>params)
  end
  
  #Approves a pending friend request from another user. On success, returns the <user> object.
  def friend_approve(params={})
        self.class.post("http://api.foursquare.com/v1/friend/approve.json", :body=>params)
  end
  
  #Denies a pending friend request from another user. On success, returns the <user> object.
  def friend_deny(params={})
        self.class.post("http://api.foursquare.com/v1/friend/deny.json", :body=>params)
  end
  
  #When passed a free-form text string, returns a list of matching <user> objects. The method only returns matches of people with whom you are not already friends.
  def friend_findByName(params={})
        self.class.get("http://api.foursquare.com/v1/findfriends/byname.json", :query=>params)
  end
  
  #When passed phone number(s), returns a list of matching <user> objects. The method only returns matches of people with whom you are not already friends. You can pass a single number as a parameter, or you can pass multiple numbers separated by commas.
  def friend_findByPhone(params={})
        self.class.get("http://api.foursquare.com/v1/findfriends/byphone.json", :query=>params)
  end
  
  #When passed a Twitter name (user A), returns a list of matching <user> objects that correspond to user A's friends on Twitter. The method only returns matches of people with whom you are not already friends. If you don't pass in a Twitter name, it will attempt to use the Twitter name associated with the authenticating user.
  def friend_findByTwitter(params={})
        self.class.get("http://api.foursquare.com/v1/findfriends/bytwitter.json", :query=>params)
  end
  
  #Allows you to change notification options for yourself (self) globally as well as for each individual friend (identified by their uid).
  def settings_setPings(params={})
        self.class.post("http://api.foursquare.com/v1/settings/setpings.json", :body=>params)
  end
  
  #Pings foursquare for a test response
  def test 
      self.class.get("http://api.foursquare.com/v1/test.json") 
  end

end