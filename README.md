# Working with Claude Code

Example project for ILVO colleagues on working with Claude Code.

## What's in here

| Path | What it is |
|------|------------|
| `data/fish_lengths.csv` | A made-up dataset of 1000 fish lengths and weights |
| `R/make_data.R` | Regenerates the made-up dataset (`Rscript R/make_data.R`) |
| `R/analysis.R` | Summarises length/weight per species and makes a boxplot |
| `CLAUDE.md` | Project instructions Claude reads automatically |
| `output/` | Results (not tracked in git) |

## Run it

```
Rscript R/analysis.R
```

## Things to try with Claude Code

Open Claude Code in this folder and ask, for example:

1. **Understand code** – "Explain what `R/analysis.R` does."
2. **Change code** – "Also report the number of fish per species in the summary."
3. **Add a feature** – "Add a length–weight scatter plot coloured by species."
4. **Find problems** – "What happens if the CSV has a missing value? Make the script robust to that."
5. **Git** – "Commit these changes with a clear message and push to GitHub."
6. **GitHub** – "Create a branch, make the change, and open a pull request."

Each step shows Claude reading files, editing them, running R, and using git – while you review and approve.
