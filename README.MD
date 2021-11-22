## Usage

- in terminal do `docker-compose up`
- then, create DB
  `docker-compose run web rake db:create`
- go `localhost:5052` to access the application

## Models

### Pic Model

- `rails generate model Pic title:string description:text`
- `rails db:migrate`

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
