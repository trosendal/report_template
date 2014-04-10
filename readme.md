# A template for reporting

This project is a template for how we could generate an annual
report faster by doing the writing within a prebuilt typeset template. Each
chapter would be included as directory in the chapters folder.

### Presently the strategy works as follows:

Chapters in simplified latex format with a .txt extension-

    * The following formatting must be done in these files: 
        * Definitions of
            * chapter
            * sections
            * subsections
            * subsubsection 
        * Italics
        * Bold
        * Superscript
        * url
        * commenting special characters:
	        * %
	        * > and <
	    * Placing figures
	    * Placing references

* These files are then processed into .RnW files with an R script
* The Rnw files are processed to .tex with Sweave via a makefile in each directory.
* These .tex files are trimmed and some additional formatting arguments are added to them by an R-script
* The final document is a .tex file that has \include arguments to include each chapter

### Possible improvements

* Simplify formatting of original chapters
    * The document could be written in a local markdown flavour that could be parsed and written to Sweave/Latex in order to reduce the burden on the author of the chapter.
    	* Only small gains are met by going all the way to markdown
    	* Could however facilitate editing with highlighting in a web based editor
    * The input document could be simlified further to do the following:
    	* Could comment out special characters
    	* Format figures and references