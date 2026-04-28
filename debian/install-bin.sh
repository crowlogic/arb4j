#!/bin/sh
# Stage every script under bin/ into the deb's /usr/bin tree with its
# BASEDIR/FMDIR/CLASSPATH/LD_LIBRARY_PATH lines rewritten to use the
# installed FHS layout described in /usr/share/arb4j/env.sh.
#
# Invoked from debian/rules with:
#   $1 = source bin/ directory   (e.g. ./bin)
#   $2 = destination bin/ dir    (e.g. debian/arb4j/usr/bin)
set -eu
SRC=$1
DST=$2
mkdir -p "$DST"

for src in "$SRC"/*; do
  name=$(basename "$src")
  case "$name" in
    updateClasspath)
      # Dev-only — rebuilds class.path from a Maven checkout. Skip.
      continue
      ;;
    arb4jVersion)
      # Reads pom.xml in a checkout. Replace with a one-liner that
      # cats the version file shipped under /usr/share/arb4j.
      cat > "$DST/$name" <<'EOF'
#!/bin/sh
. /usr/share/arb4j/env.sh
cat "$ARB4J_HOME/version"
EOF
      chmod 0755 "$DST/$name"
      continue
      ;;
  esac

  # Two-line preamble that source env.sh and bind the BASEDIR /
  # FMDIR / LD_LIBRARY_PATH names the original scripts read. We
  # rewrite by:
  #   - replacing any 'BASEDIR=$(dirname ...)..' line with
  #     a sourced env.sh + BASEDIR=$ARB4J_HOME assignment
  #   - replacing any 'FMDIR=$(dirname ...)..' line similarly
  #   - replacing any literal 'cat $BASEDIR/class.path' (or
  #     $FMDIR/class.path) with $ARB4J_CLASSPATH so the wrapper
  #     uses the FHS class.path file rather than the dev one
  awk '
    BEGIN { injected = 0 }
    /^BASEDIR=\$\(dirname/ {
      if (!injected) {
        print ". /usr/share/arb4j/env.sh"
        injected = 1
      }
      print "BASEDIR=$ARB4J_HOME"
      print "LD_LIBRARY_PATH=$ARB4J_NATIVE_DIR"
      print "export LD_LIBRARY_PATH"
      next
    }
    /^FMDIR=\$\(dirname/ {
      if (!injected) {
        print ". /usr/share/arb4j/env.sh"
        injected = 1
      }
      print "FMDIR=$ARB4J_HOME"
      next
    }
    # Drop dev-only bytecode-cache directory creation lines.
    /^BUILDIR=\$BASEDIR\/build\/classes/      { next }
    /^[[:space:]]*mkdir -p \$BUILDIR[[:space:]]*$/ { next }
    {
      # Replace the dev cat-of-class.path with the env var
      gsub(/`cat \$BASEDIR\/class\.path`/, "$ARB4J_CLASSPATH")
      gsub(/`cat \$FMDIR\/class\.path`/,   "$ARB4J_CLASSPATH")
      # In a checkout, libarblib.so sits next to bin/. In the FHS
      # install it sits under /usr/lib/jni. Redirect both the JVM
      # native-library-path flag and the LD_LIBRARY_PATH override
      # to that directory.
      gsub(/-Djava\.library\.path=\$BASEDIR/, "-Djava.library.path=$ARB4J_NATIVE_DIR")
      gsub(/LD_LIBRARY_PATH=\$BASEDIR /, "LD_LIBRARY_PATH=$ARB4J_NATIVE_DIR ")
      # Sibling wrapper invocations under bin/ become PATH lookups.
      gsub(/\$BASEDIR\/bin\//, "")
      gsub(/\$FMDIR\/bin\//, "")
      # Drop dev-only build-classes segments from any classpath, in
      # both colon-separated and standalone forms.
      gsub(/:\$BASEDIR\/build\/classes\/?/, "")
      gsub(/:\$BUILDIR/, "")
      gsub(/\$BASEDIR\/build\/classes\/?:/, "")
      gsub(/\$BUILDIR:/, "")
      print
    }
  ' "$src" > "$DST/$name"
  chmod 0755 "$DST/$name"
done
