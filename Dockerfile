FROM jakejarvis/hugo-extended

LABEL maintainer="Lei Zhilong <leizhilong@me.com>"

ADD entrypoint.sh /

RUN git clone --recurse-submodules https://github.com/google/docsy /themes/docsy && \
    mkdir -p /npm-packages-offline-cache && \
    yarn config set yarn-offline-mirror "/npm-packages-offline-cache" -g && \
    yarn config set yarn-offline-mirror-pruning true -g && \
    yarn add postcss-cli autoprefixer && \
    yarn install && \
    ls -l /npm-packages-offline-cache && \
    yarn config list


WORKDIR /src

ENTRYPOINT [ "/entrypoint.sh" ]






