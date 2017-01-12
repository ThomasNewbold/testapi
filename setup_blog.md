# Setting up a very basic Phoenix JSON application

Having just entered the world of Ruby on Rails I was pretty amazed how quickly a lone developer can get up and running a web application. The Phoenix framework for Elixir holds up and so far seems to outperform setting up a similar web application. To learn Phoenix I took a different approach to learning than I did for Ruby on Rails, I began by spending more time understanding the language of Elixir, whereas while learning Rails, I did not take the initial time to learn Ruby. The reason for the difference was more out of necessity of learning Rails quickly for work, learning Elixir and Phoenix did not have the same time requirments to get up and running. This time I took some time to learn Elixir first and then move on to Phoenix. I don't think this approach was any better, despite this being the first functional programming language I've taken a crack at, the knowledge I gained did not prove to be particularly useful when setting up the basic web app. 

Once I began looking into Phoenix, I quickly saw the similarities between Rails and Phoenix. After installing Phoenix and Elixir the command to generate a Phoenix app is: 
```
	mix phoenix.new testapi
```
Immediatley after creating a Phoenix app it does not take much expierence in Rails to notice that the file structure is very similar. Instead of the core of the MVC model being in the app folder, as it is in Rails, in Phoenix it is in the web folder. At the top level the mix.exs file lives and mirrors that of a Gemfile. 
I wanted my app to just be a JSON application so I ignored the html.eex templates, to explicitly not have them and assets generated you can append --no-brunch --no-html
```
	mix phoenix.new testapi --no-brunch --no-html
```
I did not append these flags when creating my simple app and ran into no complications as a result. The next step to take is to generate a model explicitly using the json ecto call:
```
	mix phoenix.gen.json User users fullname:string email:string
```
Running this commande generates a number of files, the four to look at are:
*	web/models/user.ex
*	web/controllers/user_controller.ex
*	web/views/user_view.ex
*	priv/repo/migrations/20170110190351_create_user.exs
The first file is the User models, which from the command was defined to have two attributes, a fullname and an email, both of type string. Looking into that file we see that Phoenix added the timestamps function to the schema which, much like Rails 'timestamps' function generates created_at and updated_at fields. 
The next file to look at is the user_controller.ex. From our one generate command, all the basic CRUD operations were added to the controller. 
The user_view.ex file is important for our JSON rendering. Since our command specified generating JSON, this file gives the structure of what a User object looks like when converted to JSON. The structure is very simple consisting of an id and the two fields specified in the command, fullname and email. I added the following two lines to also retrieve the create and update time, my render user.json looks like:
```
	def render("user.json", %{user: user}) do
	    %{id: user.id,
	      fullname: user.fullname,
	      email: user.email,
	      created_at: user.inserted_at,
	      updated_at: user.updated_at}
  	end
```
The final file of importance to the scope of this write up is the migration file. In line with ActiveRecord in Rails, this file is calling upon Ecto.Migration to create the User table with the two columns we defined, fullname and email, as well as the timestamps. 

All of this code was created with only a few simple commands after the initial setup of our Phoenix app. All in all, just like Rails getting a basic app up and running is extremely simple to do.