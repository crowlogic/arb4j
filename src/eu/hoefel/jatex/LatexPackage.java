package eu.hoefel.jatex;

import java.lang.System.Logger;
import java.lang.System.Logger.Level;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;
import java.util.function.BinaryOperator;

public record LatexPackage(String name, Map<String, String> options, Map<String, Set<Class<?>>> incompatiblePackages) {
   private static final Logger logger = System.getLogger(LatexPackage.class.getName());

   public LatexPackage(String name) {
      this(name, (Map<String, String>)null, null);
   }

   public LatexPackage(String name, String option) {
      this(name, Map.of(option, ""), null);
   }

   public LatexPackage(String name, Map<String, String> options) {
      this(name, options, null);
   }

   public LatexPackage(String name, String incompatiblePackage, Class<?> classThatRequestsPackage) {
      this(name, null, Map.of(incompatiblePackage, Set.of(classThatRequestsPackage)));
   }

   public LatexPackage(String name, Map<String, String> options, Map<String, Set<Class<?>>> incompatiblePackages) {
      if (name != null && !name.isBlank()) {
         this.name = name;
         if (options != null && !options.isEmpty()) {
            this.options = Map.copyOf(options);
         } else {
            this.options = Collections.emptyNavigableMap();
         }

         if (incompatiblePackages != null && !incompatiblePackages.isEmpty()) {
            Map<String, Set<Class<?>>> ip = new HashMap<>();

            for(Entry<String, Set<Class<?>>> incompatiblePackage : incompatiblePackages.entrySet()) {
               ip.put(incompatiblePackage.getKey(), Set.copyOf(incompatiblePackage.getValue()));
            }

            this.incompatiblePackages = Map.copyOf(ip);
         } else {
            this.incompatiblePackages = Collections.emptyNavigableMap();
         }
      } else {
         throw new IllegalArgumentException("Package name may not be null/blank!");
      }
   }

   public static final boolean checkForIncompatiblePackages(List<LatexPackage> packages) {
      boolean probablyIncompatible = false;

      for(LatexPackage pckg : packages) {
         for(LatexPackage p : packages) {
            if (pckg.incompatiblePackages().containsKey(p.name())) {
               logger.log(
                  Level.WARNING,
                  () -> String.format(
                        Locale.ENGLISH,
                        "Probably incompatible packages found. You used these classes: %s, which need the %s package, which is (probably) incompatible with the %s package that is used in your main document. I'll try to continue, but this may very well break.",
                        pckg.incompatiblePackages().get(p.name()),
                        p.name(),
                        pckg.name()
                     )
               );
               probablyIncompatible = true;
            }
         }
      }

      return probablyIncompatible;
   }

   public static final List<LatexPackage> cleanup(List<LatexPackage> packages) {
      return cleanup(packages, false);
   }

   public static final List<LatexPackage> cleanup(List<LatexPackage> packages, boolean firstDominates) {
      LinkedHashMap<String, LatexPackage> cleanedPckgs = new LinkedHashMap<>();

      for(LatexPackage pckg : packages) {
         cleanedPckgs.putIfAbsent(pckg.name(), pckg);
         Map<String, String> o = new HashMap<>();
         Map<String, Set<Class<?>>> ip = new HashMap<>();
         if (firstDominates) {
            fill(cleanedPckgs, pckg, o::putIfAbsent, ip);
         } else {
            fill(cleanedPckgs, pckg, o::put, ip);
         }

         cleanedPckgs.put(pckg.name(), new LatexPackage(pckg.name(), o, ip));
      }

      return new ArrayList<>(cleanedPckgs.values());
   }

   private static final void fill(
      Map<String, LatexPackage> cleanedPckgs, LatexPackage pckg, BinaryOperator<String> options, Map<String, Set<Class<?>>> incompatibilities
   ) {
      for(Entry<String, String> option : cleanedPckgs.get(pckg.name()).options().entrySet()) {
         options.apply(option.getKey(), option.getValue());
      }

      for(Entry<String, String> option : pckg.options().entrySet()) {
         options.apply(option.getKey(), option.getValue());
      }

      LatexPackage p = cleanedPckgs.computeIfAbsent(pckg.name(), s -> pckg);

      for(Entry<String, Set<Class<?>>> ip : p.incompatiblePackages().entrySet()) {
         Set<Class<?>> incompatibleClasses = incompatibilities.computeIfAbsent(ip.getKey(), s -> new HashSet<>(ip.getValue()));
         incompatibleClasses.addAll(ip.getValue());
      }
   }
}
