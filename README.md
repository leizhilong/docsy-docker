# Docsy Docker Image

![build status](https://github.com/leizhilong/docsy-docker/workflows/docker-publish/badge.svg)

This docker image is based on [hugo-docker](https://github.com/jakejarvis/hugo-docker) but with docsy theme and its dependencies cached inside so that building a [hugo](https://gohugo.io/) site with [docsy](https://github.com/google/docsy) theme completely offline is possible. An entrypoint shell is also included to pre-run copying the theme  into working directory.

## Usage

### prerequisite

`yarn.lock` should be generated before building so that running of `yarn install` in `entrypoint.sh` won't have to resolve dependencies online.

### build site

```bash
docker run -v `pwd`:/src \
  -w /src \
  --rm \
  leizhilong/docsy-docker \
  hugo --minify
```

### hugo server

```bash
docker run -v `pwd`:/src \
  -p 1313:1313 \
  -w /src \
  --rm --init \
  leizhilong/docsy-docker \
  hugo server --buildDrafts --buildFuture --bind 0.0.0.0
```

### Tips

> What the `entrypoint.sh` do is to prepare the Docsy dependencies before hugo starts do its job, which includes: copying cached Docsy theme int `themes` folder, installing `autoprefixer` and `postcss-cli` from yarn cache. Then hugo will be started with all arguments passed.
