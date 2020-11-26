#!/usr/bin/perl

use strict;
use DBI;

my $srcdir = shift;

my $fh_html;
my $html_filename;
my @html_files = ();
my $html;
my %xrefs;
my $prev = ""; my $curr = ""; my $next = "";

my $select = "select A.title section_title,A.slug,A.html,A.number,C.chapter_number,C.chapter_type,C.title chapter_title ";
$select = $select."from sections A ";
$select = $select."inner join xrefs B on A.id=B.section_id ";
$select = $select."inner join chapters C on A.chapter_id=C.id ";
$select = $select."inner join books D on C.book_id=D.id ";
$select = $select."where D.code='ja' ";
$select = $select."group by A.title,A.slug,A.number,C.chapter_number,C.chapter_type,C.title ";
$select = $select."order by C.chapter_type desc,cast(C.chapter_number as int),A.number ";

my $dbh = DBI->connect("dbi:SQLite:dbname=development.sqlite3");
my $sth = $dbh->prepare($select);
$sth->execute;

open(IN1,"<".$srcdir."/templates/_before1.html");
my @before1_lines = <IN1>; close(IN1);
open(IN2,"<".$srcdir."/templates/_before2.html");
my @before2_lines = <IN2>; close(IN2);
open(IN3,"<".$srcdir."/templates/_after.html");
my @after_lines = <IN3>; close(IN3);
my $joined1 = join('', @before1_lines);
my $joined2 = join('', @before2_lines);
my $joined3 = join('', @after_lines);

&getXrefs;

while (my @row = $sth->fetchrow_array) {

  my $chapter  = @row[4];
  my $section  = @row[3];
  my $stitle   = @row[0];
  my $ctitle   = @row[6];
  my $slugorig = @row[1];
  my $slug     = $slugorig;
  my $myslug;
  $slug =~ s/\:/\%3A/; $slug =~ s/\//\%2F/g;
  $stitle =~ s/\//-/g;
  $html = @row[2];
  $html =~ s#/book/en/v2/images#assets/images#g;
  $html =~ s#/book/en/v2/##g;
  $html =~ s/>prev<\/a>/>前へ<\/a>/;
  $html =~ s/>next<\/a>/>次へ<\/a>/;
  if (@row[5] eq "appendix") {
    $chapter = chr(64+$chapter);
    $myslug   = $stitle;
  } else {
    $myslug   = $ctitle."-".$stitle;
  }

  &replaceXrefs;

  my $joined1mod = $joined1;
  $joined1mod =~ s/__TITLE__/$stitle/g;

  my $joined2mod = $joined2;
  $joined2mod =~ s/__CHAP__/$chapter/g;
  $joined2mod =~ s/__SECT__/$section/g;
  $joined2mod =~ s/__SLUG__/$myslug/g;

  $html_filename = $chapter.".".$section.".".$slug.".html";
  push @html_files, $html_filename;

  open (my $fh_html, ">".$srcdir."/docs/".$html_filename) or die "Error: file not found: ".$srcdir."/docs/".$html_filename;
  print $fh_html $joined1mod.$joined2mod.$html.$joined3;
  close($fh_html);
}

$sth->finish;
undef $sth;
$dbh->disconnect;

  open(OUT2,">"."htmls.txt");
  foreach my $each (@html_files) {
    print OUT2 $each,"\n";
  }
  close(OUT2);

&setPrevNext;

sub setPrevNext {
  foreach my $html_file (@html_files) {
    $prev = $curr; $curr = $next; $next = $html_file;

    if ($prev eq "") {
      if ($curr eq "") {
        next;
      }
      $prev = "/";
    }
    &proc_html;
  }

  $prev = $curr; $curr = $next; $next = "/";
  &proc_html;
}

sub proc_html {
  my $cmd = "sed -i";
  $cmd = $cmd." -e \"s#\\[\\[nav\-prev\\]\\]#".$prev."#g\"";
  $cmd = $cmd." -e \"s#\\[\\[nav\-next\\]\\]#".$next."#g\"";
  $cmd = $cmd." ".$srcdir."/docs/".$curr;
  system($cmd);
}

sub replaceXrefs {
  while ($html =~ /<a href=\"ch00\/([^\"]+)\">/) {
    my $id = $1;
    my $f = $xrefs{$id};
    if (exists($xrefs{$id})) {
      $html =~ s/<a href=\"ch00\/${id}\">/<a href=\"${f}\#${id}\">/;
    } else {
      $html =~ s/<a href=\"ch00\/${id}\">/<a href=\"${id}\">/;
    }
  }
}

sub getXrefs {
  my $select2 = "select B.name name,A.title section_title,A.slug slug,A.number snumber,";
  $select2 = $select2."C.chapter_number cnumber,C.chapter_type chapter_type,C.title chapter_title ";
  $select2 = $select2."from sections A ";
  $select2 = $select2."inner join xrefs B on A.id=B.section_id ";
  $select2 = $select2."inner join chapters C on A.chapter_id=C.id ";
  $select2 = $select2."inner join books D on C.book_id=D.id ";
  $select2 = $select2."where D.code='ja' ";
  $select2 = $select2."order by C.chapter_type desc,C.chapter_number,A.number ";

  my $sth2 = $dbh->prepare($select2);
  $sth2->execute;
  while (my @row2 = $sth2->fetchrow_array) {
    my $chapter  = @row2[4];
    my $section  = @row2[3];
    my $stitle   = @row2[1];
    my $ctitle   = @row2[6];
    my $slugorig = @row2[2];
    my $slug     = $slugorig;
    my $myslug;
    $slug =~ s/\:/\%3A/; $slug =~ s/\//\%2F/g;
    $ctitle =~ s/ /-/g; 
    $stitle =~ s/\//／/g; $stitle =~ s/ /-/g;
    if (@row2[5] eq "appendix") {
      $chapter = chr(64+$chapter);
      $myslug   = $stitle;
    } else {
      $myslug   = $ctitle."-".$stitle;
    }
    $myslug =~ s/ /-/g;
    my $filename = $chapter.".".$section.".".$slug.".html";
    my $key = @row2[0];
    $key =~ s/ /-/g;
    $xrefs{$key} = $filename;
  }
  $sth2->finish;
  undef $sth2;

  open(OUT1,">"."xrefs.txt");
  for my $k (sort keys %xrefs) {
    print OUT1 $k,"|".$xrefs{$k}."\n";
  }
  close(OUT1);
}
