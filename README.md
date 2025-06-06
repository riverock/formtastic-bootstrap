# Formtastic Bootstrap (Formtastic 4 fork)

[![Build Status](https://travis-ci.org/mjbellantoni/formtastic-bootstrap.svg?branch=master)](https://travis-ci.org/mjbellantoni/formtastic-bootstrap)

A [Formtastic](https://github.com/justinfrench/formtastic) form builder that creates markup suitable for the [Twitter Bootstrap](http://twitter.github.com/bootstrap/) framework.  In theory, it should just work.  Two great tastes in one!

You can follow [FormBoot on twitter](http://twitter.com/FormBoot) for update announcements and other relevant info.

## Getting Started

### Dependencies

This version of Formtastic Bootstrap should support the following:

*Bootstrap*

* Bootstrap 3.x

*Rails*

* Rails 3.2.x
* Rails 4.x.x

*Formtastic*

* Formtastic 2.2.x
* Formtastic 2.3.x

*Ruby*

* 1.9.2
* 1.9.3
* 2.x.x

#### Installation

Install the gem with

    gem install formtastic-bootstrap

Or add it to your Gemfile:

    gem 'formtastic-bootstrap'

And install it with <tt>bundle install</tt>.

#### Configuration

Add the following line to your Formtastic initialization file:

    # config/initializers/formtastic.rb
    Formtastic::Helpers::FormHelper.builder = FormtasticBootstrap::FormBuilder

Add the following line to the top of your <tt>application.css</tt> file:

    # app/assets/stylesheets/application.css
    *= require formtastic-bootstrap

Make sure you've already downloaded and installed Formtastic! Do *not* however require formtastic in your `application.css` file or you will have many bootstrap/formtastic-bootstrap styles overwritten.


## Formtastic vs. Formtastic Bootstrap

THIS SECTION IS OUT OF DATE.

### Overview

In general, Formtastic creates very verbose HTML whereas
Bootstrap expects (ever) simpler HTML.  Every attempt has been
made to generate the HTML expected by Bootstrap while still
generating the rich HTML provided by Formtastic.  When there
is a conflict, Bootstrap wins.


### Major Difference in Behavior

THIS SECTION IS OUT OF DATE

* Formtastic Bootstrap omits the <tt>label</tt> class on label tags since Twitter Bootstrap uses this tag in another context (and it makes bad things happen.)
* Formtastic Bootstrap puts the <tt>input</tt> label in a different place because it makes Bootstrap behave correctly.
* Formtastic Bootstrap renders <tt>:date</tt>, <tt>:datetime</tt> and <tt>:time</tt> as text fields since this is how Twitter Bootstrap presents these data types  (Formtastic renders them as dropdowns.) Some Rails magic may have been lost here.  Additionally:
  * <tt>:date</tt> et al are tagged with the <tt>stringish</tt> class.
  * Hidden fields are not generated.
* Fieldsets are simply nested.
* <tt>f.buttons :name</tt> is not supported.  This generates a <tt>fieldset</tt> and <tt>legend</tt> tag which will cause the wrong thing to happen in Bootstrap.

Bootstrap is somewhat incomplete, and in a few cases an inference needed to be drawn to determine a course of action.  If you disagree with any of these choices, feel free to let me know.

The gem also provides some "shim" CSS where Bootstrap is missing styles provided Formtastic.

### Other

A lot of the code (especially the test suite) was copied
over from Formtastic and then beaten into submission.  I'm
sure you'll find some ugliness in there.  In general, I
mimicked the Formtastic code structure as much as possible.

In particular:

* Bootstrap doesn't say anything about nested <tt>formfields</tt>.
* Bootstrap doesn't explicitly lay out a <tt>:boolean</tt> control.
* Bootstrap doesn't explicitly say everything that needs to be said about <tt>:datetime</tt>, <tt>:date</tt>, and <tt>:time</tt>.
* I've inferred what <tt>:datetime</tt> should do since there's not example of a single <tt>:datetime</tt>.
* In some places the markup is tortuous (e.g. <tt>:boolean</tt>.)  Hopefully as Bootstrap evolves these can get simplified!
* Bootstrap uses different HTML classes for sentence-based inline/block error messages.

### What's Missing

Contributions are welcome!

* Formtastic's <tt>:country</tt> has not yet been implemented.
* I'm sure there's lots ...

## Usage

In general, the usage should be identical to Formtastic's.  Some changes have been introduced in order to support Bootstrap-specific controls.

### Bootstrap-specific Controls

#### Prepended Text
To create a Prepended Text field, use the ```:prepend``` option.  This works on any text field input type, like ```:url```, ```:search```, and of course ```:string```

    <%= semantic_form_for @user do |f| %>
      <%= f.inputs do %>
        <%= f.input :handle, :prepend => '@' %>
      <% end %>
    <% end %>

#### Appended Text
To create an Appended Text field, use the ```:append``` option.  This works on any text field input type, like ```:url```, ```:search```, and of course ```:string```

    <%= semantic_form_for @user do |f| %>
      <%= f.inputs do %>
        <%= f.input :handle, :append => '%' %>
      <% end %>
    <% end %>

#### Appended Content
To add appended elements that are not contained within an add-on span
use the ```:append_content``` or ```:prepend_content``` option.

    <%= semantic_form_for @user do |f| %>
      <%= f.inputs do %>
        <%= f.input :handle, :append_content => content_tag(:a, "Click Here", :class => 'btn') %>
      <% end %>
    <% end %>

## Contributing

### Contributors

A big thank you [to all contributors](https://github.com/mjbellantoni/formtastic-bootstrap/contributors)!

### Submitting Issues

If you're filing a bug, thank you!  Secondly, in the report please include:

* The version of Formtastic you're using.
* The version of Twitter Bootstrap you're using.
* The code for your form.
* Anything else you think will help!

### Source Contributions

Source contributions are very welcome!  Most of the recent work on this package has been done by the community.

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it and to run the test suite.  **If you don't have tests, I won't accept the pull.**  If you need help with this, please ask.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.


### To Do

* Field Types
 * Basic Formtastic
   * :country
   * :time_zone
 * Fancy Bootstrap Fields
   * Date Range
   * Prepend Checkbox
   * Appended Checkbox
* :datetime, :date, :time
 * As rich functionally as their Rails counterparts.
 * Extract into a standalone gem.
* Tests
 * Fill in all pending specs
 * Refactor
 * More -- See if I'm making sure the Bootstrap classes are present.
* Documentation
* Refactor :boolean to use common "choices" code (if possible.) (Not sure it is.)
* Boostrap
  * Why 'help-inline' and 'help-block' when they could have done p.help and span.help?


## Copyright

Copyright (c) 2013-2015 Matthew Bellantoni. See LICENSE.txt for further details.

