# A Light Journey Into Pokemon

A limited model of a main series Pokemon game!

## Installation

Fork and clone the repository

```bash
git clone git@github.com:cjp34/ruby-project-guidelines-dc-web-012720.git
```

The csv file for the pokemon database is found in the lib/csv file/ folder. In order to upload the CSV file please follow these steps:

1. Rollback the three migrate files by using the command "rake db:rollback
2. Then create your database using the command "rake db:migrate"
3. Open your DB Browser for SQLite
4. In your DB broswer, click on "open database" and navigate to this file in your finder
5. Inside this file navigate to the following file path 'pokemon/db/development.db
6. On the "Database Structure" view, right click on the pokemons table and delete it
7. Click on file and go down to import, select "Table from CSV file"
8. Navigate to the lib folder of this file and under csv files, select pokemons.csv
9. Be sure to check "coloumn names in first line" and click ok
10. Close and save your DB browser
11. You're ready to play Pokemon


## Built With

Ruby

sqlite3

VSCode

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## Authors
Carl Parm

Matteo Ricci