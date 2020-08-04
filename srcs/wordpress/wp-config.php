<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress');

/** MySQL database username */
define('DB_USER', 'wordpress');

/** MySQL database password */
define('DB_PASSWORD', '2266Z1KDyOmkFhAkiTCp');

/** MySQL hostname */
define( 'DB_HOST', 'localhost:/var/run/mysqld/mysqld.sock' );

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '7iZ[d&-w2v%B|Q%9tncQ#9|69d@Fk8f*^Y!I3Fu2+s]zn-`Tj/kbK@T8/|o@DVK-');
define('SECURE_AUTH_KEY',  'R.7.^ZmeC+rL]-a%x?{c0r(| 4D%Ldd:f[Bq(F,_;@:v<h&YZbou4L8}0JU%j#G0');
define('LOGGED_IN_KEY',    'H&FC3B|hbls(`#[A;s(g3[meO{L[Qsn-P]->($:B>bBMeAlL[x&JijPa F)RKnH!');
define('NONCE_KEY',        'f2k`&N+8BDoJCo/#sTTDy$JM!RqxA6j;-v2j=>^(<,#!5py;MH)1j/xd-KeVTTkR');
define('AUTH_SALT',        'yjb|q6SI+%q`{|p!C{DAb|fgsF|]/Y|+wKWOm1d:*p~x[JUB5aY5T3EOAxrZ+WnJ');
define('SECURE_AUTH_SALT', 'P&5DQ#G{z6kQ>v8$k`:95~M2B)Nsd*YHR&~^S|^mW_%LxEklc|n$&vp>@jE}o[eR');
define('LOGGED_IN_SALT',   '2U<5.V)q|DKa~NmT ikkj6c8}:XE^B:=FEMH2T+38).BdXG;(Ey)@C*{:3C-i?p<');
define('NONCE_SALT',       'Kn1:R;#|lWrP{HH:&lX%sug<:-]nQ{?I.XX~m)4^7)2!Sav-^YZ7peG0tY=<MU^*');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
