#import "/src/bookpositing.typ"

#bookpositing.composing(2, debug: true, {
    bookpositing.layout-header(
        page:0,
        [
            == image 2-2 : main marge 
            #lorem(100)
        ]
    )

    bookpositing.page-image.full-2-2(page:0,
        marge: "main",
        height:20%,
        placement: bottom,
        bookpositing.default-image
    )

    bookpositing.page-image.full-2-2(page:0,
        marge: "main",
        placement :top,
        height:20%,
        bookpositing.default-image
    )

    bookpositing.content(lorem(600))

})




#bookpositing.composing(2, debug: true, {
    bookpositing.layout-header(page:0,[== image 2-2 : second marge
        #lorem(100)]
    )
    bookpositing.page-image.full-2-2(page:0,
        marge: "second",
        placement:top,
        height:20%,
       bookpositing.default-image
    )
    bookpositing.page-image.full-2-2(page:0,
        marge: "second",
        placement: bottom,
        height:20%,
        bookpositing.default-image
    )
    bookpositing.content(lorem(600))

})


#bookpositing.composing(2, debug: true, {
    bookpositing.layout-header(page:0,[== image 2-2 : no marge
        #lorem(100)]
    )
    bookpositing.page-image.full-2-2(page:0,
        marge: "none",
        placement:top,
        height:20%,
       bookpositing.default-image
    )
    bookpositing.page-image.full-2-2(page:0,
        marge: "none",
        placement: bottom,
        height:20%,
        bookpositing.default-image
    )
    bookpositing.content(lorem(600))

})



