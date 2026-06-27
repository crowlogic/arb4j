#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 4 ]]; then
  echo "Usage: $0 <tws-api-source-dir> <tws-api-artifact-name> <bonanza-project-dir> <bonanza-lib-dir>" >&2
  exit 1
fi

SOURCE_DIR=$1
ARTIFACT_NAME=$2
BONANZA_PROJECT_DIR=$3
BONANZA_LIB_DIR=$4

if [[ ! -d "${SOURCE_DIR}" ]]; then
  echo "TWS API source directory not found: ${SOURCE_DIR}" >&2
  exit 1
fi

echo "Preparing TWS API sync from ${SOURCE_DIR}"

if [[ -f "${SOURCE_DIR}/pom.xml" ]]; then
  echo "Building TWS API jar with Maven"
  (cd "${SOURCE_DIR}" && mvn -q -DskipTests package)
elif [[ -f "${SOURCE_DIR}/build.xml" ]]; then
  echo "Building TWS API jar with Ant"
  (cd "${SOURCE_DIR}" && ant -f build.xml)
fi

mapfile -t JARS < <(find "${SOURCE_DIR}" -type f -name '*.jar' | sort)

if [[ ${#JARS[@]} -eq 0 ]]; then
  echo "No JAR artifacts found in ${SOURCE_DIR}" >&2
  exit 1
fi

SOURCE_JAR=""
for candidate in "${JARS[@]}"; do
  if [[ "$(basename "${candidate}")" == "${ARTIFACT_NAME}" ]]; then
    SOURCE_JAR="${candidate}"
    break
  fi
done

if [[ -z "${SOURCE_JAR}" ]]; then
  SOURCE_JAR="${JARS[0]}"
fi

if [[ -n "${BONANZA_PROJECT_DIR}" && -d "${BONANZA_PROJECT_DIR}" ]]; then
  TARGET_LIB_DIR="${BONANZA_PROJECT_DIR}/${BONANZA_LIB_DIR}"
  mkdir -p "${TARGET_LIB_DIR}"
  TARGET_JAR="${TARGET_LIB_DIR}/${ARTIFACT_NAME}"
  cp "${SOURCE_JAR}" "${TARGET_JAR}"
  echo "Copied ${SOURCE_JAR} -> ${TARGET_JAR}"

  if [[ -f "${BONANZA_PROJECT_DIR}/.classpath" ]]; then
    python3 - "${BONANZA_PROJECT_DIR}/.classpath" "${BONANZA_LIB_DIR}" "${ARTIFACT_NAME}" <<'PY'
import pathlib
import sys

classpath_path = pathlib.Path(sys.argv[1])
lib_dir = sys.argv[2]
jar_name = sys.argv[3]
entry = f'<classpathentry kind="lib" path="{lib_dir}/{jar_name}"/>'
text = classpath_path.read_text(encoding='utf-8')
if entry in text:
    raise SystemExit(0)
if '</classpath>' in text:
    text = text.replace('</classpath>', entry + '\n</classpath>', 1)
else:
    text += f'\n{entry}\n'
classpath_path.write_text(text, encoding='utf-8')
PY
  fi

  if [[ -f "${BONANZA_PROJECT_DIR}/pom.xml" ]]; then
    python3 - "${BONANZA_PROJECT_DIR}/pom.xml" "${TARGET_LIB_DIR}" "${ARTIFACT_NAME}" <<'PY'
import pathlib
import sys

pom_path = pathlib.Path(sys.argv[1])
target_lib_dir = sys.argv[2]
jar_name = sys.argv[3]
text = pom_path.read_text(encoding='utf-8')
if '<artifactId>tws-api</artifactId>' in text:
    raise SystemExit(0)
dependency_block = f'''
    <dependency>
      <groupId>com.ib</groupId>
      <artifactId>tws-api</artifactId>
      <version>system</version>
      <scope>system</scope>
      <systemPath>{target_lib_dir}/{jar_name}</systemPath>
    </dependency>
'''
if '</dependencies>' in text:
    text = text.replace('</dependencies>', dependency_block + '</dependencies>', 1)
else:
    text += '\n<dependencies>' + dependency_block + '</dependencies>\n'
pom_path.write_text(text, encoding='utf-8')
PY
  fi
else
  echo "Bonanza project directory not found; only the source jar was located at ${SOURCE_JAR}" >&2
fi
