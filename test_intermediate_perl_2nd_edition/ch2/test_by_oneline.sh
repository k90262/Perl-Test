#!/bin/bash
set -x

# 
# SYNOPSIS
# 
# chmod +x test_by_oneline.sh 
# ./test_by_oneline.sh
#
# RESULT
# 
# + perl -e 'use Cwd; my $cwd = cwd(); print "   $cwd/", $_, "\n" for glob("*");'
#    /Users/apple/Projects/perl_code/Perl-Test/test_intermediate_perl_2nd_edition/ch2/test_by_oneline.sh
# 
perl -e 'use Cwd; my $cwd = cwd(); print "   $cwd/", $_, "\n" for glob("*");'
