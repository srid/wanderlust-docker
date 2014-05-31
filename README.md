# wanderlust-docker

Docker image for the [wanderlust email client](http://www.emacswiki.org/emacs/WanderLust), with configuration stored as a volume.

# why?

To keep the email client separate from the editor process. Also to run it on a different server via ssh, keeping all but configuration bundled as a docker image for easy install.

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
