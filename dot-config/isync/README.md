# Additional points when configuring Isync

## Authentication

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

## Flatten Hierarchy

You might encounter the nested file hierarchy as shown below (when using Gmail
for example):

```
mail/
  Inbox/
  [Gmail]/
    INBOX/
    Sent Mail/
    ...
```

Though functionality wise, it is not a big deal. However, it doesn't look good
to my eyes since in my opinion, the folders should be grouped by its role not by
provider. In this case, you need to flatten the hierarchy.

One solution to this is to use the option `Flatten`. Thereby, it will show it as
`[Gmail]-INBOX` if you define the delimiter as `-` in `Flatten`. However, it
still doesn't group things together by their role. The hierarchy is flattened
but it is still categorised by its provider. Following the example provided by
the [Archwiki](https://wiki.archlinux.org/title/Isync#Configuring), you can see
that the author create separate channels for each of the mailboxes that need to
be sync.

Here's my example configuration for your reference using this method:

```
Channel example-inbox
Far :example-remote:
Near :example-local:
# Including all folders except for those with the prefix [Gmail]
Patterns * ![Gmail]*
Create Both
Expunge Both
SyncState *

Channel example-sent
# Specify which remote mailbox to sync
# You can replace the prefix [Gmail] accordingly
Far :example-remote:"[Gmail]/Sent Mail"
# Isync will sync the mails from Far into the local directory Sent
Near :example-local:Sent
Create Near

Channel example-important
Far :example-remote:"[Gmail]/Starred"
Near :example-local:Important
Create Near

# Running `mbsync example` will sync all the channels
Group example
Channel example-inbox
Channel example-sent
Channel example-important
```

The resulting hierarchy will be as below:

```
mail/
  Inbox/      # from example-inbox
  Sent/       # from example-sent
  Important/  # from example-important
  ...
```
