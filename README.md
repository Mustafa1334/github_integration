# github_integration

##### Prerequisites

The setups steps expect following tools installed on the system.

- Ruby [2.5.1]
- Rails [5.2.8]

##### 1. Check out the repository

```bash
git clone https://github.com/Mustafa1334/github_integration.git
```

##### 2. Bundle Install

Run bundle install to install all the gems

```ruby
bundle install
```

##### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:migrate
```

##### 4. Install and Up smee-client

Run the following commands to run the smee-client to handle the request from github abd route it to local.

```node
npx smee-client --url YOUR_SMEE_URL --target http://localhost:3000/webhook

```

##### 5. Copy the .env content

You need to copy the env variables in .env file which I've shared in email.


##### 6. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

##### 7. Create new issue in github

  - Now visit https://github.com/Mustafa1334/github_integration.git
  - Create new Issue
  - Add Title and Description but don't add estimate: X days in description
  - It should add a comment with relevant message
