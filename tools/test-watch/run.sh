#!/bin/bash

export POSTGREST_TEST_CONNECTION
POSTGREST_TEST_CONNECTION=$(test/create_test_db "postgres://superuser:superuserpass@postgres:5434" test_db)

echo "$POSTGREST_TEST_CONNECTION"
stack build --allow-different-user --file-watch --test --test-arguments '--rerun --failure-report=TESTREPORT --rerun-all-on-success'
