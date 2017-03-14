# Reactor v1.0
React app quick setup script

## Usage

Simply run the script, providing one argument `[project_name]` to quickly create a new npm package with all the modules required and everything set up for you to get going!

## I am naturally suspicious. What does the script *do* really?

Well, for the most part it follows the steps described in [Codecademy's React Setup Articles I through V](https://www.codecademy.com/articles/react-setup-i). The condensed version is as follows:

+ Create a directory for the project.
+ Initialize the package via `npm init`.
+ Install React, Babel and Webpack via `npm install`.
+ Configure Babel and Webpack by creating and writing to the necessary files.
+ Create the `/app` directory.
+ Add dummy `index.html` and `main.js` files.
+ Create the `/app/components` directory.
+ Add a dummy `App.js` react component.
+ Use webpack to build the newy created app.

## FAQ

**How can I contribute?**

I created this script in a couple of hours, just to make my life easier. If you want to add your version of the script, submit a pull request with your version **preserving** the original script. The more configurations and setups that can be added to the repository, the better.

**Does the script work on Windows/Linux/Mac?**

I wrote and tested the script on Windows 7. Linux support will soon be available (the script might not even require tweaks). Mac support is not in the works, as I cannot test it. If you read this and want to help with that, please do!

**Is this free?**

Yes, the project is licensed under the MIT license and is totally free to use. If you are feeling generous, give it a Star and maybe mention my name in your project's credits. Or don't, I won't mind either way!
