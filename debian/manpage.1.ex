.\"                                      Hey, EMACS: -*- nroff -*-
.\" (C) Copyright 2026 Stephen Crowley <crow@localhost>,
.\"
.\" See man(1), man(7) and man-pages(7), https://www.tldp.org/HOWTO/Man-Page/
.\" for the documentation about man-pages and man-page-formatting:
.\"
.\" 1. Use this as the template for the manpage for <commandname> after
.\"    renaming this file to <commandname>.1 (if it is for section 1).
.\"
.\" 2. List the path to this file in debian/<packagename>.manpages to
.\"    install this manpage to the target binary package.
.\"
.\" First parameter, ARB4J, should be all caps
.\" Second parameter, SECTION, should be 1-8, maybe w/ subsection
.\" other parameters are allowed: see man(7), man(1)
.\"
.\" Easier way to make an initial manpage for commands is the use of help2man
.\" command provided by help2man package while using this file as an tutorial
.\" to understand what was created or to make touch-up edits.
.\"
.\" Other template files (manpage.*) created by debmake command are secondary
.\" helper files to create an initial manpage.
.\"
.TH ARB4J SECTION "16 Apr 2026"
.\" Please adjust this date whenever revising the manpage.
.\"
.\" Some roff macros, for reference:
.\" .nh        disable hyphenation
.\" .hy        enable hyphenation
.\" .ad l      left justify
.\" .ad b      justify to both left and right margins
.\" .nf        disable filling
.\" .fi        enable filling
.\" .br        insert line break
.\" .sp <n>    insert n+1 empty lines
.\" for manpage-specific macros, see man(7)
.SH NAME
arb4j \- program to do something
.SH SYNOPSIS
.B arb4j
.RI [ options ] " files" ...
.br
.B bar
.RI [ options ] " files" ...
.SH DESCRIPTION
This manual page documents briefly the
.B arb4j
and
.B bar
commands.
.PP
.\" TeX users may be more comfortable with the \fB<whatever>\fP and
.\" \fI<whatever>\fP escape sequences to invode bold face and italics,
.\" respectively.
\fBarb4j\fP is a program that...
.SH OPTIONS
These programs follow the usual GNU command line syntax, with long
options starting with two dashes (`-').
A summary of options is included below.
For a complete description, see the Info files.
.TP
.B \-h, \-\-help
Show summary of options.
.TP
.B \-v, \-\-version
Show version of program.
.SH SEE ALSO
.BR bar (1),
.BR baz (1).
.br
The programs are documented fully by
.IR "The Rise and Fall of a Fooish Bar" ,
available via the Info system.
