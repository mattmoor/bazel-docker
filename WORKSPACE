workspace(name = "bazel_docker")

git_repository(
    name = "io_bazel_rules_docker",
    remote = "https://github.com/bazelbuild/rules_docker.git",
    commit = "c96ef625c645fc26ca4ff03441cc4a352c04ad5d",
)

load(
   "@io_bazel_rules_docker//docker:docker.bzl",
   "docker_pull",
   "docker_repositories"
)

# Consumers shouldn't need to do this themselves once WORKSPACE is
# instantiated recursively.
docker_repositories()

docker_pull(
   name = "base_image",
   registry = "gcr.io",
   repository = "google-appengine/base",
)
