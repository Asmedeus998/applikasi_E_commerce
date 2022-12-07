# Ecommerce Quickstart Guide

## Setup

1. download [Python]
2. download [pgadmin](https://www.pgadmin.org/download/)
3. download [postgresql](https://www.postgresql.org/download/)

4. Clone this repository

5. Navigate into the project directory

   ```python
   cd applikasi_E_commerce
   ```

6. Create a new virtual environment

   ```python
   python -m venv venv
   .\venv\Scripts\activate
   ```

7. Install the requirements

   ```python
   pip install --upgrade pip  
   pip install -r requirements.txt
   pip freeze
   ```


8. Migrate database

   ```python
   python manage.py migrate
   ```

9. Run django in local

   ```python
   python manage.py runserver
   ```


