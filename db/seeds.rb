# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Book.create({:title => 'Agile Web Development with Rails',
	  :authors =>  'Dave Thomas and David Heinemeier Hansson, with Leon Breedt, Mike Clark, James Duncan Davidson, Justin Gehtland, and Andreas Schwarz',
	  :description =>  'Ruby on Rails helps you produce high-quality, beautiful-looking web applications quickly. You concentrate on creating the application, and Rails takes care of the details. Tens of thousands of developers have used this award-winning book to learn Rails. It is a broad, far-reaching tutorial and reference that is recommended by the Rails core team. If you are new to Rails, you will get step-by-step guidance. If you are an experienced developer, this book will give you the comprehensive, insider information you need.',
	  :isbn =>  '978-0-9776-1663-3'})

Book.create({:title =>  'Programming Ruby 1.9',
 	  :authors =>  'Dave Thomas, with Chad Fowler and Andy Hunt',
 	  :description =>  'Would you like to go from first idea to working code much, much faster? Do you currently spend more time satisfying the compiler instead of your clients or end users? Are you frustrated with demanding languages that seem to get in your way, instead of getting the work done? Are you using Rails, and want to dig deeper into the underlying Ruby language? If so, then we have got a language and book for you!',
  	:isbn =>  '978-1-93435-608-1'})

Book.create({:title =>  'Rails Recipes: Rails 3 Edition',
  :authors =>  'Chad Fowler',
  :description =>  'Written for novice to intermediate Rails developers, Rails Recipes: Rails 3 Edition is packed with solutions to 70 of the most vexing problems you are likely to face on the job. From building custom forms and powering pages with JQuery to integrating with legacy databases, it is all here. Each recipe has been updated to reflect the latest features of Rails 3.1 and each lays out a distinctive solution to a problem you may be facing today or could well encounter tomorrow. In addition, you will find half the book is stocked with new eye-opening solutions to such common problems as how to extend Rails, test and deploy your sites, or add a web service to your actions. And each recipe not only lays out a succinct solution, but explains its rationale and the technologies that make it work.',
  :isbn =>  '978-1-93435-677-7'})
  
Book.create({:title =>  'Build Awesome Command-Line Applications in Ruby',
  :authors =>  'David Bryant Copeland',
  :description =>  'As Ruby pro David Copeland explains, writing a command-line application that is self-documenting, robust, adaptable and forever useful is easier than you might think. Ruby is particularly suited to this task, since it combines high-level abstractions with close-to-the-metal system interaction wrapped up in a concise, readable syntax. Moreover, Ruby has the support of a rich ecosystem of open-source tools and libraries.',
  :isbn =>  '978-1-93435-691-3'})

Book.create({:title =>  'Rails AntiPatterns: Best Practice Ruby on Rails Refactoring',
	:authors =>  'Chad Pytel, Tammer Saleh',
	:description =>  'The Complete Guide to Avoiding and Fixing Common Rails 3 Code and Design Problems.
As developers worldwide have adopted the powerful Ruby on Rails web framework, many have fallen victim to common mistakes that reduce code quality, performance, reliability, stability, scalability, and maintainability.',
	:isbn =>  '9780321604811'})

Book.create({:title =>  'Beginning Rails 3',
	:authors =>  'Cloves Carneiro, Rida Al Barazi',
	:description =>  'Beginning Rails 3is the practical starting point for anyone wanting to learn how to build dynamic web applications using the Rails framework for Ruby. You will learn how all of the components of Rails fit together and how you can leverage them to create sophisticated web applications with less code and more joy. This book is particularly well suited to those with little or no experience with web application development, or who have some experience but are new to Rails.',
	:isbn =>  '9781430224334'})


Book.create({:title =>  'Ruby on Rails Bible',
	:authors =>  'Timothy Fisher',
	:description =>  'Thanks to the explosive growth in popularity of the Rails framework, the equally popular Ruby programming language now has a great place to hang its hat. The powerful combination of the two provides the perfect toolset to create Web applications that feature concise code, clean syntax, and easy maintenance. This must-have book is your best guide on how to jump on the RoR bandwagon, from the basics of Ruby programming to advanced techniques for experienced Rails developers.',
	:isbn =>  '9780470258224'})

Book.create({:title =>  'Harry Potter and the Deathly Hallows',
	:authors =>  'J. K. Rowling',
	:description =>  'Harry Potter is preparing to leave the Dursleys and Privet Drive for the last time. But the future that awaits him is full of danger, not only for him, but for anyone close to him - and Harry has already lost so much. Only by destroying Voldemort',
	:isbn =>  '9781408810293'})

Book.create({:title =>  'Harry Potter and the Order of the Phoenix',
	:authors =>  'J. K. Rowling',
	:description =>  'When the government of the magic world and authorities at Hogwarts School of Witchcraft and Wizardry refuse to believe in the growing threat of a freshly revived Lord Voldemort, fifteen-year-old Harry Potter finds support from his loyal friends in facing the evil wizard and other new terrors.',
	:isbn =>  '9781439520024'})

Book.create({:title =>  'The Da Vinci Code',
	:authors =>  'Dan Brown',
	:description =>  'Harvard professor Robert Langdon receives an urgent late-night phone call while on business in Paris: the elderly curator of the Louvre has been brutally murdered inside the museum. Alongside the body, police have found a series of baffling codes. ',
	:isbn =>  '9781409091158'})

Book.create({:title =>  'War and Peace',
	:authors =>  'Leo Tolstoj',
	:description =>  'A new version. The one Tolstoy originally intended, but has been hitherto unpublished, of most famous Russian novel; with a different ending, fewer digressions and an altered view of Napoleon. It is time to look afresh at one of the world favourite books.',
	:isbn =>  '9780007396993'})
	  
