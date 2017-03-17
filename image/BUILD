
load("@bazel_tools//tools/build_defs/docker:docker.bzl", "docker_build")

docker_build(
   name = "hello",
   base = "@base_image//:image",
   cmd = "echo Hello",
)
