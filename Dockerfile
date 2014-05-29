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

# Color theme suited for email 
# RUN emacs --daemon --eval "(package-install 'solarized-theme)" --kill || true

# wl configuration
ADD custom.el $HOME/.emacs.d/personal/custom.el

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