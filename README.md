# README

Before you run the application, you need to have ImageMagick installed to view the photos for majority of the application.

The app was developed as a part of my rails portfolio, and is intended to be a hub for creations in real life. The app is very simple to use and anyone can post what they created.

To run the application, simply run cd into the folder

```bundle install```

Run the migrations and run by ```rails s```

If you wish to use the OmniAuth, create your own ```.env``` file in the root folder and fill in your own google credentials.

```
google_client_id=<your client id here>
google_client_secret=<your secrete key here>
```


If you simply do not want to use the OmniAuth, just navigate the view file under ``` app/views/sessions/new.html.erb```

and comment this code out:
```
<%= button_to('Google Sign In', "/auth/google_oauth2", {class: "w3-button w3-block w3-light-grey w3-margin-top"})%>
```

Happy Exploring!
