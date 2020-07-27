FROM jakejarvis/hugo-extended

MAINTAINER Lei Zhilong <leizhilong@me.com>

ADD entrypoint.sh /

RUN git clone --recurse-submodules https://github.com/google/docsy /themes/docsy


ENTRYPOINT [ "executable" ]






