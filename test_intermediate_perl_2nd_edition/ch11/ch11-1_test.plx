#!/usr/bin/perl -w
use strict;

require 'testChangeDayAndMonth.pm';

print testChangeDayAndMonth::number_to_day_name(1), " ", testChangeDayAndMonth::number_to_month_name(1), "\n";


require 'Oogaboogoo/Date.pm';

print Oogaboogoo::Date::day(0), " ", Oogaboogoo::Date::mon(0), "\n";

