exe <- "~/SPLATCHE3-Linux-64b"

#### SPLATCHE3_PopDensity ####
PopDensity <- tibble::tribble(
  ~Pop_name, ~pop_size, ~Lat, ~Long, ~ResizeA, ~Time_ResizeB, ~ResizeB, ~MigrationFromCurrentSource, ~NoLayer, ~TimeOfExpansion,
  "source1", 100, 10, 40, 0, 0, 0, 0, 0, 0
)
PopDensity <- tibble::new_tibble(PopDensity, nrow = nrow(PopDensity), class = "SPLATCHE3_PopDensity")

#### raster ####
raster_f <- raster::raster(system.file("external/rlogo.grd", package = "raster"))

#### SPLATCHE3_Veg2dyn ####
Veg2Kdyn <- tibble::tribble(
  
)
Veg2Kdyn <- tibble::new_tibble(Veg2Kdyn, nrow = nrow(Veg2Kdyn), class = "SPLATCHE3_Veg2dyn")

Veg2Fdyn <- tibble::tribble(
  
)
Veg2Fdyn <- tibble::new_tibble(Veg2Kdyn, nrow = nrow(Veg2Kdyn), class = "SPLATCHE3_Veg2dyn")

Veg2mdyn <- tibble::tribble(
  
)
Veg2mdyn <- tibble::new_tibble(Veg2mdyn, nrow = nrow(Veg2mdyn), class = "SPLATCHE3_Veg2dyn")

#### SPLATCHE3_Veg2phase ####
Veg2Kphase <- tibble::tribble(
  
)
Veg2Kphase <- tibble::new_tibble(Veg2Kphase, nrow = nrow(Veg2Kphase), class = "SPLATCHE3_Veg2phase")

Veg2Fphase <- tibble::tribble(
  
)
Veg2Fphase <- tibble::new_tibble(Veg2Kphase, nrow = nrow(Veg2Kphase), class = "SPLATCHE3_Veg2phase")

Veg2mphase <- tibble::tribble(
  
)
Veg2mphase <- tibble::new_tibble(Veg2mphase, nrow = nrow(Veg2mphase), class = "SPLATCHE3_Veg2phase")

#### SPLATCHE3_ArrivalCell ####
ArrivalCell <- tibble::tribble(
  
)
Veg2mphase <- tibble::new_tibble(ArrivalCell, nrow = nrow(ArrivalCell), class = "SPLATCHE3_ArrivalCell")

#### SPLATCHE3_Sample ####
Sample <- tibble::tribble(
  
)
Veg2mphase <- tibble::new_tibble(Sample, nrow = nrow(Sample), class = "SPLATCHE3_Sample")

#### SPLATCHE3_Genetic ####
Genetic <- tibble::tribble(
  
)
Veg2mphase <- tibble::new_tibble(Genetic, nrow = nrow(Genetic), class = "SPLATCHE3_Genetic")


  
SPLATCHE3_settings <- list(
  PopDensityFile = PopDensity,# "./datasets_1layer-ver3/dens_init.txt",
  PresVegetationFile = raster_f,#"./datasets_1layer-ver3/ppveg.asc",
  HydroFile = raster_f,#"./datasets_1layer-ver3/rivers.asc",
  RoughnessTopoFile = raster_f,#"./datasets_1layer-ver3/roughness.asc",
  mMapFile = raster_f,#"./datasets_1layer-ver3/ppveg.asc",
  Veg2KFile = Veg2Kdyn,#"./datasets_1layer-ver3/dynamic_K.txt",
  Veg2FFile = Veg2Fdyn,#"./datasets_1layer-ver3/dynamic_F.txt",
  Veg2mFile = Veg2mdyn,#"./datasets_1layer-ver3/dynamic_m.txt",
  ChosenDemographicModel = 4,
  EndTime = 400,
  GenerationTime = 30,
  GrowthRate = 0.4,
  MigrationRate = 0.4,
  AllowSourcePopulationOverflow = 1,
  TauValue = 200,
  AncestralSize = 200,
  ArrivalCellFile = ArrivalCell,#"./datasets_1layer-ver3/Arrival_cell.col",
  LDDProportion =  0.01,
  GammaShapeParamAllCells = 0.0419,
  GammaScaleParamAllCells = 0.002047083,
  LDD_max_treshold = 60,
  FrictionChoice = 2,
  RealBPTime = -120000,
  RiverFrictionChangeFactor = 0.5,
  RiverCarCapChangeFactor = 2,
  CoastFrictionChangeFactor = 0.5,
  CoastCarCapChangeFactor = 2,
  SampleFile = Sample,#"./datasets_1layer-ver3/GeneSamples.sam",
  GeneticFile = Genetic,#"./datasets_1layer-ver3/genetic_data_SEQ.par",
  NumGeneticSimulations = 1,
  GenotypicData = 1,
  MaxNumGenerations = 10000,
  NexusFile = 0,
  GenealogiesFile = 0,
  ImmigDistrFile = 0,
  DoublePopulationMode = 0,
  GenerateOutputMigrationBMP = 0,
  GenerateOutputMDensityBMP = 0,
  GenerateOutputOccupationBMP = 0,
  GenerateOutputMigrationASCII = 0,
  GenerateOutputMDensityASCII = 0,
  GenerateOutputOccupationASCII = 0,
  AllowShortIntForNumberOfIndividuals = 1
)

class(SPLATCHE3_settings) <- "SPLATCHE3_settings"

write_settings(SPLATCHE3_settings, "test.txt")
