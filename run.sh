#!/bin/bash
USE_LOCK_NAME=1 bin/rails lock &> with_lock_name.log
bin/rails lock &> without_lock_name.log
