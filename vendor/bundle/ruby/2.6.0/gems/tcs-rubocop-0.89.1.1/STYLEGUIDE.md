# Ruby Style Guide

## Language Version

This style guide is designed for Ruby 2.6.x

## General

* Use soft-tabs with a two space indent.

* Keep each line of code to a readable length. Unless you have a reason to, keep lines to fewer than 120 characters.

* Never leave trailing whitespace.

* End each file with a [newline](https://github.com/bbatsov/ruby-style-guide#newline-eof).

* Use spaces around operators; after commas, colons and semicolons.

``` ruby
sum = 1 + 2
a, b = 1, 2
1 > 2 ? true : false; puts "Hi"
```

* Use spaces inside `{` and before `}` for blocks and hash literals. Use a space before `{` for blocks.

``` ruby
[1, 2, 3].each { |e| puts e }

hash = { one: 1, two: 2 }
```

* Do not use spaces inside `{` and `}` for interpolation expressions.

``` ruby
"From: #{user.first_name}, #{user.last_name}"
```

* No spaces after `(`, `[` or before `]`, `)`.

``` ruby
some(arg).other
[1, 2, 3].length
```

* No spaces after `!`.

``` ruby
!array.include?(element)
```

* Indent `when` as deep as `case`.

``` ruby
case
when song.name == "Misty"
  puts "Not again!"
when song.duration > 120
  puts "Too long!"
when Time.now.hour > 21
  puts "It's too late"
else
  song.play
end

kind = case year
       when 1850..1889 then "Blues"
       when 1890..1909 then "Ragtime"
       when 1910..1929 then "New Orleans Jazz"
       when 1930..1939 then "Swing"
       when 1940..1950 then "Bebop"
       else "Jazz"
       end
```

* Use empty lines between `def`s and to break up a method into logical
  paragraphs.

``` ruby
def some_method
  data = initialize(options)

  data.manipulate!

  data.result
end

def some_method
  result
end
```

* Prefer ranges when generating random numbers instead of integers with offsets.

```ruby
# bad
rand(6) + 1
rand(6).succ
rand(6).pred
Random.rand(6) + 1
Kernel.rand(6) + 1
rand(0..5) + 1

# good
rand(1..6)
rand(1...7)
```

## Classes

* Avoid the usage of class (`@@`) variables due to their unusual behavior
in inheritance. All of the classes in a class hierarchy actually share one
class variable. Class instance variables should usually be preferred over
class variables.

``` ruby
# bad
class Parent
  @@class_var = "parent"

  def self.print_class_var
    puts @@class_var
  end
end

class Child < Parent
  @@class_var = "child"
end

Parent.print_class_var # => will print "child"

# good
class GoodParent
  @class_ivar = "good parent"

  def self.print_class_ivar
    puts @class_ivar
  end
end

class GoodChild < GoodParent
  @class_ivar = "good child"
end

GoodParent.print_class_ivar # => will print "good parent"
```

* Use `def self.method` to define class/singleton methods. This makes the methods
  more resistant to refactoring changes.

``` ruby
class TestClass
  # bad
  def TestClass.some_method
    # body omitted
  end

  # good
  def self.some_other_method
    # body omitted
  end
```

* Avoid `class << self` except when necessary, e.g. single accessors and aliased
  attributes.

``` ruby
class TestClass
  # bad
  class << self
    def first_method
      # body omitted
    end

    def second_method_etc
      # body omitted
    end
  end

  # good
  class << self
    attr_accessor :per_page
    alias_method :nwo, :find_by_name_with_owner
  end

  def self.first_method
    # body omitted
  end

  def self.second_method_etc
    # body omitted
  end
end
```

* Indent the `public`, `protected`, and `private` methods as much as the
  method definitions they apply to. Leave one blank line above them.

``` ruby
class SomeClass
  def public_method
    # ...
  end

  private
  def private_method
    # ...
  end
end
```

* Avoid explicit use of `self` as the recipient of internal class or instance
  messages unless to specify a method shadowed by a variable.

``` ruby
class SomeClass
  attr_accessor :message

  def greeting(name)
    message = "Hi #{name}" # local variable in Ruby, not attribute writer
    self.message = message
  end
end
```

* Don't extend an instance initialized by `Struct.new`. Extending it introduces a superfluous class level and may also introduce weird errors if the file is required multiple times. Use a block to customize the struct.

```ruby
# bad
class Person < Struct.new(:first_name, :last_name)
  def age
    42
  end
end

# good
Person = Struct.new(:first_name, :last_name) do
  def age
    42
  end
end
```

## Collections

* Use `Set` instead of `Array` when dealing with unique elements. `Set`
  implements a collection of unordered values with no duplicates. This
  is a hybrid of `Array`'s intuitive inter-operation facilities and
  `Hash`'s fast lookup.

* Prefer symbols instead of strings as hash keys.

``` ruby
# bad
hash = { "one" => 1, "two" => 2, "three" => 3 }

# good
hash = { one: 1, two: 2, three: 3 }
```

* Favor `each_with_object` over `inject`. That way you do not need to return the accumulator object at the end of the block.

```ruby
# bad
[1, 2].inject({}) { |a, e| a[e] = e; a }

# good
[1, 2].each_with_object({}) { |e, a| a[e] = e }
```

## Exceptions

* Don't use exceptions for flow of control.

``` ruby
# bad
begin
  n / d
rescue ZeroDivisionError
  puts "Cannot divide by 0!"
end

# good
if d.zero?
  puts "Cannot divide by 0!"
else
  n / d
end
```

* Don't rescue the `Exception` class, which traps signals and calls to exit,
  requiring you to kill -9 the process. Avoid rescuing `StandardError`, which
  can hide the root cause of an error. Prefer to rescue specific exceptions.
  Use meaningful names for exception instances: multiple rescue blocks that
  all handle `e` are more difficult to understand.

``` ruby
# bad
begin
  # an exception occurs here
rescue Exception
  # exception handling
end

# still bad (usually)
begin
  # an exception occurs here
rescue StandardError
  # this can hide errors/bugs that could otherwise be resolved
end

# good
begin
  Integer("taco")
rescue ArgumentError => error
  # exception handling
end
```

* Use implicit begin blocks if the rescue should be scoped to all operations in the
  method.

``` ruby
# bad
def foo
  begin
    # logic
  rescue
    # exception handling
  end
end

# good
def foo
  # logic
rescue AnError => error
  # exception handling
end

# also good
def foo
  # logic that will not raise an exception

  begin
    # logic that might raise an exception
  rescue AnError => error
    # exception handling
  end

  # more logic that will not raise an exception
end
```

* The `rescue` and `ensure` keywords should be aligned with the associated `begin` and `end`.

```ruby
# bad
begin
  something
  rescue
  puts 'error'
end

# good
begin
  something
rescue
  puts 'error'
end
```

## Hashes

Use the Ruby 1.9 syntax for hash literals when all the keys are symbols:

``` ruby
# bad
user = {
  :login => "defunkt",
  :name => "Chris Wanstrath"
}

# good
user = {
  login: "defunkt",
  name: "Chris Wanstrath"
}

```

Use the 1.9 syntax when calling a method with Hash options arguments or named arguments:

``` ruby
# bad
user = User.create(:login => "jane")
link_to("Account", :controller => "users", :action => "show", :id => user)

# good
user = User.create(login: "jane")
link_to("Account", controller: "users", action: "show", id: user)
```

Avoid using hash literals with mixed key types. If you must, use the legacy hashrocket
style to avoid mixing styles within the same hash:

``` ruby
# bad
hsh = {
  user_id: 55,
  "followers-count" => 1000
}

# good
hsh = {
  :user_id => 55,
  "followers-count" => 1000
}
```

## Keyword Arguments

Keyword arguments are recommended but not required when a method's arguments may otherwise be
opaque or non-obvious when called.

So instead of this:

``` ruby
def remove_member(user, skip_membership_check = false)
  # ...
end

# Elsewhere: what does true mean here?
remove_member(user, true)
```

Do this, which is much clearer.

``` ruby
def remove_member(user, skip_membership_check: false)
  # ...
end

# Elsewhere, now with more clarity:
remove_member user, skip_membership_check: true
```

Additionally, prefer keyword arguments over the old "Hash as pseudo-named args" style from pre-2.0 ruby.

```ruby
# bad
def fry(options = {})
  temperature = options.fetch(:temperature, 300)
  # ...
end

# good
def fry(temperature: 300)
  # ...
end
```

## Method Missing

* When using `method_missing` you should fall back on `super`.

```ruby
# bad
def method_missing(name, *args)
  # ...
end

# good

def method_missing(name, *args)
  # ...
  super
end
```

* When using `method_missing` you should also define `respond_to_missing?`.

## Naming

* Use `snake_case` for methods and variables.

* Use `CamelCase` for classes and modules.  (Keep acronyms like HTTP,
  RFC, XML uppercase.)

* Use `SCREAMING_SNAKE_CASE` for other constants.

* The names of predicate methods (methods that return a boolean value)
  should end in a question mark. (i.e. `Array#empty?`).

* The names of potentially "dangerous" methods (i.e. methods that modify `self` or the
  arguments, raise on failure, `exit!`, etc.) should end with an exclamation mark.

## Numerics

* Add underscores to large numeric literals to improve their readability.

```
# bad - how many 0s are there?
num = 1000000

# good - much easier to parse for the human brain
num = 1_000_000
```

* Prefer smallcase letters for numeric literal prefixes. `0o` for octal, `0x` for hexadecimal and `0b` for binary. Do not use `0d` prefix for decimal literals.

```
# bad
num = 01234 # leading zeros are interpreted as octal!
num = 0O1234
num = 0X12AB
num = 0B10101
num = 0D1234
num = 0d1234

# good - easier to separate digits from the prefix
num = 0o1234
num = 0x12AB
num = 0b10101
num = 1234
```

## Percent Literals

* Use `%w` and `%i` freely for arrays of words and symbols.

``` ruby
STATES = %w(draft open closed)
```

* Do not nest percent literals.

```ruby
# bad

# The percent literal for nested_attributes is parsed as four tokens,
# yielding the array [:name, :content, :"%i[incorrectly", :"nested]"].
attributes = {
  valid_attributes: %i[name content],
  nested_attributes: %i[name content %i[incorrectly nested]]
}
```

## Regular Expressions

* Avoid using $1-9 as it can be hard to track what they contain. Named groups
  can be used instead.

``` ruby
# bad
/(regexp)/ =~ string
...
process $1

# good
/(?<meaningful_var>regexp)/ =~ string
...
process meaningful_var
```

* Be careful with `^` and `$` as they match start/end of line, not string endings.
  If you want to match the whole string use: `\A` and `\z`.

``` ruby
string = "some injection\nusername"
string[/^username$/]   # matches
string[/\Ausername\z/] # don't match
```

* Use `x` modifier for complex regexps. This makes them more readable and you
  can add some useful comments. Just be careful as spaces are ignored.

``` ruby
regexp = %r{
  start         # some text
  \s            # white space char
  (group)       # first group
  (?:alt1|alt2) # some alternation
  end
}x
```

## Requires

Always `require` dependencies used directly in a script at the start of the same file.
Resources that will get autoloaded on first use—such as Rails models, controllers, or
helpers—don't need to be required.

``` ruby
require "set"
require "time"

%w(foo bar).to_set
Time.parse("2015-10-21")
```

This not only loads the necessary dependencies if they haven't already, but acts as
documentation about the libraries that the current file uses.

## Strings

* Prefer string interpolation instead of string concatenation:

``` ruby
# bad
email_with_name = user.name + " <" + user.email + ">"

# good
email_with_name = "#{user.name} <#{user.email}>"
```

* Use double-quoted strings. Interpolation and escaped characters
  will always work without a delimiter change, and `'` is a lot more
  common than `"` in string literals.

``` ruby
# bad
name = 'Bozhidar'

# good
name = "Bozhidar"
```

* Avoid whitespace within string interpolations.

* Avoid using `String#+` when you need to construct large data chunks.
  Instead, use `String.new("")` or `"".dup` to initialize a non-frozen string
  and `String#<<`. Concatenation mutates the string instance in-place and is
  always faster than `String#+`, which creates a bunch of new string objects.

``` ruby
# good and also fast
html = String.new("")
html << "<h1>Page title</h1>"

paragraphs.each do |paragraph|
  html << "<p>#{paragraph}</p>"
end
```

## Syntax

* Use `def` with parentheses when there are arguments. Omit the
  parentheses when the method doesn't accept any arguments.

``` ruby
def some_method
  # body omitted
end

def some_method_with_arguments(arg1, arg2)
  # body omitted
end
```

* Never use `for`, unless you know exactly why. Most of the time iterators
  should be used instead. `for` is implemented in terms of `each` (so
  you're adding a level of indirection), but with a twist - `for`
  doesn't introduce a new scope (unlike `each`) and variables defined
  in its block will be visible outside it.

``` ruby
arr = [1, 2, 3]

# bad
for elem in arr do
  puts elem
end

# good
arr.each { |elem| puts elem }
```

* Never use `then` for multi-line `if/unless` or `when`.

``` ruby
# bad
if some_condition then
  # body omitted
end

case foo
when bar then
end

# good
if some_condition
  # body omitted
end

case foo
when bar
end
```

* Use the ternary operator(`?:`) over `if/then/else/end` constructs
  for single line conditionals.

``` ruby
# bad
result = if some_condition then something else something_else end

# good
result = some_condition ? something : something_else
```

* Use one expression per branch in a ternary operator. This
  also means that ternary operators must not be nested. Prefer
  `if/else` constructs in these cases.

``` ruby
# bad
some_condition ? (nested_something; another_nested_something) : something_else

# bad
some_condition ? (nested_condition ? nested_something : nested_something_else) : something_else

# good
if some_condition
  nested_condition ? nested_something : nested_something_else
else
  something_else
end
```

* The `and` and `or` keywords are banned. It's just not worth it. Always use `&&` and `||` instead.

* Avoid multi-line `?:` (the ternary operator), use `if/unless` instead.

* Favor modifier `if/unless` usage when you have a single-line body that does not extend beyond the maximum line length. Avoid modifier `if/unless` otherwise.

``` ruby
# bad
if some_condition
  do_something
end

do_something_in_a_method_with_a_long_name(arg) if long_condition

# good
do_something if some_condition

if long_condition
  do_something_in_a_method_with_a_long_name(arg)
end

# bad
names.select! do |name|
  name.start_with?("S")
end unless some_condition
```

* Conditionals should be on the same line as if/while/until.

```ruby
# bad
if
  some_condition
  do_something
end

# good
if some_condition
  do_something
end
```

* Never use `unless` with `else`. Rewrite these with the positive case first.

``` ruby
# bad
unless success?
  puts "failure"
else
  puts "success"
end

# good
if success?
  puts "success"
else
  puts "failure"
end
```

* Don't use parentheses around the condition of an `if/unless/while`.

``` ruby
# bad
if (x > 10)
  # body omitted
end

# good
if x > 10
  # body omitted
end
```

* Prefer `{...}` over `do...end` for single-line blocks.  Avoid using
  `{...}` for multi-line blocks (multiline chaining is always
  ugly). Always use `do...end` for "control flow" and "method
  definitions" (e.g. in Rakefiles and certain DSLs).  Avoid `do...end`
  when chaining.

``` ruby
names = ["Bozhidar", "Steve", "Sarah", "Jim Bob"]

# good
names.each { |name| puts name }

# bad
names.each do |name|
  puts name
end

# good
names.select { |name| name.start_with?("S") }.map { |name| name.upcase }

# bad
names.select do |name|
  name.start_with?("S")
end.map { |name| name.upcase }
```

* The `end` keyword should be aligned with _either_ the start of the line or the start of the block (e.g., where the `do` appears). This applies to all block syntaxes.

```ruby
# bad
foo.bar
   .each do
     baz
       end

# good
foo.bar
   .each do
     baz
   end

# good
variable = lambda do |i|
  i
end
```

* Indent the first line of the right-hand-side of a multi-line assignment.

```ruby
# bad
value =
if foo
  'bar'
end

# good
value =
  if foo
    'bar'
  end
```

* Use the return of a condition for assignment rather than setting the variable inside the condition's scope.

```ruby
# bad
if foo
  bar = 1
else
  bar = 2
end

case foo
when 'a'
  bar += 1
else
  bar += 2
end

# good
bar = if foo
        1
      else
        2
      end
```

* Avoid `return` where not required.

``` ruby
# bad
def some_method(some_arr)
  return some_arr.size
end

# good
def some_method(some_arr)
  some_arr.size
end
```

* Avoid use of nested conditionals for flow of control. Prefer a guard clause when you can assert invalid data. A guard clause is a conditional statement at the top of a function that bails out as soon as it can.

```
# bad
def compute_thing(thing)
  if thing[:foo]
    update_with_bar(thing[:foo])
    do_more_stuff
    yay_code
  end
end

# good
def compute_thing(thing)
  return unless thing[:foo]

  update_with_bar(thing[:foo])
  do_more_stuff
  yay_code
end
```

* Add an empty line after a guard clause, magic comment, or access modifier.

```ruby
# bad
def foo
  return if need_return?
  bar
end

# good
def foo
  return if need_return?

  bar
end

# good
def foo
  return if something?
  return if something_different?

  bar
end

# also good
def foo
  if something?
    do_something
    return if need_return?
  end
end
```

```ruby
# good
# frozen_string_literal: true

# Some documentation for Person
class Person
  # Some code
end

# bad
# frozen_string_literal: true
# Some documentation for Person
class Person
  # Some code
end
```

```ruby
# bad
class Foo
  def bar; end
  private
  def baz; end
end

# good
class Foo
  def bar; end

  private

  def baz; end
end
```

* Use spaces around the `=` operator when assigning default values to method parameters:

``` ruby
# bad
def some_method(arg1=:default, arg2=nil, arg3=[])
  # do something...
end

# good
def some_method(arg1 = :default, arg2 = nil, arg3 = [])
  # do something...
end
```

* The closing brace in an array or hash literal should be symmetrical with its opening brace.

```ruby
# bad
{ a: 1,
  b: 2
}
# bad
[
  :a,
  :b ]

# good
{ a: 1,
  b: 2 }

# good
[
  a: 1,
  b: 2
]
```

* Avoid using Perl-style special variables (like `$0-9`, `$`,
  etc. ). They are quite cryptic and their use in anything but
  one-liner scripts is discouraged. Prefer long form versions such as
  `$PROGRAM_NAME`.

* Never put a space between a method name and the opening parenthesis.

``` ruby
# bad
f (3 + 2) + 1

# good
f(3 + 2) + 1
```

* If the first argument to a method begins with an open parenthesis,
  always use parentheses in the method invocation. For example, write
  `f((3 + 2) + 1)`.

* Use `_` for unused block parameters.

``` ruby
# bad
result = hash.map { |k, v| v + 1 }

# good
result = hash.map { |_, v| v + 1 }
```

* Use safe navigation rather than checking for `nil` on an object. If you chain an ordinary method call after a safe navigation operator, it raises NoMethodError. Use a safe navigation operator after a safe navigation operator.

```ruby
# bad
foo.bar if foo
foo.bar.baz if foo

# good
foo&.bar
foo&.bar&.baz
```

* Do not use safe navigation with `empty?` in a conditional. While the safe navigation operator is generally a good idea, when checking `foo&.empty?` in a conditional, `foo` being `nil` will actually do the opposite of what the author intends.

```ruby
# bad
return if foo&.empty?
return unless foo&.empty?

# good
return if foo && foo.empty?
return unless foo && foo.empty?
```

* Pass source location metadata (filename and line number) into an `eval` method.

```ruby
# bad
eval "def do_something\nend\n"

# good
eval "def do_something\nend\n", binding, __FILE__, __LINE__ + 1
```

* Use `Kernel#loop` for infinite loops.

```ruby
# bad
while true
  work
end

# good
loop do
  work
end
```

---

Follow-on: Advice for Robust Ruby and Rails Code.

* `Hash#fetch` from Shopify styleguide
* Use "squiggly heredoc" syntax, which has the same semantics as `strip_heredoc` from Rails.
* Use `Regexp#match` instead of `=~`
* Using the return value of an assignment (in conditionals, etc)
* `===`, `is_a?` and `kind_of?`
* Method visibility modifiers: `protected` vs `private`
* `||=` for initialization (when to use and when to not use, memoization)
* [Order of includes](https://github.com/bbatsov/rails-style-guide/issues/65)
