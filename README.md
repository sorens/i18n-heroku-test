#Rails 3.1.1, Ruby 1.9.3, Heroku, I18n, Active Admin

There is some problem with `active_admin`, `I18n` and `Heroku` where new translations that I add to be used inside of active_admin pages are not loaded by Heroku in the web app yet are visible via the console. This sample app demonstrates the problem.

##Default Active Admin user

This app uses the default active_admin admin_user

    admin@example.com
    password

##Active Admin 0.3.2

I can't use later versions of Active Admin because of a bug with the `scoped_collection`. see [https://github.com/gregbell/active_admin/issues/756](https://github.com/gregbell/active_admin/issues/756)

##How to Reproduce

  * Visit the heroku instance, http://i18n-heroku-test.herokuapp.com/admin
  * Login with above credentials
  * Observe that the dashboard is missing translated strings
  
##Locally

My local RVM setup

    > rvm list
    rvm rubies

       ruby-1.8.7-p299 [ x86_64 ]
       ruby-1.8.7-p352 [ x86_64 ]
       ruby-1.9.2-p290 [ x86_64 ]
    => ruby-1.9.3-p125 [ x86_64 ]

Screen shot

![local](https://github.com/sorens/i18n-heroku-test/raw/master/doc/local01.png)

##Heroku

This shows the heroku info

  Heroku Info

    > heroku info
    === i18n-heroku-test
    Addons:        Basic Logging, Shared Database 5MB
    Database Size: 128k
    Git URL:       git@heroku.com:i18n-heroku-test.git
    Owner:         
    Repo Size:     14M
    Slug Size:     25M
    Stack:         cedar
    Web URL:       http://i18n-heroku-test.herokuapp.com/

The config for this heroku app

    > heroku config
    DATABASE_URL        => [REMOVED]
    GEM_PATH            => vendor/bundle/ruby/1.9.1
    LANG                => en_US.UTF-8
    LOCALE              => en
    PATH                => bin:vendor/bundle/ruby/1.9.1/bin:/usr/local/bin:/usr/bin:/bin
    RACK_ENV            => production
    RAILS_ENV           => production
    SHARED_DATABASE_URL => [REMOVED]
    
Screen shot

![heroku](https://github.com/sorens/i18n-heroku-test/raw/master/doc/heroku01.png)

##Active Admin Issue 334

[https://github.com/gregbell/active_admin/issues/334](https://github.com/gregbell/active_admin/issues/334)


