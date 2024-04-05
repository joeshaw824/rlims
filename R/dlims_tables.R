mol_extraction_methods <- call_table(table = "MOL_ExtractionMethods") |> 
  # Remove large columns to avoid Invalid Descriptor Index error
  dplyr::select(-c(checks, reagents)) |> 
  dplyr::collect()

mol_extractions <- call_table(table = "MOL_Extractions")

mol_extraction_batches <- call_table(table = "MOL_ExtractionBatches")

samples <- call_table("Samples")

results_access <- call_table(table = "ResultsAccess")

tissue_types <- call_table(table = "TissueTypes") |> 
  dplyr::collect() 
  
discode <- call_table(table = "Discode") |> 
  dplyr::select(-c("description", "referral_details")) |> 
  dplyr::collect() 

ngiscodes <- call_table(table = "NGISCodes") |> 
  dplyr::collect()

pcr_new <- call_table(table = "PCR_New")

pcr_records <- call_table(table = "PCR_Records")
