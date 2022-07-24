![LandingPage](https://github.com/AbdoulBaguiM/ginfo/blob/main/public/img/landingPage.png)

# GINFO ecommmerce application

## Installation

1. Clone the repo and `cd` into it
2. Run `composer install`
3. Rename or copy `.env.example` file to `.env`
4. Generate the key by running `php artisan key:generate`
5. Set your database credentials in your `.env` file
6. Set your Stripe credentials in your `.env` file. Specifically `STRIPE_KEY` and `STRIPE_SECRET`
7. Set your mail credentials in your `.env` file. Specifically `MAIL_MAILER`, `MAIL_HOST`, `MAIL_PORT`, `MAIL_USERNAME`, `MAIL_PASSWORD`, `MAIL_ENCRYPTION`. (You can get the username and password by creating a MailTrap account [Mailtrap](https://mailtrap.io/).
8. Set your MailChimp credentials in your `.env` file. Specifically `MAILCHIMP_APIKEY`, `MAILCHIMP_LIST_ID`. (You can get those by creating a MailChimp account [MailChimp](https://mailchimp.com/fr/).
9. Set your Braintree credentials in your `.env` file if you want to use PayPal. Specifically `BT_MERCHANT_ID`, `BT_PUBLIC_KEY`, `BT_PRIVATE_KEY`. If you don't, it should still work but won't show the paypal payment at checkout (It's necessary to uncomment the braintree section in checkout page).
10. Set your NoCaptcha credentials in your `.env` file. Specifically `NOCAPTCHA_SECRET`, `NOCAPTCHA_SITEKEY`.
11. Set your `APP_URL` in your `.env` file. This is needed for Voyager to correctly resolve asset URLs.
12. Set `ADMIN_PASSWORD` in your `.env` file if you want to specify an admin password. If not, the default password is 'password'
13. Import the database on phpAdmin (ginfo.sql) or run `mysql -u username -p database_name < ginfo.sql`. This will create the database and with all the dummy datas.
14. Make a symbolic link of the `storage/app/public` folder in `public` (for the images to be displayed)
15. Run `php artisan serve`, the app will be available at : `localhost:8000`
16. Visit `/admin` if you want to access the Voyager admin backend. Admin User/Password: `admin@admin.com/password`.

## Shopping Cart Package

The [hardevine/LaravelShoppingcart](https://github.com/hardevine/LaravelShoppingcart) is used for the Cart.
