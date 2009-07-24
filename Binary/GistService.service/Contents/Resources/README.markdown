GistService
===========

A simple OS X service for easily posting text or files to Gist on Github.

Installation
------------

Just copy GistService.service to ~/Library/Services, or /Library/Services if you want it for all users.

On Snow Leopard, you'll have to enable this service in the Keyboard Preferences pane.

Authentication
--------------

By default, GistService will post your Gists anonymously, but if you'd like, you can set it up to paste as yourself; just run:

    git config --global github.user "your github username"
    git config --global github.token "your github token"
	
You can get these values by visiting https://github.com/account and clicking on "Global Git Config."

Acknowledgements
----------------

GistService was written by Andy Matuschak <andy@andymatuschak.org>

But it's just a wrapper around gistpaste, a script by David Blevins <dblevins@visi.com>. Thanks, David!