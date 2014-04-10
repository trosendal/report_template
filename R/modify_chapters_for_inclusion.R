chapterlist<-list.files('chapters', pattern='.tex',recursive=TRUE)

for(i in 1:length(chapterlist)){

  #Read in the document from the chapter
  temp<-readLines(paste0('chapters/',chapterlist[i]))
  #Find the start and end of the document
  start<-grep(pattern='\\chapter*', temp)+1
  end<-grep(pattern='end\\{document\\}', temp)-1
  #find the chaptername
  chaptername<-temp[grep(pattern='\\chapter*', temp)]
  chaptername<-substr(x=chaptername,start=11, stop=nchar(chaptername)-1)
  chapterline<-temp[grep(pattern='\\chapter*', temp)]
  temp<-temp[start:end]
  temp<-c('\\newpage',chapterline,
          paste0('\\addcontentsline{toc}{chapter}{',chaptername,'}'),
          '\\begin{multicols}{2}',temp,'\\end{multicols}')
  
  writeLines(text=temp, con=paste0('chapters/',chapterlist[i]))
}