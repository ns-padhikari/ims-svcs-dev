This repo stores poc code for creating IMS services outside of service repo

To build follow below steps:

```
git clone git@github.com:ns-padhikari/ims-svcs-dev.git

cd ims-svcs-dev

bazel build //apps/flask-app:pywheel

Starting local Bazel server and connecting to it...
WARNING: --enable_bzlmod is set, but no MODULE.bazel file was found at the workspace root. Bazel will create an empty MODULE.bazel file. Please consider migrating your external dependencies from WORKSPACE to MODULE.bazel. For more details, please refer to https://github.com/bazelbuild/bazel/issues/18958.
INFO: Analyzed target //apps/flask-app:pywheel (77 packages loaded, 716 targets configured).
INFO: Found 1 target...
Target //apps/flask-app:pywheel up-to-date:
  bazel-bin/apps/flask-app/poc-0.0.1-py3-none-any.whl
INFO: Elapsed time: 27.426s, Critical Path: 3.24s
INFO: 10 processes: 9 internal, 1 darwin-sandbox.
INFO: Build completed successfully, 10 total actions
padhikari@C02DT1QMMD6N ims-svcs-dev %
```

Output package will be at `bazel-bin/apps/flask-app/poc-0.0.1-py3-none-any.whl`



To create docker image run below commands:

```
cp bazel-bin/apps/flask-app/poc-0.0.1-py3-none-any.whl .

docker build -f Dockerfile -t ims-svcs-dev:latest .

docker images
REPOSITORY                                                             TAG                                  IMAGE ID       CREATED        SIZE
ims-svcs-dev                                                           latest                               78b346cf173d   2 hours ago    1.49GB

docker run --name ims-svcs-dev -d ims-svcs-dev:latest
```
