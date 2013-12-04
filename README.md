Grubly
[![Code Climate](https://codeclimate.com/github/dgrant069/Grubly.png)](https://codeclimate.com/github/dgrant069/Grubly)
======
Copyright © 2013 Dylan Grant & Nicholas Case

Local boutique restaurants oftentimes face challenges that larger established eateries wouldn't have to place such importance on, such as inventory management. A consumer oftentimes may thusly arrive at an in-demand restaurant and not even be allowed to order because of a shortage. This issue is especially important to certain types of restaurants more so than others, such as BBQ places, who routinely have to marinade, smoke, and precook the correct amounts of food each day, sometimes by feel alone. Grubly is an app that allows consumers to check (in realtime) inventories of food items at local restaurants, as well as be able to place orders.

Mailers
=======

The app is configured to send an email from the user who places an order to the email address listed on the restaurant owner's account, listing all the pertinent details for the restaurant owner to get busy. All he/she has to do is leave an email client open or have their smartphone on to get use from the Grubly app.

Likewise, the restaurant owner can also email a receipt to the user with the click of a button and a flash notice will inform him/her of that information as well.

View Tricks and I18n Abilities
==============================

- Date and Time is formatted differently than the usual UTC format, set through the locales/en.yml; rendered how we want it to be viewed.

![Screencap](/public/images/screenshot2.png "Screencap of Rendered View")

- Detecting correct time zone through the Ruby gem "browser-timezone-rails", which sets a JS-based cookie, detecting the system's time zone through the end-user's machine, used by Rails to render local time.

- Template inheritance is handled through several different partials stored in the views/application directory, freeing us up to overwrite them at will when necessary.

Vulnerabilities
===============

None reported from Brakeman!

![Screencap](/public/images/brakeman.png "Screencap of Brakeman Report")
