<?xml version="1.0" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rev="made" href="mailto:root@m67js.p1s.plx.sd.apple.com" />
</head>

<body>



<ul id="index">
  <li>
    <ul>
      <li><a href="#test-case">test case:</a></li>
      <li><a href="#result">result</a></li>
    </ul>
  </li>
</ul>

<h2 id="test-case">test case:</h2>

<p>perl ch5_regex_position.pl ch5_regex_m.pl</p>

<h2 id="result">result</h2>

<pre><code> &lt;p&gt;#!/usr/bin/perl -w
 use strict;
 
 &lt;\p&gt;
 &lt;p&gt;# case array context
 my $paragrapth = &quot;Perl is a program that use perl language to write perl document.&quot;;
 my @perls;
 if (@perls = $paragrapth =~ /perl/gi)
 {
   printf &quot;Perl methioned  %d times.\n&quot;, scalar @perls;
 }
 
 &lt;\p&gt;
 &lt;p&gt;# case covert to hash by quote of regex
 my $string = &quot;password=xyxxz verbose=9 score=0&quot;;
 my %hash;
 %hash = $string =~ /(\w+)=(\w+)/g;
 foreach my $key (keys %hash)
 {
   print &quot;hash.$key=&quot;.$hash{$key}.&quot;\n&quot;;
 }
 
 &lt;\p&gt;
 &lt;p&gt;# case m??
 my @words = qw(neurad neureee neurpnology);
 my ($first, $last);
 while (@words)
 {
   $_ = shift @words;
   $first = $1 if m?^(neur\w*)?;
   $last  = $1 if m/^(neur\w*)/;
 }
 print &quot;first: $first\n&quot;;
 print &quot;last : $last\n&quot;;
 
 &lt;\p&gt;
 1:     &lt;p&gt;#!/usr/bin/perl -w
 2:     use strict;
 3:     
 4:     &lt;\p&gt;
 5:     &lt;p&gt;# case array context
 6:     my $paragrapth = &quot;Perl is a program that use perl language to write perl document.&quot;;
 7:     my @perls;
 8:     if (@perls = $paragrapth =~ /perl/gi)
 9:     {
 10:      printf &quot;Perl methioned  %d times.\n&quot;, scalar @perls;
 11:    }
 12:    
 13:    &lt;\p&gt;
 14:    &lt;p&gt;# case covert to hash by quote of regex
 15:    my $string = &quot;password=xyxxz verbose=9 score=0&quot;;
 16:    my %hash;
 17:    %hash = $string =~ /(\w+)=(\w+)/g;
 18:    foreach my $key (keys %hash)
 19:    {
 20:      print &quot;hash.$key=&quot;.$hash{$key}.&quot;\n&quot;;
 21:    }
 22:    
 23:    &lt;\p&gt;
 24:    &lt;p&gt;# case m??
 25:    my @words = qw(neurad neureee neurpnology);
 26:    my ($first, $last);
 27:    while (@words)
 28:    {
 29:      $_ = shift @words;
 30:      $first = $1 if m?^(neur\w*)?;
 31:      $last  = $1 if m/^(neur\w*)/;
 32:    }
 33:    print &quot;first: $first\n&quot;;
 34:    print &quot;last : $last\n&quot;;
 35:    
 36:    &lt;\p&gt;</code></pre>


</body>

</html>


