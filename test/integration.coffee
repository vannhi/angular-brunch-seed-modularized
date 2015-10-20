chai = require "chai"
expect = chai.expect
chai.use require "chai-as-promised"

class TodoPage
  constructor: ->
    @todoItems = element.all By.repeater('todo in todos')
    @archiveButton = $("[ng-view] a[ng-click=\"archive()\"]")
    @newTodoText = element By.model('todoText')
  get: ->
    browser.get("")

describe "my app", ->
  todoPage = null
  beforeEach ->
    todoPage = new TodoPage
    todoPage.get()

  NEW_ITEM_LABEL = "test newly added item"

  switchToToDo = ->
    $(".nav a[href=\"#/todo\"]").click()
    expect(browser.getCurrentUrl()).to.eventually.equal "#{browser.baseUrl}/#/todo"

  switchToView1 = ->
    element(By.css(".nav a[href=\"#/view1\"]")).click()
    expect(browser.getCurrentUrl()).to.eventually.equal "#{browser.baseUrl}/#/view1"

  it "should automatically redirect to /todo when location hash/fragment is empty", ->
    expect(browser.getCurrentUrl()).to.eventually.equal "#{browser.baseUrl}/#/todo"

  describe "todo", ->

    addToDoItem = ()->
      todoPage.newTodoText.sendKeys NEW_ITEM_LABEL
      $("input[type=\"submit\"]").click()
      expect(todoPage.todoItems.count()).to.eventually.equal 3
      expect(todoPage.todoItems.last().element(By.binding("todo.text")).getText()).to.eventually.equal NEW_ITEM_LABEL
      expect(todoPage.newTodoText.getText()).to.eventually.equal ""

    it "should list 2 items", ->
      expect(todoPage.todoItems.count()).to.eventually.equal 2

    it "should display checked items with a line-through", ->
      expect($("[ng-view] ul li input:checked + span").getCssValue("text-decoration")).to.eventually.eql "line-through"

    it "should sync done status with checkbox state", ()->
      $$("[ng-view] ul li input:not(:checked)").click()
      todoPage.todoItems.$$("span").each (elm) ->
        elm.getAttribute("class").then (text)->
          expect(text).to.have.string "done"

      $$("[ng-view] ul li input:checked").click()
      todoPage.todoItems.$$("span").each (elm) ->
        elm.getAttribute("class").then (text)->
          expect(text).to.not.have.string "done"

    it "should remove checked items when the archive link is clicked", ->
      todoPage.archiveButton.click()
      expect(todoPage.todoItems.count()).to.eventually.equal 1

    it "should add a newly submitted item to the end of the list and empty the text input", addToDoItem

    it "should reset after switching views", ->
      addToDoItem()
      switchToView1()
      switchToToDo()
      expect(todoPage.todoItems.count()).to.eventually.equal 2

    it "should navigate to /view1 when the View 1 link in nav is clicked", ->
      switchToView1()

  describe "view1", ->
    beforeEach ->
      browser.get "#/view1"

    it "should render view1 when user navigates to /view1", ->
      expect($$("p").first().getText()).to.eventually.match /partial for view 1/

  describe "view2", ->
    beforeEach ->
      browser.get "#/view2"

    it "should render view2 when user navigates to /view2", ->
      expect($$("p").first().getText()).to.eventually.match /partial for view 2/