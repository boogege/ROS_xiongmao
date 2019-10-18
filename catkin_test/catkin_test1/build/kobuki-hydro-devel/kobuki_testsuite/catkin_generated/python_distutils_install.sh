#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/tmb/catkin_test/catkin_test1/src/kobuki-hydro-devel/kobuki_testsuite"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/tmb/catkin_test/catkin_test1/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/tmb/catkin_test/catkin_test1/install/lib/python2.7/dist-packages:/home/tmb/catkin_test/catkin_test1/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/tmb/catkin_test/catkin_test1/build" \
    "/usr/bin/python" \
    "/home/tmb/catkin_test/catkin_test1/src/kobuki-hydro-devel/kobuki_testsuite/setup.py" \
    build --build-base "/home/tmb/catkin_test/catkin_test1/build/kobuki-hydro-devel/kobuki_testsuite" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/tmb/catkin_test/catkin_test1/install" --install-scripts="/home/tmb/catkin_test/catkin_test1/install/bin"
