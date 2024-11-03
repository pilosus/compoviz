from typing import Any

import click
import yaml

from .viz import draw

CONTEXT_SETTINGS = dict(help_option_names=["-h", "--help"])


@click.command(context_settings=CONTEXT_SETTINGS)
@click.argument("input", required=True, type=click.File("r"))
@click.argument("filename", default="compose.png")
def cli(input, filename) -> Any:
    """
    Generate an image that represents given Docker Compose configuration
    """
    stdin = click.get_text_stream("stdin")
    stream_in = input or stdin

    config = yaml.load(stream=stream_in, Loader=yaml.CLoader)

    draw(config, filename)
