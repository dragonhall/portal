DragonHall Portal
=================

This repository contains the basic source of the new DragonHall+ Portal Engine

Development Setup
-----------------

```
git clone https://github.com/dragonhall/portal.git dhportal
rvm install ruby-2.5.0
rvm use --create ruby-2.5.0@dhportal
cd dhportal
bundle install
```

Then create a database, setup credentials in `config/database.yml` 
(see the example in `config/database.yml.sample`).

**Important:** To test import functions correctly, you have to have a correctly
set up `dragonhall` database too! Also, be sure if `dhportal` user has at least 
**USE and SELECT** grant on it!

```
rake db:setup # this configures the development database
rake db:seed # note: this will check the 'dragonhall' database too but don't break if not present
guard -i # or
foreman start
```

