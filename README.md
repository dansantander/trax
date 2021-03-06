# TRAX
>  Rails app for helping you with keeping track of your activities and fees per activity with no complications.

![screenshot](trax.jpg)

## Table of Contents

* [Features](#features)
* [Live Demo](#demo)
* [Installation](#installation)
* [Getting Started](#getting-started)
* [Built With](#built-with)
* [Contributing](#contributing)
* [Acknowledgments](#acknowledgments)
* [Authors](#author)
* [License](#license)

## Features

  - A user logs in to the app, only by typing the username.
  - Profile page includes links to:
	  - “My Tasks”.
	  - “Other Tasks”.
	  - “Groups”.
	  - “Logout”.
  - My Tasks:
    - A list of all transactions that are created by a logged-in user (sorted by most recent).
  - Other Tasks:
    - A list of all transactions that are created by a logged-in user but *not assigned to any group* (sorted by most recent).
  - Groups:
	  - A list of all groups is displayed in alphabetical order.
    - Each group is clickable and opens “Group transactions” page.
    - When user opens the “Group transactions” page a list of all transactions that belong to that group is displayed.

## Demo

  - https://blooming-tor-45743.herokuapp.com/

## Installation

  - Make sure to have [PostgreSQL](https://www.postgresql.org/) installed and configured as the database.
  - Ensure the project dependencies are installed.
  - Clone the repo locally with the command `git clone git@github.com:dansantander/trax.git`.
  - Navigate to the project folder inside your terminal.
  - Run `bundle` or `bundle install`.

## Getting Started

  - Head over to your server on localhost:3000.
  - Create a new User using the Signup form and start a session by Signing in.
  - Create a new Group.
  - Create a new Task with or without a group.
  - Browse through your tasks or tasks that don't belong to any group.

## Built With

  - Ruby 2.6.5 <br>
  - Ruby on Rails 5.2 <br>
  - Git, Github and VScode <br>

## Contributing

Contributions, issues and feature requests are welcome!

You can do it on [issues page](issues/).

## Acknowledgments

Special thanks to code reviewers.

## Show your support

Give a ⭐️ if you like this project!

## Authors

👤 **Daniel Santander**

- Github: [@dansantander](https://github.com/dansantander)
- Linkedin: [Daniel Santander](https://www.linkedin.com/in/daniel-santander)
- Twitter: [@dansantandr](https://twitter.com/dansantandr)

## License

<strong>Creative Commons 2020</strong>