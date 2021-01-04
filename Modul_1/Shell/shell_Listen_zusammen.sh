#Spalten aus der Dirty-Datei rausgeholt, die zusätzlich sind
cut -f 7,14 2020-12-04-Article_list_dirty.tsv > Liste_2.tsv

echo Ausschneiden fertig

#dort die Zeilen mit ISSN-Angaben rausgeholt
grep '[[:digit:]][[:digit:]][[:digit:]][[:digit:]]'-'[[:digit:]][[:digit:]][[:digit:]][[:digit:]xX]' Liste_2.tsv > Liste_2_ISSN.tsv

echo ISSN rausholen fertig

#Ausgabe der relavanten Zeilen in neue Datei nachdem ich mit less Liste_Zusatzspalten_ISSN.tsv geschaut hab wie die Daten aussehen
sed '2,9!d' Liste_2_ISSN.tsv > Liste_2_ISSN_sediert.tsv

echo ISSN raushoen 2 fertig

#auch erstmal angeschaut wie die aussieht und dann mit der einfachen Lösung, die ich schon fertig hatte zusammengebastelt
cat 2021-01-02-Dates_and_ISSNs.tsv Liste_2_ISSN_sediert.tsv > 2021-01-05-Dates_and_ISSNs_unsortiert.tsv

echo cat 1 fertig

#jetzt noch Sortieren und Überflüssiges raus
cat 2021-01-05-Dates_and_ISSNs_unsortiert.tsv | sort | uniq > 2021-01-05-Dates_and_ISSNs_more_results.tsv

