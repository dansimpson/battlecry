$:.unshift File.dirname(__FILE__)

require "rubygems"
require "ruby-growl"

##
# Battlecry is a simply abstraction for sending  growl messages 
# to many hosts (allies)
# 
# See http://growl.info/
# 
# depends on the ruby-growl gem
# gem install ruby-growl
#
# Allies must have OSX installed and must listen for incoming
# notifcations to hear the cry.
# You can enable this by going to the Growl configuration panel
# under System Preferences.  Go to the network tab and check the following boxes
# - Listen for incoming notifications
# - Allow remote application registration
# 
# = Example
#   
#   battlecry = Battlecry.new [{
#     :host => "localhost"
#   },{
#     :host => "myhost.com",
#     :password => "test"
#   }]
#   battlecry.shout "We will defeat our enemies!"
class Battlecry

  VERSION = 0.2

  ##
  # Creates a Battlecry, which registers notificaitons with one or
  # more remote machines, known as allies
  #
  # +allies+ is an array of allies which will be affected by
  # a battlecry. An ally is a hash object with a :host param (hostname),
  # and an optional :password param
  # eg: { :host => "localhost", :password => "password" }
  
  def initialize allies
    @allies = []
    allies.each do |ally|
      add_ally ally[:host], ally[:password]
    end
  end
  
  ##
  # Battlecrys for all allies in the army
  #
  # +message+ the content of the battlecry
  #
  # +title+ the title, or context of the battlecry
  #
  # +priority+ the intensity of the cry from -2 to 2
  #
  # +sticky+ makes the cry stick in the heads of allies
  def shout message, title = "Battlecry", priority = 0, sticky = false
    @allies.each do |ally|
      ally.notify "battlecry", title, message, priority, sticky
    end
  end
  
  ##
  # Adds an ally to the army
  #
  # +host+ the hostname of the ally
  #
  # +title+ the password for the ally
  def add_ally host, password = nil
    @allies << Growl.new(host, "battlecry", ["battlecry"], nil, password)
  end
  
  ##
  # The size of the army
  def num_allies
    @allies.size
  end

end