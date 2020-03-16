exe <- "~/SPLATCHE3-Linux-64b"

#### SPLATCHE3_PopDensity ####
PopDensity <- tibble::tribble(
  ~Pop_name, ~pop_size, ~Lat, ~Long, ~ResizeA, ~Time_ResizeB, ~ResizeB, ~MigrationFromCurrentSource, ~NoLayer, ~TimeOfExpansion,
  "source1", 100, 10, 40, 0, 0, 0, 0, 0, 0,
  "source2", 100, 10, 40, 0, 0, 0, 0, 0, 0
) %>% as.SPLATCHE3_PopDensity()

#### raster ####
PresVegetation <- Hydro <- RoughnessTopo <- mMap <- raster::raster(system.file("external/rlogo.grd", package = "raster"))

#### SPLATCHE3_Veg2phase ####
Veg2Kphase <- tibble::tribble(
  ~category, ~value, ~description,
  1,	100,	"Tropical rainforest",
  2,	100,	"Monsoon or dry forest",
  3,	100,	"Tropical woodland"
) %>% as.SPLATCHE3_Veg2phase

Veg2Fphase <- tibble::tribble(
  ~category, ~value, ~description,
  1,	0.8,	"Tropical rainforest",
  2,	0.8,	"Monsoon or dry forest",
  3,	0.8,	"Tropical woodland"
) %>% as.SPLATCHE3_Veg2phase

#### SPLATCHE3_Veg2mphase ####

Veg2mphase <- tibble::tribble(
  ~category, ~north, ~east, ~south, ~west, ~description,
  1,	0.03,	0.03,	0.03,	0.03,	"Tropical rainforest",
  2,	0.03,	0.03,	0.03,	0.03,	"Monsoon or dry forest",
  3,	0.03,	0.03,	0.03,	0.03,	"Tropical woodland"
) %>% as.SPLATCHE3_Veg2phase

#### SPLATCHE3_Veg2dyn ####
Veg2Kdyn <- tibble::tribble(
  ~time_of_change, ~corresponding_table, ~description,
  1, Veg2Kphase, "Time1",
  200, Veg2Kphase, "Time2"
) %>% as.SPLATCHE3_Veg2dyn

Veg2Fdyn <- tibble::tribble(
  ~time_of_change, ~corresponding_table, ~description,
  1, Veg2Fphase, "Time1",
  200, Veg2Fphase, "Time2"
) %>% as.SPLATCHE3_Veg2dyn

Veg2mdyn <- tibble::tribble(
  ~time_of_change, ~corresponding_table, ~description,
  1, Veg2mphase, "Time1",
  200, Veg2mphase, "Time2"
) %>% as.SPLATCHE3_Veg2dyn

#### SPLATCHE3_ArrivalCell ####
ArrivalCell <- tibble::tribble(
  ~PopName, ~Layer, ~Lat, ~Lon,
  "samp1", 0, 12, 3,
  "samp2", 0, 33, 8,
  "samp3", 0, 14, 30
) %>% as.SPLATCHE3_ArrivalCell

#### SPLATCHE3_Sample ####
Sample <- tibble::tribble(
  ~Name, ~Size, ~Layer, ~Lat, ~Lon,
  "sample1", 30, 0,	20, 20,
  "sample2", 30, 0,	20, 0,
  "sample3", 30, 0,	0, 20,
  "sample4", 30, 0, -20, 20,
  "sample5", 30, 0,	-30, 25,
  "sample6", 30, 0,	5, 40
) %>% as.SPLATCHE3_Sample

#### SPLATCHE3_settings ####
SPLATCHE3_settings <- list(
  PopDensityFile = PopDensity,# "./datasets_1layer-ver3/dens_init.txt",
  PresVegetationFile = PresVegetation,#"./datasets_1layer-ver3/ppveg.asc",
  HydroFile = Hydro,#"./datasets_1layer-ver3/rivers.asc",
  RoughnessTopoFile = RoughnessTopo,#"./datasets_1layer-ver3/roughness.asc",
  mMapFile = mMap,#"./datasets_1layer-ver3/ppveg.asc",
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
  GeneticFile = "./datasets_1layer-ver3/genetic_data_SEQ.par",
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
) %>% as.SPLATCHE3_settings()



#### export ####

export(SPLATCHE3_settings, "test.txt")
