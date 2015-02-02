Survey Creator
================

by Grace Mekarski and Mike Goren

Survey Creator DB is a website that uses a database and Sinatra to allow a user to create and list surveys and add questions for each survey.

Installation
------------

Install Survey Creator by first cloning the repository.  
```
$ git clone http://github.com/gracelauren/survey.git
```

Install all of the required gems:
```
$ bundle install
```

Start the database in another tab of the terminal:
```
$ postgres
```

Create the databases and tables by cd-ing into your survey-master folder then in the terminal run the following:

```

```
$ rake db:create

```

```
$ rake db:schema:load

```

```
$ rake db:test:prepare
```

```
```

Start the webserver:
```
$ ruby app.rb
```

In your web browser, go to http://localhost:4567

License
-------

GNU GPL v2. Copyright 2015 Grace Mekarski and Mike Goren
