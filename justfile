project := 'primitivo'

image-name := project +'-toolchain:latest'

_default:
    @just --list

# build tolchain image
build-image:
    docker build .devcontainer -f .devcontainer/Dockerfile -t {{image-name}}

# run command ARGS inside toolchain shell
shell *ARGS:
    docker run --rm -it -v `pwd`:/proj -w /proj {{image-name}} {{ARGS}}

# configure project. ARGS are passed to cmake, i.e. --fresh
configure *ARGS: ( shell 'cmake --preset=default' ARGS )

# build project. ARGS are passed to cmake, i.e. --target XXX
build *ARGS: ( shell 'cmake --build --preset=default' ARGS )

# rebuild docker, clean cache and then build project
full-rebuild: build-image (configure '--fresh') build