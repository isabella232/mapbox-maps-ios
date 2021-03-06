# 
# Prerequisite:
# Prior to running this script, you must have generated an xcresults bundle that
# contains a code coverage report. This can be done by:
# 1. Running tests locally in Xcode with `gather reports` enabled for that scheme.
# 2. Running the tests locally via the relevant make command.
#
# Purpose:
# This script is intended to:
# - Convert a code coverage report generated by Xcode to JSON.
# - Parse that report for the code coverage total.
# 

set -e
set -o pipefail

cov_result="";
if [ -f ../../build/ios/Logs/Test/*.xcresult/ ]; then 
    cov_result=build/ios/Logs/Test/*.xcresult
elif [ -f ../../build/ios/ios/Logs/Test/*.xcresult/ ]; then
    cov_result=build/ios/ios/Logs/Test/*.xcresult
else
    echo "Coverage file does not exist. Please run tests before executing"
    exit 1
fi

xcrun xccov view --report $cov_result --json > output.json

#
# Convert the line coverage for the dynamic target to a percentage. Currently, 
# only CI tests are included when calculated code coverage.
# 
percentage=`node -e "console.log(require('./output.json').lineCoverage)"`
cov=$(printf "%.2f" $(echo "$percentage*100" | bc -l))

# Generate a formatted JSON file and upload it to S3.
echo $cov