

# _Shoe_Warehouse_

#### ACTIVE RECORD Independent Project
Ruby: Sinatra app with Rspec and Capybara for Epicodus 07.24.2016
## By Sebastian Prokuski

***

## Description
This app allows a user to add, edit, and remove shoe stores in a database, and subsequently add and join brands with shoe stores. The app associates stores with brands in a many to many relationship and provides various ways of displaying the information from the database.

## User Stories
* As a user, I want to be able to add, update, delete and list shoe stores.
* As a user, I want to be able to add shoe brands in the application (don't worry about updating, listing or destroying shoe brands).
* As a user, I want to be able to add shoe brands to a store to show where they are sold.
* As a user, I want to be able to see all of the brands a store sells on the individual store page.
* As a user, I want store names and shoe brands to be saved with a capital letter no matter how I enter them.
* As a user, I do not want stores and shoes to be saved if I enter a blank name.
* As a user, I want to be able to search for stores by brand using a search bar or by clicking on a brand logo.

## Setup
1. Clone this repository
* For a mac, install the documented gems, run postgres in your terminal, then enter the following:
  1. rake db:create
  * rake db:migrate
  * rake db:test:prepare
* Open a simple HTTP server in the top level of the cloned directory. For a mac, tun the following command in your terminal:
  * ruby app.rb
* Then open your web browser of choice to localhost:4567

## Database Specs
* Production Database: shoe_warehouse_development
* Development Database: shoe_warehouse_test
* Resource Names: stores, brands
* Attributes (stores): id, name, location, phone, open_time, close_time
* Attributes (stylists): id, name, image

## Technologies
* Ruby
* Sinatra
* Rspec
* Capybara
* HTML
* Bootstrap

## Legal
Copyright (c) 2016 **_{Sebastian Prokuski}_**
