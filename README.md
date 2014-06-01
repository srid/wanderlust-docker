# wanderlust-docker

Docker image for the [wanderlust email client](http://www.emacswiki.org/emacs/WanderLust), with configuration stored as a volume.

## features

* HTML email
* Bonus feature: IRC
  * Alt+i shortcut to switch buffer

## getting started

```
# option 1: build the image
make
# option 2: pull the image
# https://index.docker.io/u/srid/wanderlust/
docker pull srid/wanderlust

# configure email account
cat > data/.wl
[your imap settings here]
^D

# run!
make run
```
