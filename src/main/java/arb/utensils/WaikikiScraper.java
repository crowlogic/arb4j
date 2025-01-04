import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.*;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.*;

public class WaikikiScraper implements AutoCloseable {
    public enum PetPolicy {
        CATS_ALLOWED("cats"),
        DOGS_ALLOWED("dogs"),
        LARGE_DOGS_ALLOWED("largeDogs"),
        NO_PETS("noPets");

        public final String value;
        PetPolicy(String value) { this.value = value; }
    }

    public enum Amenities {
        AIR_CONDITIONING("ac"),
        WASHER_DRYER_IN_UNIT("washerDryerUnit"),
        DISHWASHER("dishwasher"),
        WHEELCHAIR_ACCESS("wheelchair"),
        FURNISHED("furnished"),
        HARDWOOD_FLOORS("hardwood"),
        PARKING_GARAGE("garage"),
        PARKING_COVERED("coveredParking"),
        ELEVATOR("elevator"),
        POOL("pool"),
        GYM("gym"),
        DOORMAN("doorman"),
        BALCONY("balcony"),
        PRIVATE_OUTDOOR("privateOutdoor"),
        SHARED_OUTDOOR("sharedOutdoor"),
        UTILITIES_INCLUDED("utilities"),
        HEAT_INCLUDED("heat");

        public final String value;
        Amenities(String value) { this.value = value; }
    }

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
        public Set<PetPolicy> petPolicies = new HashSet<>();
        public Set<Amenities> amenities = new HashSet<>();

        public boolean hasAmenity(Amenities amenity) {
            return amenities.contains(amenity) || 
                   features.stream().anyMatch(f -> f.toLowerCase().contains(amenity.value));
        }

        public boolean allowsPet(PetPolicy policy) {
            return petPolicies.contains(policy) ||
                   features.stream().anyMatch(f -> f.toLowerCase().contains(policy.value));
        }

        public String toCsv() {
            return String.format("%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,\"%s\",%s,\"%s\",\"%s\"",
                zpid, address, price, beds, baths, sqft, url,
                latitude, longitude, propertyType, daysOnMarket,
                String.join("; ", features), parking,
                petPolicies.stream().map(p -> p.value).toList(),
                amenities.stream().map(a -> a.value).toList());
        }
    }

    private final ObjectMapper MAPPER = new ObjectMapper();
    private final CloseableHttpClient httpClient;

    public WaikikiScraper() {
        this.httpClient = HttpClients.custom()
            .setUserAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36")
            .build();
    }

    public List<Property> scrapeListings(String baseUrl, Set<PetPolicy> petPolicies, Set<Amenities> requiredAmenities) throws IOException {
        StringBuilder url = new StringBuilder(baseUrl);
        if (!petPolicies.isEmpty() || !requiredAmenities.isEmpty()) {
            url.append(url.toString().contains("?") ? "&" : "?");
            
            List<String> params = new ArrayList<>();
            petPolicies.forEach(p -> params.add("pets=" + URLEncoder.encode(p.value, StandardCharsets.UTF_8)));
            requiredAmenities.forEach(a -> params.add("amenities=" + URLEncoder.encode(a.value, StandardCharsets.UTF_8)));
            
            url.append(String.join("&", params));
        }

        List<Property> properties = new ArrayList<>();
        String pageContent = fetchPage(url.toString());
        
        // Parse the page with JSoup
        Document doc = Jsoup.parse(pageContent);
        
        // Find the script containing the search results data
        Element dataScript = doc.select("script[data-zrr-shared-data-key]").first();
        if (dataScript != null) {
            // Extract and parse the JSON data properly
            String jsonData = dataScript.html();
            jsonData = jsonData.replaceAll("<!--", "").replaceAll("-->", "");
            JsonNode searchResults = MAPPER.readTree(jsonData)
                                         .path("cat1")
                                         .path("searchResults")
                                         .path("listResults");

            if (searchResults.isArray()) {
                for (JsonNode listing : searchResults) {
                    Property prop = new Property();
                    
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
                    
                    prop.propertyType = listing.path("propertyType").asText();
                    prop.daysOnMarket = listing.path("variableData").path("text").asText();
                    
                    // Extract features using JSoup's DOM traversal
                    String zpid = prop.zpid;
                    Element listingCard = doc.select(String.format("article[data-zpid=%s]", zpid)).first();
                    if (listingCard != null) {
                        // Get features from the listing card
                        Elements featureElements = listingCard.select(".feature-item");
                        featureElements.forEach(feature -> {
                            String featureText = feature.text().toLowerCase();
                            prop.features.add(featureText);
                            
                            // Auto-detect amenities and pet policies
                            for (Amenities a : Amenities.values()) {
                                if (featureText.contains(a.value)) {
                                    prop.amenities.add(a);
                                }
                            }
                            for (PetPolicy p : PetPolicy.values()) {
                                if (featureText.contains(p.value)) {
                                    prop.petPolicies.add(p);
                                }
                            }
                        });
                        
                        // Extract parking info specifically
                        Element parkingInfo = listingCard.select(".parking-info").first();
                        if (parkingInfo != null) {
                            prop.parking = parkingInfo.text();
                        }
                    }
                    
                    properties.add(prop);
                }
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

    public void saveToCsv(List<Property> properties, String filename) throws IOException {
        try (PrintWriter out = new PrintWriter(new FileWriter(filename))) {
            out.println("zpid,address,price,beds,baths,sqft,url,latitude,longitude,propertyType,daysOnMarket,features,parking,petPolicies,amenities");
            properties.forEach(p -> out.println(p.toCsv()));
        }
    }

    @Override
    public void close() throws IOException {
        httpClient.close();
    }

    public static void main(String[] args) {
        String url = "https://www.zillow.com/waikiki-honolulu-hi/rentals/";
        
        try (WaikikiScraper scraper = new WaikikiScraper()) {
            Set<PetPolicy> petPolicies = new HashSet<>(Arrays.asList(PetPolicy.CATS_ALLOWED));
            Set<Amenities> amenities = new HashSet<>(Arrays.asList(
                Amenities.AIR_CONDITIONING,
                Amenities.WASHER_DRYER_IN_UNIT,
                Amenities.PARKING_GARAGE
            ));
            
            List<Property> properties = scraper.scrapeListings(url, petPolicies, amenities);
            scraper.saveToCsv(properties, "waikiki_rentals.csv");
            
            System.out.printf("Found %d properties%n", properties.size());
            properties.forEach(p -> System.out.printf("%s - $%s%n", p.address, p.price));
            
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}