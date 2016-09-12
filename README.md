# NinjaPhoenix

This is a project for leanring Phoenix 

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
## Installing

  ```
  $ mix phoenix.new carmen_phoenix
  $ cd hello_phoenix
  $ mix phoenix.server
  ```
* [[Online Guide|http://www.phoenixframework.org/docs/installation]]

## Run

  ```
  $ mix phoenix.server
  $ iex -S mix phoenix.server
  ```
## Issues
```
$ mix ecto.create
** (Mix) The database for repo HelloPhoenix.Repo couldn't be created, reason given: psql: FATAL:  role "postgres" does not exist
```

  We can fix this by creating the "postgres" role with the permissions needed to log in and create a database.

```
=# CREATE ROLE postgres LOGIN CREATEDB;
CREATE ROLE
```
