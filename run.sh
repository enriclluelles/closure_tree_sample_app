#!/bin/bash
USE_LOCK_NAME=1 bin/rails lock 2>&1 | tee with_lock_name.log
bin/rails lock 2>&1 | tee without_lock_name.log
