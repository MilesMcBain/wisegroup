# wisegroup

> Now I am become death, destroyer of groups....

Never be burned by forgetting to `ungroup()` again.

This packages contains wrappers for common group-aware functions that either:

  * automatically ungroup the returned data OR
  * allow the developer to make explicit that groups are being carried forward, signalling the potential for group related errors with a '...' variant of the orignal function, e.g. `mutate...`, `summarise...` etc.

## Installation

```{r}
remotes::install_github("milesmcbain/wisegroup")
```

## Usage

`wisegroup` is designed to mask `tidyverse` functions in your global
environment. It is recommended that you use this package in conjunction with
`conflicted`, so that the masking is always made explicit like so:


```{r}

library(conflicted)
library(wisegroup)
library(tidyverse)
library(nycflights13)

conflict_prefer("summarise", "wisegroup")
conflict_prefer("mutate", "wisegroup")

```

Just be lazy. `conflicted` will let you know when you need to disambiguate.

So now you have automatically dropped groups after summarising over
multiple grouping columns:

```{r}
flights %>%
  group_by(year, month, day) %>%
  summarise(max_delay = max(dep_delay, na.rm = TRUE))
```

You indicate the grouping is sticking around with the `...` suffix

```{r}

flights %>%
  group_by(year, month, day) %>%
  summarise...(max_delay = max(dep_delay, na.rm = TRUE))
```

and with mutate:

```{r}
flights %>%
  group_by(year, month, day) %>%
  mutate...(day_dep_variance = var(dep_delay)) %>%
  summarise(max_var = max(day_dep_variance))

```
## Fun Fact

This package generates it's own source and documentation, so that adding new
wrappers is low effort. To generate new wrappers, an entry is added to
"./group_aware_functions.R" and "./make.R" is run.
