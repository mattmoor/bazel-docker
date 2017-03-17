genrule(
    name = "image",
    outs = ["image.tar"],
    cmd = """$(location @containerregistry//:puller) \
               --name=%{registry}/%{repository}:%{tag} \
               --tarball=$(location image.tar)""",
    tools = ["@containerregistry//:puller"],
    visibility = ["//visibility:public"],
)
