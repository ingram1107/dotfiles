# Additional points when configuring Isync

Since Google disabled the option to allow [less secure app to access your
account](https://support.google.com/accounts/answer/6010255?hl=en#zippy=), Isync
can no longer able to use plain password to sync the mailboxes. The alternative
is to use OAUTH2 method, that is by using `client_id` and `client_secret` keys
instead of the plain username and password. However, a simpler way to do it is
by generating an [App
Password](https://support.google.com/accounts/answer/185833) for it. Simply
enable 2-Step-Verification aka two-factor authentication (2FA) on your Google
account and follow the steps given. Then pass it to the `Pass` option or encrypt
it with PGP key if you value your security and then decrypt it like the
`examplerc` shown. Refer to [Archwiki](https://wiki.archlinux.org/title/GnuPG)
on how to *create a PGP key* and *encrypt* your newly given App Password.
