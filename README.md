# Bookmark Manager

Bookmark manager is a program that stores weblinks so that the user can read them later.

We are using this challenge as a way to learn about SQL Databases.

## Website

The LocalHost should be used to run this program.

## Usage

To see the code in action Clone the directory, and perform the following in the terminal:

```bash
Rackup
```

Then open your web browser into the resulting terminal.

The code for Bookmark Manager can also be run by going to

```bash
irb './lib/bookmark.rb'
```

## Userstories

```
As a user,
So that I can read a web page later,
I want to be able to bookmark a page.

As a user,
So that I can find similar bookmarks,
I want to be able to add tags to my bookmark.

As a user,
So that I can see other people's bookmarks,
I want to be able to browse all bookmarks.

As a user,
So that I can interact with other people,
I want to be able to comment on all bookmarks.
```

## Installation

1. Connect to psql
2. Create the database using the psql command CREATE DATABASE bookmark_manager;
3. Connect to the database using the psql command \c bookmark_manager;
4. Run the query we have saved in the file 01_create_bookmarks_table.sql

## Assumptions
* All bookmarks are public
* All bookmarks are timestamped

## Design
![Design](/images/Bookmark.png)

## Test Coverage
```
Test Coverage: 0% -- 0 lines in 0 files
```
## Methods

```ruby
bookmark.new("name") # creates a new bookmark with string
```

## How to Run the Tests

Tests are located within /spec folder. As the website is built out we would expect to have more specific testing on the website.

## Contributing
As this is an afternoon week challenge, this project is in collaboration with @JoshuaNg2332, @samlandman, @alessa-lou, @mirimichaelson

## Follow Up

We would like to include:
- An option to have a private
- A visually appealing webpage
- Better security on login (for example, a captcha)

<p align="center">
    <a href="https://https://makers.tech/">
        <img src="https://img.shields.io/badge/-created%40makers-red"
            alt="Made @ Makers"></a>
</p>
