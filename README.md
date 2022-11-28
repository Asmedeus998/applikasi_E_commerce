# Ecommerce Quickstart Guide

## Setup

1. download Python 3.8

2. Clone this repository

3. Navigate into the project directory

   ```bash
   $ cd applikasi_E_commerce
   ```

4. Create a new virtual environment

   ```bash
   $ python -m venv venv
   $ . venv/bin/activate
   ```

5. Install the requirements

   ```bash
   $ pip install -r requirements.txt
   ```


6. Migrate database

   ```python
   python manage.py migrate
   ```

7. Run django in local

   ```python
   python manage.py runserver
   ```


