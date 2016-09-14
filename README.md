Add Warnings
----------------------------------------------

This plugin extends the list of ArchivesSpace recommended fields to comply with JHU best practices.  Records may be saved without providing content for these fields, but users will be prompted with a warning box upon each attempt to save.

## Accessions

- Provenance

## Resources
- Container summary (extent schema)

## Containers

- Barcodes

## Installation

To install, just activate the plugin in your config/config.rb file by
including an entry such as:

     AppConfig[:plugins] = ['jhu-add-warnings']

Then restart ArchivesSpace.
