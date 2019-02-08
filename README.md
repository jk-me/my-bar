# MyBar

A web application to organize bar drinks. A user can create an account, add to a master list of drinks, review them, and create a personal list of favorite drinks.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

This app is built on the ruby gems listed in the Gemfile, including ruby 2.3.3 and rails 5.2.1

### Installing

To deploy the app, run the following commands in your terminal after navigating to the root directory of this repository. You may opt to seed the database with sample data using $rake db:seed

```
$bundle install
$rake db:migrate
$rake db:seed
$rails s
```

Then navigate to localhost:3000 in your web browser.

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Author

* **Jenny Kam**
 [jk-me](https://github.com/jk-me)
* **Blog:** [my-bar/js-rails-proj](http://jellyjen.com/rails_w_javascript_project)


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
