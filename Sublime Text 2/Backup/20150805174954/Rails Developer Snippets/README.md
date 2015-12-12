# railsdev-sublime-snippets
I started this project as I had over 500 ruby/rails/rspec snippets installed - each with different naming conventions (depending on their creator). I wanted a core collection of useful snippets (with a somewhat-standard naming convention), hence I started from scratch and wrote the snippets in this collection.

## Package Installation

### Package Control (Recommended)
   Search for "Rails Developer Snippets" via Package Control otherwise...
### Mac OSX
    cd ~/Library/Application\ Support/Sublime\ Text\ 2/Packages
    git clone git@github.com:j10io/railsdev-sublime-snippets.git
### Linux
    cd ~/.config/sublime-text-2/Packages
    git clone git@github.com:j10io/railsdev-sublime-snippets.git
### Windows
    cd Users/<user>/AppData/Roaming/Sublime\ Text\ 2/Packages/
    git clone git@github.com:j10io/railsdev-sublime-snippets.git
### Sublime Text 3 - Mac OSX
    cd ~/Library/Application Support/Sublime Text 3/Packages/User
    git clone git@github.com:j10io/railsdev-sublime-snippets.git
## Dependencies

 * [ApplySyntax](https://github.com/facelessuser/ApplySyntax) a sublime text plugin for syntax detection (rspec etc...)
 * [RSpec](https://github.com/SublimeText/RSpec) plugin for greater rspec support

## Some support for
 * [capybara](https://github.com/jnicklas/capybara) Acceptance test framework for web applications
 * [shoulda](https://github.com/thoughtbot/shoulda) a validations gem by thoughtbot

## My Setup (I'm on OSX... your mileage may vary)

 1. Install the dependencies above.
 2. It's worth noting, whilst I wanted to keep **some** of the functionality that Sublime Text provides for Ruby/Rails by default, as well as **some** functionality that the RSpec plugin provides, to avoid **snippet collisions**, I deleted all other Ruby/Rails/RSpec .sublime-snippet files from:

 * ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/Ruby
 * ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/Rails
 * ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/RSpec/Snippets

### Delete like so...at your own risk!!!
#### Ruby Snippets
    find ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/Ruby -iname *.sublime-snippet -exec rm {} \;
#### Rails Snippets
    find ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/Rails -iname *.sublime-snippet -exec rm {} \;
#### Rspec Snippets
    find ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/RSpec/Snippets -iname *.sublime-snippet -exec rm {} \;


## Contributing
Whilst I'm happy to review pull requests for bugfixes, and even for new snippets, I will be unable to commit to merging all pull requests - especially edge-cases. As noted above, I started this project after having over 500 snippets, and as such, my preference is to not return there! If submitting a pull request, please consider whether or not your snippet is for an edge-case.

## This project
**Initial Commit:** 29th June 2013

## License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
