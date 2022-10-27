# Implementation of a HR Data Warehouse with DBT tool

## Prerequisites
- Docker compose
- dbt, installation is described later on
- git


## Steps to build warehouse
1. Clone the git repo
    ```
    git clone https://github.com/andriimazur93/dbt_project.git
    ```

    Warning! I was not able to install dbt on my MacOS(intel) with Homebrew, so I use another official way to run dbt, via python venv:

2. Create and run a virtual environment
    ```
    cd dbt_project
    python -m venv venv
    source venv/bin/activate
    ```

3. install dbt library 
    ```
    pip install dbt-postgres
    ```

4. Check if installation was correct 
    ```
    dbt --version
    ``` 


5. Run docker container in background
    ```
    docker-compose up -d
    ```

6. Move to dbt project folder 
    ```
    cd dbt_demo
    ``` 

7. Create tables from csv files stored in `seeds` folder
    ```
    dbt seed
    ```

8. Execute compiled sql model against connected Postgres database

    ```
    dbt run
    ```

9. To generate documentation run following
    ```
    dbt docs generate
    dbt docs serve
    ```

10. Clean-up
    ```
    cd ..
    docker-compose down
    ```
