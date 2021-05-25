# Sample app that demonstrates locking issues with the closure_tree gem

And they're solved by using a custom fork of it (https://github.com/factorialco/closure_tree.git)

Usage:
- `docker run -e MYSQL_ROOT_PASSWORD=hola -p3036:3036 mysql:5.7`
- `./run.sh`

The output is logged into two different files called `with_lock_name.log` and
`without_lock_name.log` for easier inspection
