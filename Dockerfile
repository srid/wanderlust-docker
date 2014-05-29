FROM ubuntu:14.04

RUN apt-get -y update
RUN apt-get -y install emacs24-nox wl-beta

# prelude
ENV HOME /docker
RUN apt-get -y install git
RUN git clone git://github.com/bbatsov/prelude.git $HOME/.emacs.d

# prelude initialization.
# * --kill makes emacs exit after init.el evaluation
# * --daemon allows emacs to run without tty.
# * `|| true` is to discard the benign "Error: server did not start correctly" message
RUN emacs --daemon --kill || true

# wl setup files
RUN ln -s /data/.wl ~/.wl && \
    ln -s /data/.addresses ~/.addresses && \
    ln -s /data/.elmo ~/.elmo && \
    mkdir ~/tmp

# emacs 256 colors
ENV TERM xterm-256color

CMD ["emacs", "--eval", "(wl)", "--no-splash", "--name", "Email", "-vb"]