#!/usr/bin/env bash

# NAME
#     script.sh - Run ORCA tests.
#
# SYNOPSIS
#     script.sh
#
# DESCRIPTION
#     Runs automated tests.

cd "$(dirname "$0")"

# Reuse ORCA's own includes.
source ../../../orca/bin/travis/_includes.sh

# Limit execution to standard ORCA jobs that run automated tests.
TARGET=("ISOLATED_RECOMMENDED" "INTEGRATED_RECOMMENDED" "CORE_PREVIOUS" "ISOLATED_DEV" "INTEGRATED_DEV" "CORE_NEXT")
[[ " ${TARGET[@]} " =~ " ${ORCA_JOB} " ]] || exit 0

orca qa:automated-tests --sut=drupal/acquia_commercemanager --sut-only
