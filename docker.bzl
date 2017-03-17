"""An implementation of docker_pull based on google/containerregistry.

This wraps the containerregistry.tools.docker_puller executable in a
Bazel rule for downloading base images without a Docker client to
construct new images with docker_build.
"""


def _impl(repository_ctx):
  """Core implementation of docker_pull."""
  repository_ctx.template("BUILD", repository_ctx.path(repository_ctx.attr._tpl),
    substitutions={
      "%{registry}": repository_ctx.attr.registry,
      "%{repository}": repository_ctx.attr.repository,
      "%{tag}": repository_ctx.attr.tag
    }, executable=False)


_docker_pull = repository_rule(
    implementation = _impl,
    attrs = {
        "registry": attr.string(mandatory=True),
        "repository": attr.string(mandatory=True),
        "tag": attr.string(default="latest"),
        "_tpl": attr.label(
            default=Label("//:docker_pull.BUILD.tpl"),
            cfg="host",
            allow_files=True),
    },
)


def docker_pull(**kwargs):
  """Pulls a docker image.

  This rule pulls a docker image into the 'docker save' format.  The
  output of this rule can be used interchangeably with `docker_build`.

  Args:
    name: name of the rule
    registry: the registry from which we are pulling.
    repository: the name of the image.
    tag: (optional) the tag of the image, default to 'latest' if this
         and 'digest' remain unspecified.
    digest: (optional) the digest of the image to pull.
  """
  _docker_pull(**kwargs)