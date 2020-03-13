exe <- "~/SPLATCHE3-Linux-64b"

SPLATCHE3_PopDensity <- tibble::tribble(
  ~Pop_name, ~pop_size, ~Lat, ~Long, ~ResizeA, ~Time_ResizeB, ~ResizeB, ~MigrationFromCurrentSource, ~NoLayer, ~TimeOfExpansion,
  "source1", 100, 10, 40, 0, 0, 0, 0, 0, 0
)

SPLATCHE3_PopDensity <- tibble::new_tibble(SPLATCHE3_PopDensity, nrow = nrow(SPLATCHE3_PopDensity), class = "SPLATCHE3_PopDensity")

f <- raster::raster(system.file("external/rlogo.grd", package="raster"))

raster::ncol(f)
raster::nrow(f)
raster::xyFromCell(f, raster::ncell(f) - raster::ncol(f) + 1)
raster::res(f)
NODATA_value

SPLATCHE3_settings <- list(
  PopDensityFile = "./datasets_1layer-ver3/dens_init.txt",
  PresVegetationFile = "./datasets_1layer-ver3/ppveg.asc",
  HydroFile = "./datasets_1layer-ver3/rivers.asc",
  RoughnessTopoFile = "./datasets_1layer-ver3/roughness.asc",
  mMapFile = "./datasets_1layer-ver3/ppveg.asc",
  Veg2KFile = "./datasets_1layer-ver3/dynamic_K.txt",
  Veg2FFile = "./datasets_1layer-ver3/dynamic_F.txt",
  Veg2mFile = "./datasets_1layer-ver3/dynamic_m.txt",
  ChosenDemographicModel = 4,
  EndTime = 400,
  GenerationTime = 30,
  GrowthRate = 0.4,
  MigrationRate = 0.4,
  AllowSourcePopulationOverflow = 1,
  TauValue = 200,
  AncestralSize = 200,
  ArrivalCellFile = "./datasets_1layer-ver3/Arrival_cell.col",
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
  SampleFile = "./datasets_1layer-ver3/GeneSamples.sam",
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
)

class(SPLATCHE3_settings) <- "SPLATCHE3_settings"

write_settings(SPLATCHE3_settings, "test.txt")
