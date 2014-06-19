#!/bin/sh

case "$TEST_MODE"
in
    run_program)
        (while read line; do echo "$line"; sh -c "$line" || exit $?; done)<<'EOF'
        pip install 'git+https://github.com/remram44/rpaths.git#egg=rpaths'
        cd reprozip && python setup.py install
        cd reprounzip && python setup.py install
        cd reprounzip-vagrant && python setup.py install
EOF
        ;;
    check_style)
        pip install flake8
        ;;
esac
