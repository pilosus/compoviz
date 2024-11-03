# compoviz

`compoviz` generates an image representing Docker Compose configuration.

Docker Compose configuration is expected to be in YAML format
and to follow [Compose Specification](https://docs.docker.com/reference/compose-file/).

## Installation

```shell
$ pip install git+https://github.com/pilosus/compoviz.git
```

## Usage

```shell
$ docker compose --project-directory /path/to/your/project config | compoviz - project.png
```


## Help

```shell
$ compoviz --help
```
