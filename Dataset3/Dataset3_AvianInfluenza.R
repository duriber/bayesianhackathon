# Bayesian Statistics Workshop Hackathon 
# Deakin University, Nov 2022.
# 
# Script to load and explore a dataset to evaluate the effects of phylogeny 
# on susceptibility to avian influenza in Australian birds
# citation: Wille et al (under review) - preprint in https://doi.org/10.1101/2022.02.14.480463
# 
 

# load the original dataset
Y <- read.csv("Dataset3/birddata.csv",na.strings=c("", "NA"), header=TRUE,sep=",", stringsAsFactors = FALSE)
Y$group <- as.factor(Y$group)


# generate a simplified dataset with a subset of the variables to play with
# and ensure they are read as factor whenever the case
simplified_data <- Y[,c('AIV', 'LocLon', 'LocLat')]
for(i in c('Year2', 'group', 'Ecotype', 'Age', 'BandNumber', 'Season',
           'CatSpeSpeciesRef', 'Sex', 'CatSampleID', 'LocRegionRef')){
  simplified_data <- cbind(simplified_data, as.factor(Y[,i]))
  colnames(simplified_data)[ncol(simplified_data)] <- i
}

## read phylogenetic TREE for all species
library(ape)
av.host.tree<-read.tree('Dataset3/phylogeneticTree_allSpecies.nwk')
# naming the tips
av.host.tree$tip.label[which(av.host.tree$tip.label=="Anas_castanea_CytB_NADH")] <- "Chestnut teal"
av.host.tree$tip.label[which(av.host.tree$tip.label=="Anas_gracilis_CytB_COI_NADH")] <- 'Grey teal'
av.host.tree$tip.label[which(av.host.tree$tip.label=="Anas_superciliosa_CytB_COI_NADH")] <- "Pacific black duck"
av.host.tree$tip.label[which(av.host.tree$tip.label=="Ardenna_Puffinus_tenuirostris_CytB_COI_NADH")] <- "Short-tailed shearwater"
av.host.tree$tip.label[which(av.host.tree$tip.label=="Arenaria_interpres_RAG1_CytB_COI_NADH")] <- 'Ruddy turnstone'
av.host.tree$tip.label[which(av.host.tree$tip.label=="Aythya_australis_CytB_COI_NADH")] <- "Hardhead"
av.host.tree$tip.label[which(av.host.tree$tip.label=="Calidris_acuminata_RAG1_CytB_COI_NADH")] <- 'Sharp-tailed sandpiper'
av.host.tree$tip.label[which(av.host.tree$tip.label=="Calidris_alba_RAG1_CytB_COI_NADH")] <- 'Sanderling'
av.host.tree$tip.label[which(av.host.tree$tip.label=="Calidris_canutus_RAG1_CytB_COI_NADH")] <- 'Red knot'
av.host.tree$tip.label[which(av.host.tree$tip.label=="Calidris_ferruginea_RAG1_CytB_COI_NADH")] <- 'Curlew sandpiper'
av.host.tree$tip.label[which(av.host.tree$tip.label=="Calidris_ruficollis_RAG1_CytB_COI_NADH")] <- 'Red-necked stint'
av.host.tree$tip.label[which(av.host.tree$tip.label=="Calidris_tenuirostris_RAG1_CytB_COI_NADH")] <- 'Great knot'
av.host.tree$tip.label[which(av.host.tree$tip.label=="Charadrius_leschenaultii_RAG1_CytB_COI_NADH")] <- 'Greater sandplover'
av.host.tree$tip.label[which(av.host.tree$tip.label=="Chenonetta_jubata_CytB_COI_NADH")] <- "Wood duck"
av.host.tree$tip.label[which(av.host.tree$tip.label=="Chlidonias_hybridus_CytB_COI_NADH")] <- "Whiskered tern"
av.host.tree$tip.label[which(av.host.tree$tip.label=="Fulica_atra_CytB_COI_NADH")] <- "Common coot"
av.host.tree$tip.label[which(av.host.tree$tip.label=="Gallinula_Tribonyx_ventralis_RAG_CytB_COI")] <- "Black-tailed nativehen"
av.host.tree$tip.label[which(av.host.tree$tip.label=="Geopelia_cuneata_CytB_COI_NADH")] <- "Diamond dove"
av.host.tree$tip.label[which(av.host.tree$tip.label=="Haematopus_longirostris_RAG1_CytB_COI_NADH")] <- 'Pied oystercatcher'
av.host.tree$tip.label[which(av.host.tree$tip.label=="Heteroscelus_Tringa_brevipes_RAG1_CytB_COI_NADH")] <- 'Grey-tailed tattler'
av.host.tree$tip.label[which(av.host.tree$tip.label=="Larus_novaehollandiae_CytB_COI_NADH")] <- "Silver gull"
av.host.tree$tip.label[which(av.host.tree$tip.label=="Limosa_lapponica_RAG1_CytB_COI_NADH")] <- 'Bar-tailed godwit'
av.host.tree$tip.label[which(av.host.tree$tip.label=="Malacorhynchus_membranaceus_CytB_NADH")] <- 'Pink-eared duck'
av.host.tree$tip.label[which(av.host.tree$tip.label=="Melopsittacus_undulatus_RAG_CytB_COI_NADH")] <- "Budgerigar"
av.host.tree$tip.label[which(av.host.tree$tip.label=="Recurvirostra_novaehollandiae_RAG1_CytB_COI_NADH")] <- 'Red-necked avocet'
av.host.tree$tip.label[which(av.host.tree$tip.label=="Tadorna_tadornoides_CytB_COI_NADH")] <- 'Australian shelduck'
av.host.tree$tip.label[which(av.host.tree$tip.label=="Taeniopygia_guttata_CytB_COI_NADH")] <- "Zebra finch"
av.host.tree$tip.label[which(av.host.tree$tip.label=="Thalasseus_bergii__CytB_COI_NADH")] <- "Crested tern"
av.host.tree$tip.label[which(av.host.tree$tip.label=="Xenus_cinereus_RAG_CytB_COI_NADH")] <- 'Terek sandpiper'

print(av.host.tree) # visualise

#plot it
library(phytools)
par(mfrow=c(1,1))
plot(unroot(av.host.tree),type="unrooted",no.margin=TRUE,lab4ut="axial",edge.width=2)
plotTree(av.host.tree, type="fan", fsize=0.7,lwd=1, ftype="i")
plotTree(av.host.tree, node.numbers=T, offset=1)

new.tree <- root(av.host.tree, node=36)
plotTree(new.tree, offset=1)

#Create phylogenetic matrix for random phylogeny term
# this matrix can be used to inform the relatedness between random intercepts by species
phylo.A<-vcv(as.phylo(av.host.tree))

TreeList <- colnames(phylo.A) # species list from the phylogenetic tree

AllList <- unique(Y$CatSpeSpeciesRef[which(!is.na(Y$group))]) # list of species from raw dataset

DropList <- AllList[!AllList %in% TreeList] # species that are not available in the Phylogenetic tree

# removing species that will not be modelled
simplified_data <- simplified_data[which(simplified_data$CatSpeSpeciesRef %in% TreeList),]

# formula with random intercepts by species
simpleRandomIntercepts_form <- as.formula("AIV ~ Age + Year2 + Season + (1|CatSpeSpeciesRef)")

# formula with phylogenetically weighted random intercepts by species
RandomInterceptsPhyl_form <-  as.formula("AIV ~ Age + Year2 + Season + (1|gr(CatSpeSpeciesRef, cov = phylo.A))")

# estimation for the simple formula under the frequentist approach [lme4]
library(lme4)
freq_simplemodel <- lmer(simpleRandomIntercepts_form, 
                         data = simplified_data)
summary(freq_simplemodel)

# estimation for the simple formula under the Bayesian approach [brms]
library(brms)
bayes_simplemodel <- brm(simpleRandomIntercepts_form, 
                         data = simplified_data,
                         cores = 4) # parallel run
summary(bayes_simplemodel)

# estimation for the phylogenetically weighted formula under the Bayesian approach
bayes_phylomodel <- brm(RandomInterceptsPhyl_form, 
                         data = simplified_data,
                         data2 = list(phylo.A = phylo.A), # covariance matrix from phylogenetic distances
                         cores = 4) # parallel run
summary(bayes_phylomodel)
