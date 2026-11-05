#import "/src/bookpositing.typ"


#bookpositing.composing(2, debug: true, {
  bookpositing.layout-header(full-page: true, [
    == 2/3
    
    #lorem(100)
  
  ])
  bookpositing.content([
    #lorem(600)])
  
  bookpositing.page-image.right-2-3(
    page: 0,
    marge: "main",
    height: 30%,
    bookpositing.default-image,
  )
  
  bookpositing.page-image.right-2-3(
    page: 0,
    placement: bottom,
    height: 30%,
    marge: "main",
    bookpositing.default-image,
  )
})


#bookpositing.composing(2, debug: true, {
  bookpositing.layout-header(full-page: true, [
    == 2/3
    
    #lorem(100)
  
  ])
  bookpositing.content([
    #lorem(600)])
  
  bookpositing.page-image.right-2-3(
    page: 0,
    placement: top,
    marge: "second",
    height: 30%,
    bookpositing.default-image,
  )
  
  bookpositing.page-image.right-2-3(
    page: 0,
    placement: bottom,
    height: 30%,
    marge: "second",
    bookpositing.default-image,
  )
})

#bookpositing.composing(2, debug: true, {
  bookpositing.layout-header(full-page: true, [
    == 2/3
    
    #lorem(100)
  
  ])
  bookpositing.content([
    #lorem(600)])
  
  bookpositing.page-image.right-2-3(
    page: 0,
    marge: "none",
    placement: top,
    height: 30%,
    bookpositing.default-image,
  )
  
  bookpositing.page-image.right-2-3(
    page: 0,
    placement: bottom,
    height: 30%,
    marge: "none",
    bookpositing.default-image,
  )
})
