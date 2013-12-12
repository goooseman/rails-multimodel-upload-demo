### Multiform fileupload demo with Ruby on Rails 4, jquery-fileupload-rails, bootstrap 3 and paperclip
When I was building my own project I got one problem: I needed one page, on which user creates a new models instance with params and add multiple photos, which are belong_to this model. Yes, I can use "multiple" tag for a file input, but I need to show user his photos before upload.   
I really believe that it is a common usercase, but I didn't find any demo or tutorial to build this with jquery-file-upload. So I built it myself.  
## Attention:
You need ImageMagick to be installed on your system to run this. To install it on OSX with [Homebrew](http://brew.sh) use ``` brew install imagemagick ```  
## Gems:
 - paperclip
 - jquery-fileupload-rails
 - anjlab-bootstrap-rails
  
## To use my demo:
 - git clone
 - cd
 - bundle install
 - rake db:migrate
 - rails s

## To start from a scratch:
 - install gems
 - add necessary stylesheets and js
 - rails g scaffold item name:string model:string price:integer
 - rails g scaffold upload item_id integer
 - rails g paperclip upload upload
 - rake db:migrate
 - fill models
 - add uploads_attributes to items_controller (in params.require)
 - add upload destroy to items_controller (in destroy method) (this makes photos to be deleted with item destroy)
 - edit new_item view
 - edit index_item view
 
