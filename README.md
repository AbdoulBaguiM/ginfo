
# GINFO ecommmerce application

## Installation

1. Clone the repo and `cd` into it
2. Run `composer install`
3. Rename or copy `.env.example` file to `.env`
4. Generate the key by running `php artisan key:generate`
5. Set your database credentials in your `.env` file
6. Set your [Stripe](https://dashboard.stripe.com/login) credentials in your `.env` file. Specifically `STRIPE_KEY` and `STRIPE_SECRET`
7. Set your mail credentials in your `.env` file. Specifically `MAIL_MAILER`, `MAIL_HOST`, `MAIL_PORT`, `MAIL_USERNAME`, `MAIL_PASSWORD`, `MAIL_ENCRYPTION`. (You can get the username and password by creating a [Mailtrap](https://mailtrap.io/) account.
8. Set your MailChimp credentials in your `.env` file. Specifically `MAILCHIMP_APIKEY`, `MAILCHIMP_LIST_ID`. (You can get those by creating a [MailChimp](https://mailchimp.com/fr/) account.
9. Set your [Braintree](https://www.braintreegateway.com/login) credentials in your `.env` file if you want to use PayPal. Specifically `BT_MERCHANT_ID`, `BT_PUBLIC_KEY`, `BT_PRIVATE_KEY`. If you don't, it should still work but won't show the paypal payment at checkout (It's necessary to uncomment the braintree section in checkout page).
10. Set your reCaptcha credentials in your `.env` file. Specifically `NOCAPTCHA_SECRET`, `NOCAPTCHA_SITEKEY`.
11. Set your `APP_URL` in your `.env` file. This is needed for Voyager to correctly resolve asset URLs.
12. Import the database `ginfo.sql` on phpMyAdmin or run `mysql -u username -p database_name < ginfo.sql`. This will create the database and with all the dummy datas.
13. Make a symbolic link of the `storage/app/public` folder in `public` (for the images to be displayed)
14. Run `php artisan serve`, the app will be available at : `localhost:8000`
15. Visit `/admin` if you want to access the Voyager admin backend. Admin User/Password: `admin@admin.com/password`.

## Shopping Cart Package

[hardevine/LaravelShoppingcart](https://github.com/hardevine/LaravelShoppingcart) is used for the Cart.

## Admin dashboar

[Voyager-tcg](https://github.com/the-control-group/voyager) is used for the admin dashboard.

## Landing page

![LandingPage](https://github.com/AbdoulBaguiM/ginfo/blob/main/public/img/landingPage.png)
