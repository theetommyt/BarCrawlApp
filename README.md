“CHOOSE YOUR OWN DISASTER”: A Customizable Social Bar Crawl App!

No more interminable group-decision making ordeals just to pre-plan a fun night of dranking!

Trust us, pre-planning drinking works a whole lot better than drunk-planning.

Now you can drink where you want, in the order you want, with the people you want! Choose your own Disaster, in style!

![Screen Shot](/WelcomeBarCrawl.png)

The aspiring drunkard has two ways to start using our App:

(1) Auto-geolocation of current location, or
(2) Enter address for starting location of crawl.

With the google map-view listings of all the closest bars, you can click once on any bar to find more info about the bar you like.

If you like a bar enough to crawl to it, you can double-click on the map icon to add that bar to your Bar Crawl list.
(Version 2: nix bars from list, save individual Crawls for future use  ...)

Once you've selected your perfect Crawl route, you can use the app anywhere you are to recheck new bars closer to you, and add those bars to your list.

While you're on the Crawl, you can be super-social by taking out your phones, ignoring your fellow humans, and using our DrunkChat feature with your fellow Crawlers! Also, sign-up as a new user for DrunkChat, log-in (takes you to profile page) and can redirect back to welcome page, with DrunkChat feature.

![Screen Shot](/profile.png)

When you come back to welcome page, you’re all Logged-in and personally greeted, by name, by your friendly Bartender, Sam!

In DrunkChat, tell your fellow Crawlers how it’s going, and your salty bar reviews, and what drinks you’re imbibing.
Version 2: post your pictures! (Eventually video links  and other media)

![Screen Shot](/DrunkChat.png)

Design!
Our intention was for the design to be fun, colorful, spontaneous and easy-to-use in the desired state of the user - Drunk!


DETAILS:

Technology Stack:
- Ruby 2.1.2p95,
- Rails 4.2.1,
- Skeleton
- Google maps api
- Google places api
- Yelp api
- psql (PostgreSQL) 9.4.1

Requirements:
- register for an api key from yelp:
https://www.yelp.com/developers/manage_api_keys

- Skeleton CSS framework (recommended)
http://getskeleton.com/
(download and insert both the normalize.css and skeleton.css into your vendor/assets/stylesheets directory)

Bar/Tavern information:
https://data.cityofchicago.org/Community-Economic-Development/Business-Licenses-Current-Liquor-and-Public-Places/nrmj-3kcf
- Filter information
- Download information as CSV
- Drop the CSV into your rails db directory.

Dependencies:
- Yelp gem
- Bcrypt gem


Remember to incorporate changes to the gemfile and bundle.

Testing the app:
from within the app's directory in command line:
```
  rails s
```

Database tables (our db is called " bar_crawl_development " ):
```
  List of relations
  Schema |       Name        | Type  |  Owner  
  --------+-------------------+-------+---------
  public | bar_distances     | table | Matthew
  public | bars              | table | Matthew
  public | chats             | table | Matthew
  public | crawls            | table | Matthew
  public | drinkers          | table | Matthew
  public | schema_migrations | table | Matthew
```

The bars are based on a fixed dataset from a list of licensed taverns in Chicago. The Haversine Formula is used to calculate distances between each bar based on latitude and longitude.


```
  def self.search_bars(lat, long, num_bars=1)
    dtor = Math::PI/180
    r = 3959

    rlat1 = lat * dtor
    rlong1 = long * dtor

    bars = self.all  # Find all the bars

    bar_distances = bars.map do |bar| # For each bar in the database
      rlat2 = bar.lat* dtor
      rlong2 = bar.long * dtor

      dlon = rlong1 - rlong2
      dlat = rlat1 - rlat2

      a = (Math::sin(dlat/2) ** 2) + Math::cos(rlat1) * Math::cos(rlat2) * (Math::sin(dlon/2) ** 2)
      c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))
      d = r * c

      {
        distance: d,
        id: bar.id
      }
    end

    bar_distances.sort! { |x,y| x[:distance] <=> y[:distance] }

    closest_bars_hashes = bar_distances.slice(0..(num_bars-1))

    closest_bars_hashes.map {|bar_data|  self.find( bar_data[:id] ) }
  end

```
A user's current latitude and longitude is determined through a navigator.geolocation function, while manually entered latitude and longitudes are obtained with the yelp gem. This allows the user to enter not only addresses, but landmarks and more general search terms.

Admins can be manually created in the console by adding a "drinker"
```
  Drinker.create({name: 'Roger', password: 'password1', is_admin: true})
```

Admin has ability to remove bars from the database, by going to the /admin page:
![Screen Shot](/admin.png)


*************************************************




<!-- == README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
Ruby 2.1.2
Rails 4.2.1
* System dependencies
? yelp gem?
* Configuration
?
* Database creation
rake db:create
* Database initialization
rake db:migrate
rake db:seed
* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>. -->
