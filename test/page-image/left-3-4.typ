#import "/src/bookpositing.typ"

#bookpositing.composing(2,debug: true, {
    bookpositing.layout-header(page:0,
        [
            == 3/4 main marge

        #lorem(100)]
    )
    bookpositing.page-image.left-3-4(page:0,
        marge: "main",
        height:30%,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )

      bookpositing.page-image.left-3-4(page:0,
          marge: "main",
          placement: top,
          height:30%,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )
    bookpositing.content(lorem(500))

})



#bookpositing.composing(2,debug: true, {
    bookpositing.layout-header(page:0,
        [
            == 3/4 second marge

        #lorem(100)]
    )
    bookpositing.page-image.left-3-4(page:0,
        marge: "second",
        height:30%,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )

      bookpositing.page-image.left-3-4(page:0,
          marge: "second",
          placement: top,
          height:30%,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )
    bookpositing.content(lorem(500))

})


#bookpositing.composing(2,debug: true, {
    bookpositing.layout-header(page:0,
        [
            == 3/4 none marge

        #lorem(100)]
    )
    bookpositing.page-image.left-3-4(page:0,
        marge: "none",
        height:30%,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )

      bookpositing.page-image.left-3-4(page:0,
          marge: "none",
          placement: top,
          height:30%,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )
    bookpositing.content(lorem(500))

})



// #bookpositing.composing(2,debug: true, {
//     bookpositing.layout-header(page:0,
//         [
//             == 3/4 over marge

//         #lorem(100)]
//     )
//     bookpositing.page-image.left-3-4(page:0,
//         over-marge: true,
//         std.image(width: 100%,
//             height: 100%,
//             "/img.png",fit: "stretch")
//     )
//     bookpositing.content(lorem(600))

// })

// #bookpositing.composing(2,debug: true, {
//     bookpositing.layout-header(page:0,
//         [
//             == 3/4 

//         #lorem(100)]
//     )
//     bookpositing.page-image.left-3-4(page:0,
//         over-marge: false,
//         std.image(width: 100%,
//             height: 100%,
//             "/img.png",fit: "stretch")
//     )
//     bookpositing.content(lorem(600))

// })


// #bookpositing.composing(2,debug:true, {
//     bookpositing.layout-header(page:0,[
//         == 3/4-right over marge

//         #lorem(100)]
//     )
//     bookpositing.page-image.right-3-4(page:0,
//         over-marge: true,
//         std.image(width: 100%,
//             height: 100%,
//             "/img.png",fit: "stretch")
//     )
//     bookpositing.content(lorem(600))
// })


// #bookpositing.composing(2,debug:true, {
//     bookpositing.layout-header(page:0,[
//         == 3/4-right

//         #lorem(100)]
//     )

//         bookpositing.page-image.right-3-4(page:0,
//         over-marge: false,
//             height: 20%,
//             placement: top,
//         std.image(width: 100%,
//             height: 100%,
//             "/img.png",fit: "stretch")
//     )

//     bookpositing.page-image.right-3-4(page:0,
//         over-marge: false,
//         height:20%,
//         std.image(width: 100%,
//             height: 100%,
//             "/img.png",fit: "stretch")
//     )
//     bookpositing.content(lorem(600))
// })

