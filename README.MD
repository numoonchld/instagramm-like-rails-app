## Usage

- in terminal do `docker-compose up`
- then, create DB
  `docker-compose run web rake db:create`
- go `localhost:5052` to access the application

## Models

### Pic Model

- `rails generate model Pic title:string description:text`
- `rails db:migrate`

### Pics controller

- `rails generate controller Pics`

## Simple Form

- `rails generate simple_form:install --bootstrap`

## Install Device

- `rails generate devise:install`

### User Model Generation

- `rails generate devise User`
  - this also creates all the user authetication paths in addition to the model
  - be sure to run `rails db:migrate` after geenrating `User` model

## User-Pic Association

- add `belongs_to :user` in `app/models/pic.rb`
- add `has_many :pics` in `app/models/user.rb`

- to setup a new column in `Pic` model to associate with a user, add a new `user_id` column to the model
  - like so `rails generate migration add_user_id_to_pics user_id:integer:index`

## Initial Setup

- Generate ruby app within `web` docker container
  `docker-compose run --no-deps web rails new . --force --database=postgresql`

- Then, build the app after rails genrates new app
  `docker-compose build`

- Then configure DB in `config/database.yml` by linking host to `db`, and setting username and password

```
default: &default
adapter: postgresql
encoding: unicode
host: db
username: postgres
password: password
pool: 5
```

- Then run the entire docker composite
  `docker-compose up`

- Then create DB
  `docker-compose run web rake db:create`

## Reference

- https://docs.docker.com/samples/rails/
