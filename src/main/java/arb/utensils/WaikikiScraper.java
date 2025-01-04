import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicHeader;
import org.apache.http.util.EntityUtils;

import java.io.*;
import java.util.*;

public class WaikikiScraper implements AutoCloseable {
    private static final ObjectMapper MAPPER = new ObjectMapper();
    private final CloseableHttpClient httpClient;

    // Simple as fuck property class
    public static class Property {
        public String zpid;
        public String address;
        public String price;
        public String beds;
        public String baths;
        public String sqft;
        public String url;
        public Double latitude;
        public Double longitude;
        public String propertyType;
        public String daysOnMarket;
        public List<String> features = new ArrayList<>();
        public String parking;
        
        // Basic toString for debugging
        @Override
        public String toString() {
            return String.format("%s - %s, %s bed %s bath, $%s", 
                address, propertyType, beds, baths, price);
        }

        // Convert to CSV line
        public String toCsv() {
            return String.format("%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,\"%s\",%s",
                zpid, address, price, beds, baths, sqft, url,
                latitude, longitude, propertyType, daysOnMarket,
                String.join("; ", features), parking);
        }
    }

    public WaikikiScraper() {
        this.httpClient = HttpClients.custom()
            .setUserAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36")
            .build();
    }

    public List<Property> scrapeListings(String searchUrl) throws IOException {
        List<Property> properties = new ArrayList<>();
        String pageContent = fetchPage(searchUrl);
        JsonNode searchResults = extractSearchResults(pageContent);
        
        if (searchResults != null) {
            for (JsonNode listing : searchResults) {
                Property prop = new Property();
                
                // Just jam the data right in
                prop.zpid = listing.path("zpid").asText();
                prop.address = listing.path("address").asText();
                prop.price = listing.path("price").asText();
                prop.beds = listing.path("beds").asText();
                prop.baths = listing.path("baths").asText();
                prop.sqft = listing.path("area").asText();
                prop.url = "https://www.zillow.com" + listing.path("detailUrl").asText();
                
                JsonNode latLong = listing.path("latLong");
                prop.latitude = latLong.path("latitude").asDouble();
                prop.longitude = latLong.path("longitude").asDouble();
                
                // Try to grab additional details
                prop.propertyType = listing.path("propertyType").asText();
                prop.daysOnMarket = listing.path("variableData").path("text").asText();
                
                JsonNode features = listing.path("features");
                if (features.isArray()) {
                    features.forEach(f -> prop.features.add(f.asText()));
                }
                
                // Look for parking info in features
                prop.parking = prop.features.stream()
                    .filter(f -> f.toLowerCase().contains("parking"))
                    .findFirst()
                    .orElse("Not specified");
                
                properties.add(prop);
            }
        }
        
        return properties;
    }

    private String fetchPage(String url) throws IOException {
        HttpGet request = new HttpGet(url);
        try (CloseableHttpResponse response = httpClient.execute(request)) {
            if (response.getStatusLine().getStatusCode() != 200) {
                throw new IOException("Failed to fetch page: " + response.getStatusLine());
            }
            return EntityUtils.toString(response.getEntity());
        }
    }

    private JsonNode extractSearchResults(String pageContent) throws IOException {
        int startIdx = pageContent.indexOf("window[\"__PRELOADED_STATE__\"] = ") + 31;
        int endIdx = pageContent.indexOf("};</script>", startIdx) + 1;
        
        if (startIdx > 30 && endIdx > 0) {
            String json = pageContent.substring(startIdx, endIdx);
            JsonNode root = MAPPER.readTree(json);
            return root.path("searchPageState")
                      .path("searchResults")
                      .path("listResults");
        }
        return null;
    }

    public void saveToCsv(List<Property> properties, String filename) throws IOException {
        try (PrintWriter out = new PrintWriter(new FileWriter(filename))) {
            // Header
            out.println("zpid,address,price,beds,baths,sqft,url,latitude,longitude,propertyType,daysOnMarket,features,parking");
            
            // Data
            properties.forEach(p -> out.println(p.toCsv()));
        }
    }

    @Override
    public void close() throws IOException {
        httpClient.close();
    }

    // Quick test
    public static void main(String[] args) {
        String url = "https://www.zillow.com/waikiki-honolulu-hi/rentals/";
        
        try (WaikikiScraper scraper = new WaikikiScraper()) {
            List<Property> properties = scraper.scrapeListings(url);
            scraper.saveToCsv(properties, "waikiki_rentals.csv");
            
            // Print summary
            System.out.printf("Found %d properties:%n", properties.size());
            properties.forEach(System.out::println);
            
        } catch (IOException e) {
            System.err.println("Error: " + e.getMessage());
            e.printStackTrace();
        }
    }
}