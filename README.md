Add Warnings
----------------------------------------------

This plugin extends the list of ArchivesSpace recommended fields to comply with JHU best practices.  Records may be saved without providing content for these fields, but users will be prompted with a warning box upon each attempt to save.

## Accessions

- Provenance [AS-6](https://issues.library.jhu.edu/browse/AS-6)
- Container summary (extent schema) [AS-116](https://issues.library.jhu.edu/browse/AS-116)

## Resources
- Container summary (extent schema) [AS-6](https://issues.library.jhu.edu/browse/AS-6)

## Containers

- Barcodes [AS-6](https://issues.library.jhu.edu/browse/AS-6)

## Installation

To install, just activate the plugin in your config/config.rb file by
including an entry such as:

     AppConfig[:plugins] = ['jhu-add-warnings']

Then restart ArchivesSpace.
