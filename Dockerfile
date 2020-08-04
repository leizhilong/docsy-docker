FROM jakejarvis/hugo-extended

LABEL maintainer="Lei Zhilong <leizhilong@me.com>"

ADD entrypoint.sh /

RUN git clone --recurse-submodules https://github.com/google/docsy /themes/docsy && \
    yarn config yarn-offline-mirror "/npm-packages-offline-cache" -g && \
    yarn config yarn-offline-mirror-pruning true -g && \
    yarn add postcss-cli autoprefixer && \
    yarn install && \
    ls -l /npm-packages-offline-cache


WORKDIR /src

ENTRYPOINT [ "/entrypoint.sh" ]






