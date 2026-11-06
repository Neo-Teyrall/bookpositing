#import "/src/bookpositing.typ"


#bookpositing.composing(2, debug: true, {
  bookpositing.secondary-layout.layout-header(full-page: true, [
    == 2/3
    
    #lorem(100)
  
  ])
  bookpositing.content([
    #lorem(600)])
  
  bookpositing.page-image.left-2-3(
    page: 0,
    marge: "main",
    height: 30%,
    bookpositing.default-image,
  )
  
  bookpositing.page-image.left-2-3(
    page: 0,
    placement: bottom,
    height: 30%,
    marge: "main",
    bookpositing.default-image,
  )
})


#bookpositing.composing(2, debug: true, {
  bookpositing.secondary-layout.layout-header(full-page: true, [
    == 2/3
    
    #lorem(100)
  
  ])
  bookpositing.content([
    #lorem(600)])
  
  bookpositing.page-image.left-2-3(
    page: 0,
    placement: top,
    marge: "second",
    height: 30%,
    bookpositing.default-image,
  )
  
  bookpositing.page-image.left-2-3(
    page: 0,
    placement: bottom,
    height: 30%,
    marge: "second",
    bookpositing.default-image,
  )
})

#bookpositing.composing(2, debug: true, {
  bookpositing.secondary-layout.layout-header(full-page: true, [
    == 2/3
    
    #lorem(100)
  
  ])
  bookpositing.content([
    #lorem(600)])
  
  bookpositing.page-image.left-2-3(
    page: 0,
    marge: "none",
    placement: top,
    height: 30%,
    bookpositing.default-image,
  )
  
  bookpositing.page-image.left-2-3(
    page: 0,
    placement: bottom,
    height: 30%,
    marge: "none",
    bookpositing.default-image,
  )
})

// #bookpositing.composing(2, debug: true, {
//   bookpositing.secondary-layout.layout-header([
//     == 2/3-right

//     #lorem(100)
//   ])
//   bookpositing.content([

//     #lorem(750)])

//   bookpositing.page-image.left-2-3(
//     page: 0,
//     marge: "main",

//     placement: top,
//     std.image(width: 100%, height: 100%, "/img.png", fit: "stretch"),
//   )
// })


// #bookpositing.composing(2,debug:true, {
//     bookpositing.secondary-layout.layout-header([
//     == 2/3-right

//         #lorem(100)
//         ]
//     )
//         bookpositing.content([

//         #lorem(750)]

//     )

//     bookpositing.page-image.right-2-3(page:0,
//         marge: "main",

//         placement: top,
//         std.image(width: 100%,
//             height: 100%,
//             "/img.png",fit: "stretch")
//     )
//     bookpositing.comment(page:0,placement: bottom+right, even:true, lorem(50))
// })


// #bookpositing.composing(2,debug:true, {
//         bookpositing.content([
//         == 2/3-right

//         #lorem(800)

//         ]

//     )

//     bookpositing.page-image.right-2-3(page:0,
//         over-marge: true,
//         placement: bottom,
//         std.image(width: 100%,
//             height: 100%,
//             "/img.png",fit: "stretch")
//     )
//     bookpositing.comment(page:0,placement: top+right,even:true, lorem(50))
// })

