package eu.hoefel.jatex;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Map.Entry;
import java.util.function.Consumer;

public record LatexPreambleEntry(String cmd, Map<String, String> options, boolean standalone) {
   public LatexPreambleEntry(String cmd) {
      this(cmd, true);
   }

   public LatexPreambleEntry(String cmd, String option) {
      this(cmd, Map.of(option, ""), true);
   }

   public LatexPreambleEntry(String cmd, Map<String, String> options) {
      this(cmd, options, true);
   }

   public LatexPreambleEntry(String cmd, boolean standalone) {
      this(cmd, Map.of(), standalone);
   }

   public LatexPreambleEntry(String cmd, Map<String, String> options, boolean standalone) {
      Objects.nonNull(cmd);
      this.cmd = cmd;
      if (options != null && !options.isEmpty()) {
         this.options = Map.copyOf(options);
      } else {
         this.options = Collections.emptyNavigableMap();
      }

      this.standalone = standalone;
   }

   public String preambleLine() {
      StringBuilder sb = new StringBuilder(this.cmd);
      if (!this.cmd.startsWith("%") && !this.cmd.isBlank() && !this.options.isEmpty()) {
         sb.append("{");

         for(Entry<String, String> option : this.options.entrySet()) {
            String key = option.getKey();
            if (key != null && !key.isBlank()) {
               sb.append(key);
               String value = option.getValue();
               if (Latex.STRING_IS_NOT_BLANK.test(value)) {
                  sb.append("=");
                  sb.append(value);
               }

               sb.append(",");
            }
         }

         sb.append("}");
      }

      return sb.toString();
   }

   public static final List<LatexPreambleEntry> cleanup(List<LatexPreambleEntry> entries) {
      List<LatexPreambleEntry> cleanedEntries = new ArrayList<>();

      for(LatexPreambleEntry entry : entries) {
         if (entry.standalone()) {
            cleanedEntries.add(entry);
         } else {
            cleanedEntries.stream()
               .filter(e -> e.cmd().equals(entry.cmd()) && !e.standalone())
               .findFirst()
               .ifPresentOrElse(updateEntry(cleanedEntries, entry), () -> cleanedEntries.add(entry));
         }
      }

      return cleanedEntries;
   }

   private static final Consumer<LatexPreambleEntry> updateEntry(List<LatexPreambleEntry> entries, LatexPreambleEntry additionalEntry) {
      return e -> {
         Map<String, String> m = new HashMap<>();
         m.putAll(e.options());
         m.putAll(additionalEntry.options());
         entries.set(entries.indexOf(e), new LatexPreambleEntry(e.cmd(), Map.copyOf(m), e.standalone()));
      };
   }
}
