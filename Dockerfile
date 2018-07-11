FROM apluslms/grading-base:2.3

COPY sbin /usr/local/sbin

RUN apt_install \
    python3 \
    python3-pip \
    python3-setuptools \
 && ln -s /usr/bin/python3 /usr/local/bin/python \
 && ln -s /usr/bin/pip3 /usr/local/bin/pip \
\
 && pip_install \
    https://github.com/Aalto-LeTech/python-grader-utils/archive/master.tar.gz \
 && find /usr/local/lib/python* -type d -regex '.*/locale/[a-z_A-Z]+' -not -regex '.*/\(en\|fi\|sv\)' -print0 | xargs -0 rm -rf \
 && find /usr/local/lib/python* -type d -name 'tests' -print0 | xargs -0 rm -rf

COPY bin /usr/local/bin
