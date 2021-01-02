#Shell-Script für Bash Uebung4

#zunächst unnötige Spalten loswerden und nur noch Spalte ISSN und Date behalten
cut -f 5,12 2020-12-04-Article_list_dirty.tsv > shell_temp_ohne_ueberfluessige_Spalten.tsv

#ISSN/issn: rausschmeißen
sed 's/[Ii][Ss][Ss][Nn]://' shell_temp_ohne_ueberfluessige_Spalten.tsv > shell_temp_ohne_Spalten_ISSN.tsv

#jetzt noch die Leerzeichen rausholen und sortieren 
sed 's/ //g' shell_temp_ohne_Spalten_ISSN.tsv | sort | uniq > shell_temp_ohne_Spalten_ISSN_Leerzeichen_sortiert.tsv

#relevante ISSN-Zeilen greifen
grep -i - shell_temp_ohne_Spalten_ISSN_Leerzeichen_sortiert.tsv > 2021-01-02-Dates_and_ISSNs.tsv

#nicht mehr benötigte temp-Dateien löschen
rm *temp*.tsv