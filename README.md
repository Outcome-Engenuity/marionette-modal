## Marionette.Modal

A plugin for Marionette.js that simplifies creating modals for your marionette application.

This project is a fork of the original Backbone.Modal that has tighter integration with the Marionette.js framework.

Marionette.Modal.js removes boilerplate code and adds default behaviors and interactions. You can create a simple dialog modal or complex wizards with stacked modals on top of each other in a few lines of code.

Documentation is roughly the same as Backbone.Modal.  The internals of the base modal view are extending Marionette.View rather than
Backbone.View in order to take advantage of the builtin functionality that marionette provides.

For a complete overview of the forked repo documentation visit: [http://awkward.github.io/backbone.modal/](http://awkward.github.io/backbone.modal/)

#### Bundled version
If you're using Backbone and Marionette.
* [marionette.modal-bundled-min.js](https://raw.github.com/Outcome-Engenuity/marionette.modal/master/marionette.modal-bundled-min.js)

#### Backbone.Modals.js and Backbone.Marionette.Modals.js separate
If you just want to use the Backbone version without Marionette.
* [backbone.modal-min.js](https://raw.github.com/Outcome-Engenuity/marionette.modal/master/backbone.modal-min.js)
* [backbone.marionette.modals-min.js](https://raw.github.com/Outcome-Engenuity/marionette.modal/master/backbone.marionette.modals-min.js)

#### CSS files
There's default style, and you can use our theme to make things look pretty.
* [marionette.modal.css](https://raw.github.com/Outcome-Engenuity/marionette.modal/master/marionette.modal.css)
* [marionette.modal.theme.css](https://raw.github.com/Outcome-Engenuity/marionette.modal/master/marionette.modal.theme.css)

### How to contribute

To get started `grunt install` to install all dependencies. If you have any requests, please create an issue. If you're working on something yourself, make a pull request and we'll make sure to check it out to get in into the next release.

### Tests

#####  (Please note that there are currently no tests written for the marionette.modal view currently.  I will make some when time permits.)

When you run the project by doing `grunt watch`. This will watch the tests, src and example files. It will open up a browser with the tests on `http://localhost:8000`. When you head over `http://localhost:5000`, it will show the example that's defined in the `Gruntfile.coffee`.

### Legal stuff (MIT License)

Copyright (c) 2013 jcsmith1859.

Distributed under MIT license.
