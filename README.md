bundle
 ```

 ### To set up the database

 Connect to `psql` and create the `bookmark_manager` database:

 ```
 CREATE DATABASE bookmark_manager;
 ```

 To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

 ### To run the Bookmark Manager app:

 ```
 rackup -p 3000
 ```

 To view bookmarks, navigate to `localhost:3000/bookmarks`
 To view bookmarks, navigate to `localhost:3000/bookmarks`.

 ### To set up the test database

 Connect to `psql` and create the `bookmark_manager_test` database:

 ```
 CREATE DATABASE bookmark_manager_test;
 ```

 ### To run tests:

```
rspec
```
### To run linting:
```
rubocop


### User Stories
```
As a user, So that I can see all my bookmarks, I'd like to see a list of my bookmarks.
```
```
As a user, So that I can see all my bookmarks, I'd like to add a new bookmark.
```

```
As a user, So that I can edit my bookmarks, I'd like to be able to delete bookmarks.
```

```
As a user, So that I can edit my bookmarks, I'd like to be able to update bookmarks.
```

```
As a user, So that I can add additional information, I'd like to comment on bookmarks.
```

```
As a user, So that I can organise my bookmarks, I'd like to be able to tag bookmarks into categories.
```

```
As a user, So that I can find relevant bookmarks, I'd like to be able to filter bookmarks by tag.
```

```
As a manager, So that I can prevent users from accessing other users bookmarks, I'd like to be able to restrict users to manage only their own bookmarks.
```