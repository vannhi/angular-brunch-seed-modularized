# angular-brunch-seed-modularized
### A starter project for AngularJS using Brunch.io

[AngularJS](http://angularjs.org) + [Brunch](http://brunch.io)

Features:
* Coffeescript / Jade / Less / Stylus automatically compiled on save
* auto-reload during development saves you from manually refreshing the page
* Javascript / CSS minification for production
* [karma](http://karma-runner.github.io) integration for
  unit tests
* Bootstrap integration.
* Source map support
* Modularized code, see /app/sections
* angular/ui-router for more flexible routing

## Why modularize?

This "modularized" version is intended to be as simple as possible while laying down patterns that, if followed, will create an easily-maintained complex application. The original Angular-Seed entices one down the path of code segregated by type (controllers, views, etc.) rather than by feature (todo, view1, view2). Misko recommends organizing code around features (see [this](http://www.youtube.com/watch?feature=player_embedded&v=E87rXWE62WU#t=106s) 10/27/13 presentation).

Modularized code is better for 
* unit testing
* working with larger teams (to not step on each others’ work)
* preparing for the future because modules will be able to be lazy-loaded and so this structure will be either required or firmly recommended

## What, exactly, is different in the modularized code?
Differences
* Instead of one controller, one partials folder, one module, there are several
  * top level ones under /app 
  * lower-level ones under /app/sections 
    * (to make that work, karma.conf.coffee and config.coffee had to be changed, to pick up and integrate the files from more locations)

## Alternate Versions

- [Livescript](https://github.com/clkao/angular-brunch-seed-livescript) 
  by [@clkao](https://github.com/clkao) - Uses [Livescript](http://livescript.net/) 
  instead of [Coffeescript](http://coffeescript.org/)
- [True North](https://github.com/scoarescoare/angular-brunch-true-north) 
  by [@scoarescoare](https://github.com/scoarescoare) - Uses [SASS](http://sass-lang.com/) 
  instead of [LESS](http://lesscss.org/)
- [brunch-on-asteroids](https://github.com/exlee/brunch-on-asteroids) 
  by [@exlee](https://github.com/exlee) - A minimalistic version that adds Generators,
  Bootswatch themes, D3, and more.
- [angular-brunch-seed-modularized](https://github.com/sanfordredlich/angular-brunch-seed-modularized) 
  by [@sanfordredlich](https://github.com/sanfordredlich) - Demonstrates a modular
  design, consistent with best practices and better suited for larger projects

## How to use angular-brunch-seed-modularized

* `git clone https://github.com/vannhi/angular-brunch-seed-modularized.git` to clone 
  the **angular-brunch-seed-modularized** repository
* `cd angular-brunch-seed-modularized`
* `./scripts/init.sh` to install node packages

Or if you have **Brunch** installed run:

`brunch n gh:vannhi/angular-brunch-seed-modularized myapp`

You must also install packages using bower. Either

```
bower install
```
or
```
./node_modules/.bin/bower install
```

*NOTE:* Depending upon your connection and processor speed the build can take
a substantial amount of time (3 - 15 minutes). The bower step is particularly
slow, because it downloads the complete git history. If you think that there
might be a problems, check you network traffic. If the build is still
downloading then it's still working.

### Using Jade

*NOTE:* Behind the scenes Angular-brunch-seed uses 
[jade-angular-brunch](https://github.com/GulinSS/jade-angularjs-brunch)
to compile and serve partials.
[jade-angular-brunch](https://github.com/GulinSS/jade-angularjs-brunch)
works by creating an Angular module named`'app.templates'` that adds the HTML
string of the partials to the `$templateCache`. For this to work you must add
`app.templates` to yours apps required modules list and include the `app.templates.js`
file in your `index.html` file.

If you are interested in the compiled HTML view the contents 
of the `_public/js/app.templates.js` file.

### Running the app during development

* `./scripts/server.sh` to serve using **Brunch**

Then navigate your browser to [http://localhost:3333](http://localhost:3333)

*NOTE:* Occasionally the scripts will not load properly on the initial
load. If this occurs, refresh the page. Subsequent refresh will render
correctly. Also, the initial load will take longer then subsequent loads,
some where around 20 seconds is normal.

### Running the app in production

* `./scripts/production.sh` to minify javascript and css files.

Please be aware of the caveats regarding Angular JS and minification, 
take a look at [Dependency Injection](http://docs.angularjs.org/guide/di)
for information.

### Using Bower

Angular-brunch-seed uses [Bower](http://twitter.github.com/bower/) for package
management. To add or update dependencies, modify the `component.json` file
and run `bower install`. The component will be added to the `vendor` directory.

### Running unit tests

* `./scripts/test.sh` to run unit tests with [karma](http://karma-runner.github.io)

Notes:

- Karma will run tests on save. To insure that changes are saved be sure
  to have `./script/server.sh` or `./script/development.sh` running in the console.
- Set the browsers that you would like to target in the `karma.conf.coffee` file
  E.g. `browser = ["ChromeCanary", "Firefox"]`

### End to end testing

* run the app in development mode as described above using a separate terminal
* `./scripts/test-e2e.sh` to run e2e tests with
  [karma](http://karma-runner.github.io) using Angular's scenario runner

### Common issues

Initial load does not render correctly; scripts are not loading. 
- Occasionally the scripts will not load properly on the initial load. If this
  occurs, refresh the page. Subsequent refresh will render correctly.

`EMFILE` error
- EMFILE means there are too many open files. Brunch watches all your project
  files and it's usually a pretty big number. You can fix this error with
  setting max opened file count to bigger number with command `ulimit -n 10000`.

The complete [Brunch FAQ](https://github.com/brunch/brunch/blob/master/docs/faq.rst)
