FROM ubuntu:14.04

RUN apt-get -y update
RUN apt-get -y install emacs24-nox wl-beta

ENV HOME /docker

ADD init.el $HOME/.emacs.d/init.el

# emacs initialization.
# * --kill makes emacs exit after init.el evaluation
# * --daemon allows emacs to run without tty.
# * `|| true` is to discard the benign "Error: server did not start correctly" message
RUN emacs --daemon --kill || true

# wl data files (from data volumes)
RUN ln -s /data/.wl ~/.wl && \
    ln -s /data/.addresses ~/.addresses && \
    ln -s /data/.folders ~/.folders && \
    ln -s /data/.elmo ~/.elmo && \
    ln -s /data/Mail ~/Mail && \
    mkdir ~/tmp

# emacs 256 colors
ENV TERM xterm-256color

CMD ["emacs", "--eval", "(wl)", "--no-splash", "--name", "Email", "-vb"]