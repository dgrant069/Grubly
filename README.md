Grubly
======
Copyright © 2013 Dylan Grant & Nicholas Case

Local boutique restaurants oftentimes face challenges that larger established eateries wouldn't have to place such importance on, such as inventory management. A consumer oftentimes may thusly arrive at an in-demand restaurant and not even be allowed to order because of a shortage. This issue is especially important to certain types of restaurants more so than others, such as BBQ places, who routinely have to marinade, smoke, and precook the correct amounts of food each day, sometimes by feel alone. Grubly is an app that allows consumers to check (in realtime) inventories of food items at local restaurants, as well as be able to place orders.

View Tricks and I18n Abilities
==============================

- Date and Time is formatted differently than the usual UTC format, set through the locales/en.yml; rendered how we want it to be viewed.

![Screencap](/public/images/screenshot2.png "Screencap of Rendered View")

- Detecting correct time zone through the Ruby gem "browser-timezone-rails", which sets a JS-based cookie, detecting the system's time zone through the end-user's machine, used by Rails to render local time.

- Template inheritance is handled through several different partials stored in the views/application directory, freeing us up to overwrite them at will when necessary.

Vulnerabilities
===============

None reported from Brakeman!

![Screencap](/public/images/brakemanreport.png "Screencap of Brakeman Report")
