# Mushroom qualifier
Web application for qualifying mushrooms by their look made with Spring MVC, Hibernate and Postgres SQL

## DEMO: https://mushrooms-qualifier.herokuapp.com/findMushroom

## About project
This is a training project which used to be basic CRUD but turned out to be a messy piece of shit-code, even messier after all fixes made to deploy it on Heroku.
I still don't want to delete or shut down it, because I learned a lot of new methods and classes, some of them deprecated tho, but now I know why not to use them and what better practice exists.
I also understand how to absolutely ruin Controller and make app uneditable. 
The fact that Heroku doesn't let you upload files into filesystem make me rewrite half of the code (to upload files to DB) and that was all my fault because the method of uploading was not separated enough. 
Also searching with Criteria (deprecated) and the whole base structure is very bad. 

But the bad experience is still experience. I got an idea and started realization without much thinking about structure. That was my main mistake, I will try to avoid it in my next projects (but probably fail a few more times). Mushrooms just make me crazy :) I love them.
Here is DB structure, it's bad, but represents Many-to-Many and One-to-Many relationships. I would prefer to learn it again on some smaller project tho.
![My image](https://github.com/Hexronimo/mushrooms_qualifier/raw/master/forreadme/ggggg.jpg)

App looks fancy but there are too many options, it may confuse final user 
![My image](https://github.com/Hexronimo/mushrooms_qualifier/raw/master/forreadme/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%20%D0%BE%D1%82%202019-09-29%2017-43-32.png)

There are few pages: 
* Add mushroom. You may create new mushroom and add it to DB here. You also may create new mushroom parts (types of caps and stipes, types of other side of caps etc.) and their colors.
* List of mushrooms. Just list of all added mushrooms. I added about 20 for demo.
* Search. You may choose mushroom parts and colors, then press "Искать" button and (slow as turtle) search will bring you some result.

There is nothing special about search algorithm. It just select msuhrooms with choosen part types and with same colors from DB, Criteria class from Hibernate used.
Oh, also I used ajax sending and retriving data. But I still don't understand how to reload one div with ajax priperly without nesting, when data loaded from DB not from Ajax success function (well it works, but ugly).

Anyway, I don't want to stop on this, fix it, rewrite it (no, no, no, there is no way I do it)! 
I will let it stay as it is, and skip to smaller but more clean projects as in my [servlets repo](https://github.com/Hexronimo/servlets).
And then I need go back from the web to basics Java to learn more about Multithreading and Collections and working with filesystem.

## Made With
* [Java 8](https://www.java.com/en/)
* [Spring](https://spring.io/)
* [Hibernate](http://hibernate.org/)
* [Maven](https://maven.apache.org/)
* [Bootstrap 4](https://getbootstrap.com/)
* [PostgreSQL](https://www.postgresql.org/download/)
* [Ajax](https://api.jquery.com/jQuery.ajax/)
