genrule(
    name = "foo",
    outs = ["out"],
    executable = 1,
    cmd = """cat > $(location out) <<EOF
#!/bin/bash -e
./$(location @containerregistry//:puller) --name=gcr.io/google-containers/pause:2.0 --tarball=/tmp/foo.tar
EOF""",
    tools = ["@containerregistry//:puller"],
)