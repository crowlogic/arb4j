package arb;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

public final class NativeLibraryLoader {
    private static final Set<String> LOADED_LIBRARIES = ConcurrentHashMap.newKeySet();

    private NativeLibraryLoader() {
    }

    public static void load(String libraryName) {
        if (libraryName == null || libraryName.isBlank()) {
            throw new IllegalArgumentException("libraryName must not be blank");
        }
        if (LOADED_LIBRARIES.contains(libraryName)) {
            return;
        }

        UnsatisfiedLinkError firstFailure = null;
        try {
            System.loadLibrary(libraryName);
            LOADED_LIBRARIES.add(libraryName);
            return;
        } catch (UnsatisfiedLinkError failure) {
            firstFailure = failure;
        }

        Path packagedLibrary = extractPackagedLibrary(libraryName);
        if (packagedLibrary == null) {
            throw firstFailure == null ? new UnsatisfiedLinkError("Unable to load native library '" + libraryName + "'")
                    : firstFailure;
        }

        try {
            System.load(packagedLibrary.toAbsolutePath().toString());
            LOADED_LIBRARIES.add(libraryName);
            return;
        } catch (UnsatisfiedLinkError packagedFailure) {
            throw packagedFailure;
        }
    }

    private static Path extractPackagedLibrary(String libraryName) {
        String libraryBasename = libraryName.startsWith("lib") ? libraryName : "lib" + libraryName;
        String[] candidateResources = new String[] {
                "native/" + libraryBasename + ".so",
                libraryBasename + ".so"
        };

        ClassLoader classLoader = NativeLibraryLoader.class.getClassLoader();
        for (String resourceName : candidateResources) {
            URL resource = classLoader.getResource(resourceName);
            if (resource == null) {
                continue;
            }

            try {
                Path tempDirectory = Files.createTempDirectory("arb4j-native");
                Path targetPath = tempDirectory.resolve(libraryBasename + ".so");
                try (InputStream inputStream = classLoader.getResourceAsStream(resourceName)) {
                    if (inputStream == null) {
                        continue;
                    }
                    Files.copy(inputStream, targetPath, StandardCopyOption.REPLACE_EXISTING);
                }
                targetPath.toFile().deleteOnExit();
                return targetPath;
            } catch (IOException ex) {
                throw new UnsatisfiedLinkError("Unable to extract packaged native library '" + resourceName + "': " + ex.getMessage());
            }
        }

        return null;
    }
}
