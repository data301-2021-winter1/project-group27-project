sort <- data.frame(id = substr(dta$V1,5,7),
                   type = NA)
sort$type[sort$id == 991] <- "rec1"
sort$type[sort$id == 992] <- "rec2"
sort$type[sort$id < 991] <- "psych_contact"

rec1data_temp <- as.data.frame(dta[sort$type == "rec1",])
colnames(rec1data_temp) <- "V1"
rec1data <- data.frame(id = substr(rec1data_temp$V1,1,4),
                      rid = substr(rec1data_temp$V1,5,7),
                      sex = substr(rec1data_temp$V1,8,8),
                      birth = substr(rec1data_temp$V1,9,10),
                      race = substr(rec1data_temp$V1,11,11),
                      educ = substr(rec1data_temp$V1,12,13),
                      marital = substr(rec1data_temp$V1,14,14),
                      children = substr(rec1data_temp$V1,15,16),
                      occupat = substr(rec1data_temp$V1,17,18),
                      arrests = substr(rec1data_temp$V1,19,20),
                      jail = substr(rec1data_temp$V1,21,23),
                      crime01 = substr(rec1data_temp$V1,24,25),
                      crime02 = substr(rec1data_temp$V1,26,27),
                      crime03 = substr(rec1data_temp$V1,28,29),
                      crime04 = substr(rec1data_temp$V1,30,31),
                      crime05 = substr(rec1data_temp$V1,32,33),
                      crime06 = substr(rec1data_temp$V1,34,35),
                      crime07 = substr(rec1data_temp$V1,36,37),
                      crime08 = substr(rec1data_temp$V1,38,39),
                      crime09 = substr(rec1data_temp$V1,40,41),
                      crime10 = substr(rec1data_temp$V1,42,43),
                      crime11 = substr(rec1data_temp$V1,44,45),
                      crime12 = substr(rec1data_temp$V1,46,47),
                      crime13 = substr(rec1data_temp$V1,48,49),
                      crime14 = substr(rec1data_temp$V1,50,51))


rec2datatemp <- as.data.frame(dta[sort$type == "rec2",])
colnames(rec2datatemp) <- "V1"
rec2data <- data.frame(id = substr(rec2datatemp$V1,1,4),
                       rid = substr(rec2datatemp$V1,5,7),
                       pub_intox = substr(rec2datatemp$V1,8,9),
                       pet_larc = substr(rec2datatemp$V1,10,11),
                       misc = substr(rec2datatemp$V1,12,13),
                       assault = substr(rec2datatemp$V1,14,15),
                       arson = substr(rec2datatemp$V1,16,17),
                       rape = substr(rec2datatemp$V1,18,19),
                       forgery = substr(rec2datatemp$V1,20,21),
                       consp = substr(rec2datatemp$V1,22,23),
                       mvv = substr(rec2datatemp$V1,24,25),
                       narc = substr(rec2datatemp$V1,26,27),
                       viol_prob = substr(rec2datatemp$V1,28,29),
                       viol_parole = substr(rec2datatemp$V1,30,31),
                       gambling = substr(rec2datatemp$V1,32,33),
                       grand_larc = substr(rec2datatemp$V1,34,35),
                       robbery = substr(rec2datatemp$V1,36,37),
                       burglary = substr(rec2datatemp$V1,38,39),
                       sex_off = substr(rec2datatemp$V1,40,41),
                       crim_poss_weap = substr(rec2datatemp$V1,42,43),
                       crim_poss_instr = substr(rec2datatemp$V1,44,45),
                       obst_gov = substr(rec2datatemp$V1,46,47),
                       res_arrest = substr(rec2datatemp$V1,48,49),
                       escape = substr(rec2datatemp$V1,50,51),
                       crim_poss_stolen = substr(rec2datatemp$V1,52,53),
                       reck_endanger = substr(rec2datatemp$V1,54,55),
                       crim_neg_hom = substr(rec2datatemp$V1,56,57),
                       youth_off = substr(rec2datatemp$V1,58,59),
                       crim_tresspasss = substr(rec2datatemp$V1,60,61))



psychdatatemp <- as.data.frame(dta[sort$type == "psych_contact",])
colnames(psychdatatemp) <- "V1"
psychdata <- data.frame(id = substr(psychdatatemp$V1,1,4),
                        contact = substr(psychdatatemp$V1,5,7),
                        date_contact = substr(psychdatatemp$V1,8,13),
                        facility = substr(psychdatatemp$V1,14,15),
                        address = substr(psychdatatemp$V1,16,18),
                        diagnosis = substr(psychdatatemp$V1,19,21),
                        service = substr(psychdatatemp$V1,22,22),
                        date_term = substr(psychdatatemp$V1,23,28),
                        reason_term = substr(psychdatatemp$V1,29,29))

