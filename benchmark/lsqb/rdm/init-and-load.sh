#!/bin/bash

set -eu
set -o pipefail

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# do nothing (RapidMatch does not have storage, so loading happens in the same process as running the queries)
