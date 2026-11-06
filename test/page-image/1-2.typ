#import "/src/bookpositing.typ"

#bookpositing.composing(2, debug: true, {
    bookpositing.secondary-layout.layout-header(
        page:0,
        [
            == image 1-2 : main marge 
            #lorem(100)
        ]
    )

    bookpositing.page-image.full-1-2(page:0,
        marge: "main",
        height:20%,
        placement: bottom,
        bookpositing.default-image
    )

    bookpositing.page-image.full-1-2(page:0,
        marge: "main",
        placement :top,
        height:20%,
        bookpositing.default-image
    )

    bookpositing.content(lorem(400))

})


#bookpositing.composing(2, debug: true, {
    bookpositing.secondary-layout.layout-header(
        page:0,
        [
            == image 1-2 : main marge 
            #lorem(100)
        ]
    )

    bookpositing.page-image.full-1-2(page:1,
        marge: "main",
        even:false,
        height:20%,
        placement: bottom,
        bookpositing.default-image
    )

    bookpositing.page-image.full-1-2(page:1,
        marge: "main",
        placement :top,
        even:false,
        height:20%,
        bookpositing.default-image
    )

    bookpositing.content(lorem(400))

})




#bookpositing.composing(2, debug: true, {
    bookpositing.secondary-layout.layout-header(page:0,[== image 1-2 : second marge
        #lorem(100)]
    )
    bookpositing.page-image.full-1-2(page:0,
        marge: "second",
        placement:top,
        height:20%,
       bookpositing.default-image
    )
    bookpositing.page-image.full-1-2(page:0,
        marge: "second",
        placement: bottom,
        height:20%,
        bookpositing.default-image
    )
    bookpositing.content(lorem(420))

})


#bookpositing.composing(2, debug: true, {
    bookpositing.secondary-layout.layout-header(page:0,[== image 1-2 : second marge
        #lorem(100)]
    )
    bookpositing.page-image.full-1-2(page:1,
        marge: "second",
        even:false,
        placement:top,
        height:20%,
       bookpositing.default-image
    )
    bookpositing.page-image.full-1-2(page:1,
        marge: "second",
        even:false,
        placement: bottom,
        height:20%,
        bookpositing.default-image
    )
    bookpositing.content(lorem(420))

})


#bookpositing.composing(2, debug: true, {
    bookpositing.secondary-layout.layout-header(page:0,[== image 1-2 : no marge
        #lorem(100)]
    )
    bookpositing.page-image.full-1-2(page:0,
        marge: "none",
        placement:top,
        height:20%,
       bookpositing.default-image
    )
    bookpositing.page-image.full-1-2(page:0,
        marge: "none",
        placement: bottom,
        height:20%,
        bookpositing.default-image
    )
    bookpositing.content(lorem(420))

})

#bookpositing.composing(2, debug: true, {
    bookpositing.secondary-layout.layout-header(page:0,[== image 1-2 : no marge
        #lorem(100)]
    )
    bookpositing.page-image.full-1-2(page:1,
        marge: "none",
        placement:top,
        height:20%,
        even:true,
       bookpositing.default-image
    )
    bookpositing.page-image.full-1-2(page:1,
        marge: "none",
        even:true,
        placement: bottom,
        height:20%,
        bookpositing.default-image
    )
    bookpositing.content(lorem(420))

})



