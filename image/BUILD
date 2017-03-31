
load(
   "@io_bazel_rules_docker//docker:docker.bzl",
   "docker_build",
   "docker_push"
)

docker_build(
   name = "hello",
   base = "@base_image//image:image.tar",
   cmd = "echo Hello",
)

docker_push(
   name = "push_hello",
   image = ":hello",
   registry = "gcr.io",
   repository = "convoy-adapter/hello-bazelbuild",
)