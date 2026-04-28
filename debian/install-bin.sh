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
      # The shaded fat jar carries every dependency, including JavaFX,
      # at canonical javafx.* paths. Drop the module-path / add-modules
      # flags that the dev launcher uses to bring JavaFX in as a JPMS
      # module -- the JDK does not ship javafx.controls and the fat jar
      # already loads everything from the classpath.
      gsub(/--module-path \$CLASSPATH/, "")
      gsub(/--add-modules arb4j/, "")
      gsub(/--add-modules javafx\.controls/, "")
      # JavaFX is now a classpath dependency, not a JPMS module, so
      # any --add-opens javafx.<module>/<pkg>=<target> flag refers to
      # a module the JVM never sees. Strip every such flag and the
      # OPENS shell variable that aggregates them.
      gsub(/--add-opens javafx\.[A-Za-z]+\/[A-Za-z0-9._]+=[A-Za-z0-9_]+/, "")
      gsub(/\$OPENS/, "")
      # JavaFX rides on the classpath, not as a JPMS module, so the
      # OpenJFX LauncherImpl "JavaFX runtime components are missing"
      # guard fires whenever the JVM main class extends Application.
      # Route every invocation through arb.applications.Launcher --
      # which does not extend Application -- so the guard never sees
      # an Application subclass on the command line. Launcher takes
      # the original FQCN as its first argument and forwards.
      gsub(/-classpath \$CLASSPATH \$@/, "-classpath $CLASSPATH arb.applications.Launcher $@")
      print
    }
  ' "$src" > "$DST/$name"
  chmod 0755 "$DST/$name"
done
