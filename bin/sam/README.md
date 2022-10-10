# Samcart CLI

Tools used to manage Samcart infrastructure and things.

```sh
printf '%s\n' '#!/bin/bash' 'docker run --rm -v "$(pwd):/work" -u "$(id -u):$(id -g)" matejak/argbash "$@"' > argbash-docker
printf '%s\n' '#!/bin/bash' 'docker run --rm -e PROGRAM=argbash-init -v "$(pwd):/work" -u "$(id -u):$(id -g)" matejak/argbash "$@"' > argbash-init-docker
chmod a+x argbash-docker argbash-init-docker

./argbash-init-docker --pos positional-arg --opt optional-arg minimal.m4
vi minimal.m4

./argbash-docker minimal.m4 -o my-script.sh
./my-script.sh -h
```
