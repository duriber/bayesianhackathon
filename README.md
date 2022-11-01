# bayesian hackathon

Four datasets to play with for a hackathon to practice skills learnt at the Deakin Bayesian Statistics Worshop 2022







### DATASET 1: homerange size of red fox

  Source: Main et al., 2020 (https://doi.org/10.1111/ddi.13115)
  
  Description: Meta-analysis of fox homerange sizes with a range of predictor variables. 
  
  Result: Human impact overrides bioclimatic drivers of red fox home range size globally. 
  
  Files:
  
    a) "MAIN_foxes_readme.txt" - original documentation of the dataset
    
    b) "fox_data.csv" - the dataset
    
    c) "Dataset1_redFoxHomeRange.R" - code to read it and a couple of data explorations
    
    d) "fox_code.R" - code to replicate the analyses presented in the paper
    
    e) "Main et al 2020.pdf" - paper published in Div&Dist

  Suggested analysis: Gaussian (log) regression





### DATASET 2: Bird distributions in South-East Canada

  Source: Elith et al., 2020 (https://doi.org/10.17161/bi.v15i2.13384)
  
  Description:  Presence-absence (1-0) data for 20 bird species in South-East Canada with environment predictors either already extracted or as rasters. Package "disdat". 
  
  Files:
  
    a) "CanadianBirdDistributions.R" - code to read it and a couple of data explorations
    
    b) "Elith et al_BI_2020.pdf" - original paper published in Biodiv. Informatics
    
    c) "rasters_Can.zip" - compressed file with the original rasters of the environmental predictors 
    (note that altitude was not included as raster but it still is present in the extracted values)
    
  
  Suggested analysis: Bernoulli (logit) regression
  




### DATASET 3: Phylogenetic signal on birds susceptibility to avian influenza in Australia

  Source: Wille et al., preprint (https://doi.org/10.1101/2022.02.14.480463)
  
  Description: Investigating the phylogenetic and ecological effects on host competency for avian influenza in Australian wild birds.
  
  Files:
  
    a) "2022.02.14.480463v1.full.pdf" - Preprint paper published in bioRxiv.
    
    b) "birddata.csv" - the dataset

    c) "phylogeneticTree_allSpecies.nwk" - the phylogenetic tree
    
    d) "Dataset3_AvianInfluenza.R" - code to read it, clean it and a couple of data explorations
    
    e) "AIVOzGLMPhylo20220120.Rmd" - original code to run the analyses in Wille et al preprint
  
  Suggested analysis: Bernoulli (logit) regression for A
  
    
    
    
  

### DATASET 4: roosting time standing on one leg for 9 bird species

  Source: Julia Ryeland and Matt Symonds
  
  Description: observations of shorebird roosting behaviour and roosting time standing on one leg for 9 bird species predicted by environmental conditions with random and fixed effect. Bayesian modelling approach described within the paper.
  
  Files:
  
    a) "Roostingdata.csv" original dataset - whats in there is unclear
    
    b) "Dataset4_OneLegRoosting.R" - code to load the data
    
    c) "Journal of Avian Biology - 2019 - Ryeland - Leg length and temperature determine the use of unipedal roosting in birds.pdf" - Paper published in Journal of Avian Biology
  
  Suggested analysis: look at the papers approach
  
  
