# Jungle

Jungle is a Ruby on Rails e-commerce web application that allows users to browse, add items to their cart, and check out using Stripe for payments. The application features an admin interface to manage products and categories.

## Features

- Browse products by category
- Add products to the cart
- Manage the cart (add/remove items, update quantities)
- Checkout and complete purchases
- User authentication
- Admin dashboard for managing products and categories
- Responsive design

## Final Product

### Home Page

![Jungle - Home]()

### Login & Sign Up Page

![Jungle - Login]()
![Jungle - Sign Up]()

### Cart Page

![Jungle - Cart]()

### Order Page

![Jungle - Order]()

### Admin Views

![Jungle - Admin Dashboard]()
![Jungle - Admin Sales]()

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Ruby 2.6.6
- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
