package arb;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.concurrent.atomic.AtomicBoolean;

public final class NativeLibraryLoader {
    private static final String LIBRARY_NAME = "arblib";
    private static final String RESOURCE_NAME = System.mapLibraryName(LIBRARY_NAME);
    private static final AtomicBoolean LOADED = new AtomicBoolean(false);

    private NativeLibraryLoader() {
    }

    public static void load(String libraryName) {
        if (!LIBRARY_NAME.equals(libraryName)) {
            System.loadLibrary(libraryName);
            return;
        }
        if (LOADED.get()) {
            return;
        }
        synchronized (NativeLibraryLoader.class) {
            if (LOADED.get()) {
                return;
            }
            try {
                loadFromClasspathResource();
                LOADED.set(true);
            } catch (UnsatisfiedLinkError | IOException e) {
                System.loadLibrary(libraryName);
                LOADED.set(true);
            }
        }
    }

    private static void loadFromClasspathResource() throws IOException {
        ClassLoader loader = NativeLibraryLoader.class.getClassLoader();
        URL resource = loader.getResource(RESOURCE_NAME);
        if (resource == null) {
            throw new IOException("Missing native resource " + RESOURCE_NAME);
        }

        Path tempFile = Files.createTempFile("arb4j-", "-" + RESOURCE_NAME);
        tempFile.toFile().deleteOnExit();

        try (InputStream input = resource.openStream(); OutputStream output = Files.newOutputStream(tempFile)) {
            input.transferTo(output);
        }

        System.load(tempFile.toAbsolutePath().toString());
    }
}
