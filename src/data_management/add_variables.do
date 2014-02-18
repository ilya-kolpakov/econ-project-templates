/* 
The file "add_new_data.do" adds the new data from AJR (2005) to the
dataset as described in Albouy (2012).

*/


// Header do-File with path definitions, those end up in global macros.
include src/library/stata/project_paths
log using `"${PATH_OUT_DATA}/log/`1'.log"', replace

use `"${PATH_IN_DATA}/ajrcomment"'

gen logmort0_new = logmort0
gen campaign_new = campaign

replace logmort0_new = log(285) if inlist(shortnam, "HKG")
replace logmort0_new = log(189) if inlist(shortnam, "BHS")
replace logmort0_new = log(14.1) if inlist(shortnam, "AUS")
replace logmort0_new = log(95.2) if inlist(shortnam, "HND")
replace logmort0_new = log(84) if inlist(shortnam, "GUY")
replace logmort0_new = log(20) if inlist(shortnam, "SGP")
replace campaign_new = 0 if inlist(shortnam, "HND")

replace logmort0_new = log(106.3) if inlist(shortnam, "TTO")
replace logmort0_new = log(350) if inlist(shortnam, "SLE")

save `"${PATH_OUT_DATA}/ajrcomment_all"', replace
log close
