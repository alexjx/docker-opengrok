# Opengrok Docker Image

## How to use

docker run -d -name opengrok -v SOURCEDIR:/source DATADIR:/data -p 8080:8080 alexjx/opengrok

## Note

* This is built upon alpine Linux
* Opengrok depends on universal-ctags, which is not in the alpine package lists yet.
  One binary is built for this
* It directly included the opengrok release in the build tree.. (FIXME)