#!/bin/bash

set -eo pipefail

test_counter=0
test_fail=0

test_function(){
   test_counter=`expr $test_counter + 1`
   if echo $1 | grep -q $2 ; then
       echo -e "\033[01;32mPass"
   else
       test_fail=`expr $test_fail + 1`
       echo -e "\033[01;31mFail"
   fi
}

test_function "aaa" "a"
test_function "aaa" "a"
test_function "aaa" "a"

echo -ne "\033[01;0m"
echo -e "Number of tests:$test_counter"
echo -e "Number of failed tests:$test_fail"

docker run --rm hello-world

test $test_fail -eq 0
