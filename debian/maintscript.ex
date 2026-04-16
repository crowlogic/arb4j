# See: dh_installdeb(1), dpkg-maintscript-helper(1)
#      https://www.debian.org/doc/debian-policy/ch-maintainerscripts.html
#      https://www.debian.org/doc/debian-policy/ap-flowcharts.html
#
# Edit this file for 4 typical but non-trivial packaging cases:
# * switching a symlink to directory
# * switching a directory to symlink
# * renaming a conffile
# * removing a conffile
#
# Please note, creating an set of custom {pre,post}{inst,rm} scripts is not
# recommended.
#
# For switching a symlink to directory, you are advised to uncomment and edit
# the following
#
#dpkg-maintscript-helper symlink_to_dir pathname old-target prior-version package
#
# For switching a directory to symlink, you are advised to uncomment and edit
# the following
#
#dpkg-maintscript-helper dir_to_symlink pathname new-target prior-version package
#
# For renaming a conffile, you are advised to edit the following.
#
#dpkg-maintscript-helper mv_conffile old-conffile new-conffile prior-version package

# For removing a conffile, you are advised to create a debian/package.conffiles
# with "remove-on-upgrade conffile" line in debian/package.conffiles.
# See: dh_installdeb(1), deb-conffiles(5).
