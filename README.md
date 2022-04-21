# 501_C_Free
### README

## Table of Contents
- [Overview](#overview)
- [Schema](#schema)
- [Setup](#dev-setup)
- [Features](#json-contract)
- [Technologies](#technologies)
- [Contributors](#contributors)

### <ins>Overview</ins>
501cFree is an application that connects developers with non-profits to assist with technical projects. This repository contains the front end of our application. We invite you to check out the full application on heroku [here](https://fe-501-c-free.herokuapp.com/).

### <ins>Schema</ins>
This application uses a PostgresQL database to store developer and non-profit information.
<img width="600" alt="be_schema" src="https://user-images.githubusercontent.com/92329376/164086840-03363d87-9cb2-4fce-8644-10126b9da4e3.png">

### <ins>Setup</ins>
1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:{drop,create,migrate,seed}`
4. Run test suite with `bundle exec rspec`
5.

### <ins>Features</ins>
- Home page. Here, developers and non-profits can browse or create projects

![Screen Shot 2022-04-21 at 8 54 44 AM](https://user-images.githubusercontent.com/92329376/164462631-aa509cf7-c627-43c3-9f96-db13ec0b7b53.png)



- login/sign up, choose a role

![Screen Shot 2022-04-21 at 9 03 00 AM](https://user-images.githubusercontent.com/92329376/164463900-473496b9-c7c8-43d4-8be6-365041ac885a.png)


- dev dashboard

insert screenshot


- non profit dashboard

insert screenshot


- add a project

insert gif


- connect

insert calendly gif


### <ins>Technologies</ins>

#### Versions
- Ruby 2.7.4
- Rails 5.2.6

#### Development
- Bootstrap
- Circle CI
- Faraday
- Figaro
- Heroku
- Omniauth-google-oauth2
- Rspec

### <ins>Contributors</ins>
- [Becky Nisttahuz](https://github.com/benistta)
- [Conor Barthel](https://github.com/conorbarthel)
- [Greg Flaherty](https://github.com/gregoryjflaherty)
- [Gunnar Sorensen](https://github.com/glsorensen)
- [Maximilian Wagner](https://github.com/MWagner3)
- [Michael Brandt](https://github.com/mbrandt00)
