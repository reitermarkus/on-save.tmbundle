# On Save.tmbundle


**TextMate 2 bundle:** Strips trailing whitespace from the current document ***after*** saving and ensures a new line at its end ***while*** saving.

The trailing whitespace is removed after saving so you can save your file while working on multiple lines that aren't quite finished.


## Installation

1. Clone the Git Repo
  
        git clone https://github.com/reitermarkus/on-save.tmbundle.git \
          ~/Library/Application\ Support/Avian/Bundles/On\ Save.tmbundle
    
2. Reset TextMate 2 Bundle Cache
  
        rm ~/Library/Caches/com.macromates.TextMate/BundlesIndex.binary

3. Relaunch **TextMate 2**


## Exclusion List

  By default, the following file types are excluded from the `Strip Trailing Whitespace` command:
  
  - Markdown (`text.html.markdown`)
  - YAML (`source.yaml`)
   

To exclude additional file types, open the Bundle Editor (`Bundles` → `Edit Bundles…` or press ^⌥⌘B) and go to `On Save`/`Other Actions`, then select the command you want to customize.

To exclude tabular `.csv` files, for example, add `-text.tabular.csv` to the command's `Scope Selector` field.

![Screenshot](https://github.com/reitermarkus/on-save.tmbundle/raw/master/Support/images/screenshot.png)
