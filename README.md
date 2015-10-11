# angular-brunch-seed-modularized

See [original README](https://github.com/sanfordredlich/angular-brunch-seed-modularized)

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

## Some MAJOR changes from original angular-brunch-seed-modularized

### Designed to work with Node 4.x and npm 3

npm-shrinkwrap.json: Force auto-reload-brunch to use ws@0.8.0 because older version does not work with Node 4.x. This npm-shrinkwrap.json only works with npm 3.

### Unit test scripts location

Test scripts are found besides productions. I think it is better for writing tests. Test scripts are prefix by _ to be ignored by brunch (See brunch ignored convention)

### Newer jade-angularjs-brunch version

[jade-angular-brunch](https://github.com/GulinSS/jade-angularjs-brunch)
works by creating an Angular module named`'app.templates'` that adds the HTML
string of the partials to the `$templateCache`. For this to work you must add
`app.templates` to yours apps required modules list and include the `app.templates.js`
file in your `index.html` file.

If you are interested in the compiled HTML view the contents 
of the `_public/js/app.templates.js` file.
