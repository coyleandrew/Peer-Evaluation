# Team-Three Project-Six

## Standard VM setup

Install Rails and such
> bundle install

Install postgresql and tools
> apt update
> apt install postgresql postgresql-contrib libpq-dev

Init the database
> rake db:setup

If db:setup throws errors related to postgresql try the following.

Force the postgresql server to accpet local connections always
> vim /etc/postgresql/11/main/pg_hba.conf
*Note: If you are using a different version of postgres relpace 11 in the above command with whatever version you are using

Modify the line after "Database administrative login by Unix domain socket" to look like this
> local   all             postgres                                trust

Restart the service to update the changes
> service postgresql restart

Start rails
> bundle exec rails s

If you run into an error regarding a missing entry in a table related to webpacker, try running the following command
> rails webpacker:install

## Docker Setup
Build the image
> docker-compose build

Init the database
> docker-compose run web rake db:setup

Start the containers
> docker-compose up