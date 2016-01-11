## Sources

failed_bank_tracker <- read.csv("failed-bank-tracker.csv", sep = ",", na.strings=c("NA","NaN", " "))
bank_stress_tests <- read.csv("bank-stress-tests.csv", sep = ",", na.strings=c("NA","NaN", " "))
bank_aids_approved <- read.csv("bank-aids-approved.csv", sep = ",", na.strings=c("NA","NaN", " "))


## Change Bank Stress Tests Columns to something more readable
names(bank_stress_tests)[4] <- paste("Tier 1 Capital")
names(bank_stress_tests)[5] <- paste("Test 1")
names(bank_stress_tests)[6] <- paste("Test 2")

### Save new .csv file to post it to Central de Dados
write.csv(bank_stress_tests, file="bankstresstests-verified.csv", sep = ",")

## Change and Drop unnecessary Bank Aids Approved Column Titles
names(bank_aids_approved)[15] <- paste("BANKS_INVOLVED")
bank_aids_approved <- subset(bank_aids_approved, select = c("CASE_CODE", "MEMBER_STATE", "AID_INSTRUMENT", 
                                                            "CASE_TYPE", "START_DATE", "END_DATE", 
                                                            "NOTIFICATION_DATE", "DECISIONS", "OBJECTIVES"
                                                            , "DECISION_DATE", "DG_RESPONSIBLE", 
                                                            "BANKS_INVOLVED"))
### Save new .csv file to post it to Central de Dados
write.csv(bank_aids_approved, file = "bank-aids-approved.csv")

## Change and drop NA rows for banks we don't know the name
### Remove NA values && Order by ascending order of date
colnames(failed_bank_tracker) <- c("DATE", "DESCRIPTION", "IMAGE", "PLACE", "LOCATION", "SOURCE"
                                , "SOURCE_URL", "TOTAL_ASSETS", 
                                "SOURCE_(LINK_FOR_TOTAL_ASSET_OF_BALANCE_SHEET)", 
                                "CORPORATE_ENTITY", "ACQUIRER_(PUBLIC_OR_PRIVATE)", "TYPE_OF_RESTRUCTURING"
                                , "HOME_COUNTRY", "FAILED_(Y/N)", "AMOUNT", "PUBLIC AID")

### Picking the columns that are not text-based
failed_bank_tracker <- subset(failed_bank_tracker, select = c("DATE", "PLACE", "HOME_COUNTRY", "LOCATION"
                                                              , "CORPORATE_ENTITY", "SOURCE_URL", 
                                                              "TYPE_OF_RESTRUCTURING",  "FAILED_(Y/N)", 
                                                              "AMOUNT"))
### Attempt to remove NAs and blank spaces.
failed_bank_tracker<- na.omit(failed_bank_tracker)
failed_bank_tracker <- failed_bank_tracker[complete.cases(failed_bank_tracker[,1]),]
### Order by ascending order of date
failed_bank_tracker <- failed_bank_tracker[order(failed_bank_tracker$DATE, decreasing = TRUE),]

### Save new .csv file to post it to Central de Dados
write.csv(failed_bank_tracker, file = "bancos-falidos.csv")