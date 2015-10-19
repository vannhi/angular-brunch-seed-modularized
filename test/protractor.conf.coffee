exports.config =
  framework: 'mocha'
  seleniumAddress: 'http://localhost:4444/wd/hub'
  capabilities:
    browserName: 'chrome'
    # browserName: 'phantomjs'
    # 'phantomjs.binary.path': require('phantomjs').path
  specs: ['integration.coffee']