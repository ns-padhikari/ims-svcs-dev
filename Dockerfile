FROM artifactory-rd.netskope.io/ims-develop-incimgmtsvc-docker/ims-base:2.0.0-1.develop-nightly-2024-03-20

COPY poc-0.0.1-py3-none-any.whl /tmp/
RUN pip install --find-links file:///tmp \
    --index-url https://artifactory-rd.netskope.io/artifactory/api/pypi/py38-local-no-deps/simple  \
    --extra-index-url https://artifactory-rd.netskope.io/artifactory/api/pypi/netskope/simple \
    --extra-index-url https://artifactory-rd.netskope.io/artifactory/api/pypi/org-library-pypi/simple \
    --extra-index-url https://artifactory-rd.netskope.io/artifactory/api/pypi/org-external-pypi/simple \
    /tmp/poc-0.0.1-py3-none-any.whl

CMD python3.8 /usr/local/lib/python3.8/dist-packages/apps/flask-app/main.py
