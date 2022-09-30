# Developer test
Time guideline: 2 hours

## About the test
There are three tasks, but you do not have to complete them all.
If you find yourself running short of time, use pseudo-code or prose to explain what you would have done with more time.
We're just as interested in your working process as we are any code you write.

We suggest you take no more than 2 hours to work on these tasks.
When you are done, submit a pull request on the Github project containing all your changes. You may also send an email back to rcg37@bath.ac.uk with additional information about your solution.

## Background and Setup
You will be working on a small section of our in-house Content Management System.
In this repo, you will find a `person_profile` model, a database migration file and a set of seed data to set up a local SQLite database.

You will be asked to work on the existing model, as well as to create a new model to work alongside it.

After extracting this project onto your local machine, ensure that all the gems are installed by running `bundle install`.

To set up your local database, please run `rails db:create db:migrate db:seed` from a terminal in the project directory.

To set up the database for running the test suite, please run `rails db:create db:migrate RAILS_ENV=test` from a terminal in the project directory.

You will not need to run Rails in server mode, but you may find the Rails console useful for testing (`rails c`)

## Task 1
The contents of the existing Person Profile model is a little text-heavy.
It has been decided that we should allow for a profile image to be added to the model.
Add a field for the image URL (and any others you deem necessary, considering the accessibility of the published page).
A profile is not required to have a photo.

Please add these new fields to the model with suitable validations, and any additional tests you deem necessary.

## Task 2
There is a requirement for a Team Profile model.
This would allow multiple Person Profiles to be grouped together.
For example, an individual could be part of committee and a working group.

For this task, the requirements for the new Team Profile model are to have fields for 
`title`, `summary`, `subtype` (allowing `academic_team`, `committee`, `leadership_team`, `professional_service_team`, 
`statutory_body` and `working_group` as valid options), `contact_name`, `contact_email` and `contact_phone`.

Please create and update appropriate model and migration files to allow this.
You are not required to build controller or view files for this task.

## Task 3
With the above tasks completed, please add records to the seeds file to create two teams of any subtype.
Then add the two existing person profile records as members of both teams.
