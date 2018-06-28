# README

## What are all this sheeet?

Hello guys, I'm Vinicius and this is my solution to the problem that you
brought to me :D

## Versions
* Ruby version
2.5.1
* Rails version
5.1.6

# How to?

- First `bundle install`
- Second `rails db:create db:migrate db:test:prepare`
- Third `rspec`
- Fourth `rails s`

## For lazy people like all oldscholl programmers and I, even I being a noob

[COPY ME AND PUT ON POSTMAN!](https://octo-events-jaya.herokuapp.com/)

I generated a seeds with some data for you to play :D

## A little explanation about my solution:

At first I created a helper to verify Github requests based on HMAC - SHA1;
After this I created some routes:
`POST /`: a endpoint that listen to github webhook
`GET /issues/:id/events`: List all events from this Issue
`GET /issues/statistics`: List the total for each event type

I created 2 helpers for controllers (GithubAuth is one), to DRY some things:

`exception_helper`: To catch exceptions and render a specific error json;

On `Issue` model I overloaded `.find_or_create_by` to find Issues based on the
Number attribute and update, or create a new one.

Because of the architecture of webhook, I had to create the event along with
Issue, this isn't good, but...

I create a PORO to generate the statistic data of events (`EventStatistic`)

==============================================================

Enjoy and hire me, please (͡ ° ͜ʖ ͡ °)

==============================================================


