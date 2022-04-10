# PrcussStdio_Tracker

## For Developers

### Running on local machine

#### Steps
Windows
Loging to Docker
```
docker run --rm -it --volume "${PWD}:/csce431" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest
```
Run 'bundle install'
```
bundle install
```
Create Databases
```
rails db:create
```
Migrate Databases
```
rails db:migrate
```

Mac

#### To Run
```
rails s --binding=0.0.0.0
```

#### To Test
```
rails g rspec:install
rspec spec/feature/(filename).rb
```
