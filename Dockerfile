FROM jakejarvis/hugo-extended

LABEL maintainer="Lei Zhilong <leizhilong@me.com>"

ADD entrypoint.sh /

RUN git clone --recurse-submodules https://github.com/google/docsy /themes/docsy && \
  yarn add postcss-cli autoprefixer @babel/core @babel/cli && \
  yarn install


WORKDIR /src

ENTRYPOINT [ "/entrypoint.sh" ]






