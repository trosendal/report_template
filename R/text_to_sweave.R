chapterlist<-list.files('chapters', pattern='.txt',recursive=TRUE)



preamble<-c('\\documentclass{article}',
            '\\usepackage[utf8]{inputenc}',
            '\\begin{document}',
            '\\SweaveOpts{concordance=FALSE}')
postamble<-'\\end{document}'



for(i in 1:length(chapterlist)){
  #Read in the document from the chapter
  temp<-readLines(paste0('chapters/',chapterlist[i]))
  #add start and end of doc
  temp<-c(preamble,temp,postamble)
  writeLines(text=temp,
             con=paste0('chapters/',
                        gsub(pattern='txt',replacement='Rnw',x=chapterlist[i])))
}