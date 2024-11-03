# compoviz - visualization for Docker Compose configuration

`compoviz` generates an image representing Docker Compose configuration in YAML format 
that follows the [Compose Specification](https://docs.docker.com/reference/compose-file/).

## Installation

```shell
$ git clone https://github.com/pilosus/compoviz.git
$ cd compoviz
$ make install-package
```

## Usage

```shell
$ docker compose --project-directory /path/to/your/project config | compoviz - project.png
```


## Help

```shell
$ compoviz --help
```
