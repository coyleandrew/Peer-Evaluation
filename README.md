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

Modify the line after "Database administrative login by Unix domain socket" to look like this
> local   all             postgres                                trust

Restart the service to update the changes
> service postgresql restart

Start rails
> bundle exec rails s

## Docker Setup
Build the image
> docker-compose build

Init the database
> docker-compose run web rake db:setup

Start the containers
> docker-compose up