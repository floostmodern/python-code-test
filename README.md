# Ostmodern Python Code Test

The goal of this exercise is to test that you know your way around the command line and Django tools. Whilst there is some simple HTML to write, you won't be expected to style the page.

The idea is to do some prototype work on a site that allows users to add their comments & reactions to an episode of a television program. They'll be able to upload an image, or write a tweet, which will be stored locally in the application.  Each episode will have a stream of reactions, showing a list of items with their details.

A Django project has been created and some initial data models have been created.

## Getting started
* You'll need to install [VirtualBox](https://www.virtualbox.org/) and [Vagrant](https://www.vagrantup.com/) on your development machine
* Get the code from `https://github.com/ostmodern/python-code-test`
* Do all your work in your own `develop` branch
* Once you have downloaded the code the following commands will get the site up and running

```shell
vagrant up
vagrant ssh
fab migrate
fab web
```
* The default Django "It worked!" page should now be available at http://localhost:8888/

## Tasks

* Update the models so that `Episode`s can have `PhotoReaction`s or `TweetReaction`s
* Add some sample data using the Django admin interface and save it as fixtures
* Make it possible for an admin to moderate the site by deleting photos/tweets (and un­deleting them) using the Django admin interace
* Make a page that displays the reactions for a particular episode in chronological order at `/episodes/:id/`
* The stream should only display items that are not deleted
* Make a fabric command that clears the database and loads your sample data
* Create a release branch in your repo and send us the link
