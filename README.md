NAME
====
  fucking_favicons.rb

  <img src='http://s3.amazonaws.com/drawohara.com.gifs/favicons.gif' style='max-height:100px;'>

TL;DR
=====

```ruby

  # install the fucking favicon gem

  gem 'fucking_favicons'

```


```bash

  # make a fucking favicon

  ~> cd app/views/images

  ~> curl -sO http://s3.amazonaws.com/drawohara.com.images/favicon.png

```

```erb

  <!-- drop it in yer fucking layoutz -->

  <%= render :template => 'fucking_favicons' %>

```

ABOUT
=====

  fucking_favicons.rb is the best gem in the world.
  
  if you doubt this, read https://css-tricks.com/favicon-quiz/ 

  fucking_favicons.rb is a rails engine, and rack middleware, which lets you
  provide a *single* favicon.png file for your project and let all the rest be
  dynamically generated on the fly.  it also gives you a handy view that
  vommits this out:

  <img src='https://s3.amazonaws.com/ss.dojo4.com/qrlxRqq0XC7Uweu6DOYrYx8E11A73Qk0tn1YYPMjyzOQqs5bRSC4MBo.png' style='max-height:100px'>

  the favicons are generated on the fly only once, and cached in memory.  they
  are served with the last-modified time of the file on disk.  so, this will
  peform just fine.

  you can use this gem in rails, or a rack app

```ruby

  # for rack apps

    use FuckingFavicons, :path => 'path/to/favicon.png'

```

