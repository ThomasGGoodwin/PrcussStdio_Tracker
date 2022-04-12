# TAMU Percussion Studio

## Introduction

Participation Tracker and Storage Key Tracker for the TAMU Percussion Studio

## Requirements

This code has been run and tested on:

- Ruby - 3.0.2p107
- Rails - 6.1.4.4
- Ruby Gems - Listed in `Gemfile`
- Docker (Latest Container)


## External Deps

- Docker - Download latest version at https://www.docker.com/products/docker-desktop
- Heroku CLI - Download latest version at https://devcenter.heroku.com/articles/heroku-cli
- Git - Downloat latest version at https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
- GitHub Desktop (Not needed, but HELPFUL) at https://desktop.github.com/

## Installation

Download this code repository by using git:

`git clone https://github.com/ThomasGGoodwin/PrcussStdio_Tracker`

## Tests

An RSpec test suite is available and can be ran using:

`rspec spec/`

You can run all the test cases by running. This will run both the unit and integration tests.
`rspec .`

## Execute Code

Run the following code in Powershell if using windows or the terminal using Linux/Mac

`cd PrcussStdio_Tracker`

`docker run --rm -it --volume "$(pwd):/rails_app" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest`


Install the app

`bundle install && rails webpacker:install && rails db:create && db:migrate`


Run the app
`rails server --binding:0.0.0.0`


The application can be seen using a browser and navigating to http://localhost:3000/


## Environmental Variables/Files

We have environment variables setup for Authentication. The tutorial can be found here: https://docs.google.com/document/d/1el7qOrqVpBo62woVx0sW4LZulteQ7Jmw/edit 

## CI/CD

CI/CD has been implemented in the GitHub Actions in the repo here -> https://github.com/ThomasGGoodwin/PrcussStdio_Tracker/actions 

## Support

The support of this app has been officially closed. There is nothing more important left to develop. We can scale this app and make it generic enough for all other student orginizations and not just ZLP Interviewer. Thats the future goals of this application.
