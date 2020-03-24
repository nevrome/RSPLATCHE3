library(magrittr)
library(RSPLATCHE3)



#### install SPLATCHE3 ####
path_to_exe <- install(path = "~/splatche3", os = "Linux")



#### SPLATCHE settings

# SPLATCHE3_PopDensity
PopDensity <- tibble::tribble(
  ~Pop_name, ~pop_size, ~Lat, ~Long, ~ResizeA, ~Time_ResizeB, ~ResizeB, ~MigrationFromCurrentSource, ~NoLayer, ~TimeOfExpansion,
  "source1", 100, 25, 10, 0, 0, 0, 0, 0, 0
) %>% as.SPLATCHE3_PopDensity()

# PresVegetation
PresVegetation <- expand.grid(x = 1:50, y = 1:50) %>%
  tibble::as_tibble() %>%
  dplyr::mutate(
    z = 1
  ) %>%
  raster::rasterFromXYZ(crs = "+proj=merc +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0")

# SPLATCHE3_Veg2phase
Veg2Kphase <- tibble::tribble(
  ~category, ~value, ~description,
  0,	100,	"Land_without_special_properties"
) %>% as.SPLATCHE3_Veg2phase

# SPLATCHE3_Veg2dyn 
Veg2Kdyn <- tibble::tribble(
  ~time_of_change, ~corresponding_table, ~description,
  1, Veg2Kphase, "Time1"
) %>% as.SPLATCHE3_Veg2dyn

# SPLATCHE3_ArrivalCell
ArrivalCell <- tibble::tribble(
  ~PopName, ~Layer, ~Lat, ~Lon
) %>% as.SPLATCHE3_ArrivalCell

# SPLATCHE3_Sample
Sample <- tibble::tribble(
  ~Name, ~Size, ~Layer, ~Lat, ~Lon,
  "sample1", 30, 0,	20, 20,
  "sample2", 30, 0,	20, 10,
  "sample3", 30, 0,	10, 20,
  "sample4", 30, 0, 20, 20,
  "sample5", 30, 0,	30, 25,
  "sample6", 30, 0,	5, 40
) %>% as.SPLATCHE3_Sample

# Genetic
Genetic <- c(
  "1 //Num chromosomes",
  "#chromosome 1, //per Block:data type, number of loci, per generation recombination, MAF",
  "1",
  "SNP    1   0    0.03",
  "#chromosome 2, //per Block:data type, number of loci, per generation recombination, MAF",
  "1",
  "SNP    1   0    0.03"
) %>% as.SPLATCHE3_Genetic



#### SPLATCHE3_settings ####
SPLATCHE3_settings <- list(
  # starting population
  PopDensityFile = PopDensity,
  # world definition
  PresVegetationFile = PresVegetation,
  HydroFile = NA,
  RoughnessTopoFile = NA,
  mMapFile = NA,
  Veg2KFile = Veg2Kdyn,
  Veg2FFile = NA,
  Veg2mFile = NA,
  # demographic simulation
  ChosenDemographicModel = 1,
  EndTime = 400,
  GenerationTime = 30,
  GrowthRate = 0.4,
  MigrationRate = 0.4,
  AllowSourcePopulationOverflow = NA,
  TauValue = 10,
  AncestralSize = NA,
  ArrivalCellFile = ArrivalCell,
  # long distance dispersal (LDD)
  LDDProportion = NA,
  GammaShapeParamAllCells = NA,
  GammaScaleParamAllCells = NA,
  LDD_max_treshold = NA,
  # world-population interaction
  FrictionChoice = NA,
  RealBPTime = -10000,
  RiverFrictionChangeFactor = NA,
  RiverCarCapChangeFactor = NA,
  CoastFrictionChangeFactor = NA,
  CoastCarCapChangeFactor = NA,
  # genetic simulation
  SampleFile = Sample,
  GeneticFile = Genetic,
  NumGeneticSimulations = 1,
  GenotypicData = 1,
  MaxNumGenerations = 10000,
  NexusFile = 0,
  GenealogiesFile = 0,
  ImmigDistrFile = 0,
  # double population setup
  DoublePopulationMode = 0,
  GrowthRate_P2 = NA,
  MigrationRate_P2 = NA,
  MigrRate_P1_to_P2 = NA,
  MigrRate_P2_to_P1 = NA,
  Veg2K_P2_File = NA,
  Veg2F_P2_File = NA,
  Veg2m_P2_File = NA,
  PropFile = NA,
  # other outputs
  GenerateOutputMigrationBMP = 1,
  GenerateOutputMDensityBMP = 1,
  GenerateOutputOccupationBMP = 1,
  GenerateOutputMigrationASCII = 1,
  GenerateOutputMDensityASCII = 1,
  GenerateOutputOccupationASCII = 1,
  # other/technical parameters
  AllowShortIntForNumberOfIndividuals = 1
) %>% as.SPLATCHE3_settings()



#### run splatche with these settings ####
run(SPLATCHE3_settings, outdir = "~/test/splatche", exe = path_to_exe)
