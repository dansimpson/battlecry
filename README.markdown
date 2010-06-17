#Battlecry - A simple abstraction for sydicating messages to OSX hosts via Growl

##Installation

	gem install battlecry -s http://gemcutter.org

## Examples

	battlecry = Battlecry.new [{
		:host => "localhost"
	},{
		:host => "otherhost",
		:password => "password"
	}]

	#shout a might shout, and all allies will know!
	battlecry.shout "Victory is ours!"
	
	#add another ally
	battlecry.add_ally "hostname", "password"
	
	#see the army size
	battlecry.num_allies

##Requirements

* Ally machines are running OSX
* Ally machines have Growl installed
* Ally machines are listening for incoming notifications (System Preferences)
* Ally machines allow remote application registration (System Preferences)
* If you dare, ensure your firewall settings allow incoming connections

##Dependencies
- ruby-growl