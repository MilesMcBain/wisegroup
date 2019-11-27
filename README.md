# wisegroup

> Now I am become death, destroyer of groups....

Never be burned by forgetting to `ungroup()` again.

This packages contains wrappers for common group-aware functions that either:

  * automatically ungroup the returned data OR
  * allow the developer to make explicit that groups are being carried forward, signalling the potential for group related errors with a '...' variant of the orignal function, e.g. `mutate...`, `summarise...` etc.

## Usage

## Fun Fact

This package generates it's own source and documentation, so that adding new
wrappers is low effort. To generate new wrappers, an entry is added to
"./group_aware_functions.R" and "./make.R" is run.
