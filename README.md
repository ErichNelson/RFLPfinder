# RFLPfinder
README for Comparison of diets for Largemouth and Smallmouth Bass in Eastern Lake Ontario using DNA barcoding and stable isotope analysis, Nelson, E, Holden, J, Eves, R, Tufts, B

2017-07-12

This README file describes the data files and supplementary files accompanying the above publication.  For any further queries please contact erich.nelson@queensu.ca

The following files are included on Dryad:

1)  "Morphological Data.csv" 
This CSV file contains morphological information regarding the Largemouth Bass and Smallmouth Bass used in this study, as well as the visual identification data of prey dissected from their stomachs. Bass were angled from across the Eastern Basin of Lake Ontario and St. Lawrence River for tournaments in the following Canadian cities: Trenton (44°05'55.1"N 77°34'18.0"W), Belleville (44°09'19.0"N 77°22'52.2"W), Deseronto (44°11'29.7"N 77°03'09.5"W), Kingston (44°13'46.0"N 76°28'38.8"W), Gananoque (44°19'17.9"N 76°09'50.8"W), Rockport (44°22'57.2"N 75°55'42.0"W), and Morrisburg (44°53'34.7"N 75°10'45.9"W).

ID - The number assigned to each bass, based on its order of processing.

Species - Largemouth Bass or Smallmouth Bass.

Fork Length (mm) - Distance (mm) from the mouth of each bass to its tail fork.

Total Length (mm) - Distance (mm) from the mouth of each bass to the furthest tip of its tail when closed.

Round Weight (g) - Total weight (g) of each bass.

Year Caught - Year each bass was angled.

Primary Stomach Items - Number of prey dissected from each bass stomach (from 0-17).

Total Prey Mass - Total mass of all dissected prey.

Morph ID Prey 1-17 - Classification of digestion extent (from 1-5) for each prey, according to scheme listed in the Table 3 caption.

Species Prey 1-17 - Species of each dissected prey based on visual identification to lowest taxonomy. D = Slightly Deep-Bodied Fish, F = Fish, G = Round Goby, C = Crustacean, S = Silvery Fish, A = Alewife, BB = Brown Bullhead

Mass Prey 1-17 - Mass of each dissected prey.

TAXON 1-17 - Compiled species of each dissected prey, based on both visual and DNA barcoding identification.

The common names for species used in this README file and in the above described CSV refer to the following latin species names:

Alewife - Alosa pseudoharengus

Rock Bass - Ambloplites rupestris

Brown Bullhead - Ameiurus nebulosus

Bowfin - Amia calva

Pumpkinseed Sunfish - Lepomis gibbosus

Bluegill Sunfish - Lepomis macrochirus

Largemouth Bass - Micropterus salmoides

Smallmouth Bass - Micropterus dolomieu

Round Goby - Neogobius melanostomus

Golden Shiner - Notemigonus crysoleucas

2)  "Sequence Data.csv"
This CSV file contains chromatogram quality scores, partial COI barcode sequences and probability of placement for all prey identified with DNA barcoding.

ID - The number assigned to each bass, based on its order of processing.

Prey Number - The number assigned to prey item dissected from bass stomach that underwent DNA barcoding.

Sample Name/Chromat ID/Read ID - Values assigned by external facility (TCAG) associated with the sequence data.

Read Length - Nucleotide length of trimmed sequence read.

Prey Species - Species of prey item, as determined by BOLD Systems identification interface (http://boldsystems.org/index.php/IDS_OpenIdEngine).

Probability of Placement - Probability of placement into species category, as determined by BOLD Systems identification interface.

Trimmed Read - Nucleotide sequence of trimmed read.

Quality Scores - Nucleotide quality score associated with trimmed read.

The following files are included on GitHub (https://github.com/ErichNelson/RFLPfinder):

3)  "RFLPfinder.R"
This R file contains the script used to identify candidate restriction enzymes for Restriction Fragment Length Polymorphism (RFLP) tests, using voucher specimens obtained from BOLD Systems. Further instructions on how to use are found as annotations throughout the script.

3)  "enzyme.sites.txt"
This txt file contains the recognition sites of commercially available restriction endonucleases, and is an input file for the RFLPfinder.R script.

