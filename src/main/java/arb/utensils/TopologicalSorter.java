import java.util.*;

public class TopologicalSorter {

    /**
     * Performs topological sorting on a dependency graph.
     *
     * @param graph A map where each key is a node and its value is a list of nodes it depends on.
     * @return A list of nodes in topological order.
     * @throws IllegalArgumentException if the graph contains cycles.
     */
    public static List<String> topologicalSort(Map<String, List<String>> graph) {
        // Step 1: Compute in-degrees
        Map<String, Integer> inDegree = new HashMap<>();
        for (String node : graph.keySet()) {
            inDegree.put(node, 0); // Initialize in-degrees to 0
        }
        for (List<String> dependencies : graph.values()) {
            for (String dependency : dependencies) {
                inDegree.put(dependency, inDegree.getOrDefault(dependency, 0) + 1);
            }
        }

        // Step 2: Add all nodes with in-degree 0 to the queue
        Queue<String> queue = new LinkedList<>();
        for (Map.Entry<String, Integer> entry : inDegree.entrySet()) {
            if (entry.getValue() == 0) {
                queue.add(entry.getKey());
            }
        }

        // Step 3: Perform topological sort
        List<String> sortedOrder = new ArrayList<>();
        while (!queue.isEmpty()) {
            String current = queue.poll();
            sortedOrder.add(current);

            // Reduce the in-degree of dependent nodes
            for (String neighbor : graph.getOrDefault(current, Collections.emptyList())) {
                inDegree.put(neighbor, inDegree.get(neighbor) - 1);
                if (inDegree.get(neighbor) == 0) {
                    queue.add(neighbor);
                }
            }
        }

        // Step 4: Check for cycles
        if (sortedOrder.size() != graph.size()) {
            throw new IllegalArgumentException("The graph contains a cycle! Topological sorting is not possible.");
        }

        return sortedOrder;
    }

    public static void main(String[] args) {
        // Example dependency graph
        Map<String, List<String>> dependencyGraph = new HashMap<>();
        dependencyGraph.put("C", List.of()); // C has no dependencies
        dependencyGraph.put("A", List.of("C")); // A depends on C
        dependencyGraph.put("B", List.of("C")); // B depends on C
        dependencyGraph.put("E", List.of("C")); // E depends on C
        dependencyGraph.put("P", List.of("A", "B", "C", "E")); // P depends on A, B, C, E

        try {
            List<String> sortedOrder = topologicalSort(dependencyGraph);
            System.out.println("Initialization Order: " + sortedOrder);
        } catch (IllegalArgumentException e) {
            System.err.println(e.getMessage());
        }
    }
}