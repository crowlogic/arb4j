# Uncomment to active options. See dpkg-source(1)
#
# This file contains a list of long options that should be automatically
# prepended to the set of command line options of a dpkg-source --build call.

# Remove this file if you use classic quilt/dquilt/git-buildpackage
# workflow and the git repository records the unmodified source for outside of
# debian/ directory.

# When the git repository records the **modified** upstream source for outside of
# debian/ directory and use dgit-maint-merge(7) workflow, uncomment the following:
#single-debian-patch
#auto-commit
