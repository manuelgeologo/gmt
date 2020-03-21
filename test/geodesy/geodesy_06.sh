#!/usr/bin/env bash
# Make sure that the -A...+n norm modifier works for velo, based on
# https://github.com/GenericMappingTools/gmt/issues/2035
cat << EOF > test.csv
300 100 -0.00228787 -6.12987e-08 0 0 0
300 600 -0.0023007 -4.15962e-06 0 0 0
300 1100 -0.00226568 -1.15024e-06 0 0 0
300 1600 -0.00203787 -5.35509e-05 0 0 0
300 2100 -0.00204038 -0.000131858 0 0 0
300 2600 -0.00214157 -2.72306e-05 0 0 0
800 100 -0.00203193 4.42606e-06 0 0 0
800 600 -0.00190225 4.36551e-05 0 0 0
800 1100 0.000459517 -0.000462841 0 0 0
800 1600 -0.000670736 -0.000364103 0 0 0
800 2100 -0.00151165 -0.000115605 0 0 0
800 2600 -0.00184433 -1.25489e-05 0 0 0
1300 100 0.0018441 1.27042e-05 0 0 0
1300 600 0.00151107 0.000115925 0 0 0
1300 1100 0.000670381 0.000364669 0 0 0
1300 1600 -0.000459696 0.000463376 0 0 0
1300 2100 0.00190218 -4.35958e-05 0 0 0
1300 2600 0.00203209 -4.40132e-06 0 0 0
1800 100 0.00214217 2.72031e-05 0 0 0
1800 600 0.00204121 0.00013186 0 0 0
1800 1100 0.00203786 5.37396e-05 0 0 0
1800 1600 0.00226553 1.46369e-06 0 0 0
1800 2100 0.00229981 4.13721e-06 0 0 0
1800 2600 0.00228223 -5.6886e-07 0 0 0
EOF
gmt begin geodesy_06 ps
  gmt velo -JX6.5i/9i -R0/2100/0/2700 -B test.csv -A+pthicker+ea -Se600c/0+f8p -Gblack -W0.1p,black
  gmt velo test.csv -A+pthicker+ea+n1c -Se600c/0+f8p -Gorange -W0.1p,orange
gmt end show
