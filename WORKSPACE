workspace(name = "bazel_docker")

new_http_archive(
    name = "httplib2",
    url = "https://codeload.github.com/httplib2/httplib2/tar.gz/v0.10.3",
    strip_prefix = "httplib2-0.10.3/python2/httplib2/",
    type = "tar.gz",
    build_file_content = """
py_library(
   name = "httplib2",
   srcs = glob(["**/*.py"]),
   data = ["cacerts.txt"],
   visibility = ["//visibility:public"]
)""",
)

new_http_archive(
    name = "oauth2client",
    url = "https://codeload.github.com/google/oauth2client/tar.gz/v4.0.0",
    strip_prefix = "oauth2client-4.0.0/oauth2client/",
    type = "tar.gz",
    build_file_content = """
py_library(
   name = "oauth2client",
   srcs = glob(["**/*.py"]),
   visibility = ["//visibility:public"],
   deps = [
     "@httplib2//:httplib2",
   ]
)"""
)

new_http_archive(
    name = "concurrent",
    url = "https://codeload.github.com/agronholm/pythonfutures/tar.gz/3.0.5",
    strip_prefix = "pythonfutures-3.0.5/concurrent/",
    type = "tar.gz",
    build_file_content = """
py_library(
   name = "concurrent",
   srcs = glob(["**/*.py"]),
   visibility = ["//visibility:public"]
)"""
)


new_git_repository(
    name = "containerregistry",
    remote = "https://github.com/google/containerregistry.git",
    commit = "8270e81f063d619168f4c95a3415cb932fb3c7e5",
    build_file_content = """
py_library(
   name = "containerregistry",
   srcs = glob(["**/*.py"]),
   deps = [
     "@httplib2//:httplib2",
     "@oauth2client//:oauth2client",
     "@concurrent//:concurrent",
   ]
)

py_binary(
   name = "puller",
   srcs = ["tools/docker_puller_.py"],
   main = "tools/docker_puller_.py",
   visibility = ["//visibility:public"],
   deps = [":containerregistry"]
)""",
)

