# commdock

commdock (communication dock) is a set of command-line tools for meant for communication with the outside world including one's team. As such commdock provides the following utilities:

* Email, using [wanderlust](http://www.emacswiki.org/emacs/WanderLust)
* IRC, using [rcirc](http://www.emacswiki.org/emacs/rcirc)

commdock is easily installable as a docker image, instructions for which will be made available soon; meanwhile, you may build the image from this repo and run it with the help of Makefile.

## getting started

```
# option 1: build the image
make

# configure email account
cat > data/.wl
[your imap settings here]
^D

# put any other emacs settings including rcirc config
cat > data/custom.el
^D

# run!
make run
```

### email

The `./data/` volume contains the following files representing email configuration:

```
.addresses
.folders
```

### irc

The `./data` volume contains the following files representing IRC configuration/ data:

```
irc-logs/ -- directory containing irc channel logs
```

For now, IRC has to be manually started by putting `(rcirc nil)` in `data/custom.el`.