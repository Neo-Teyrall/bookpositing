#import "/src/bookpositing.typ"

#bookpositing.composing(2,debug:true, {
        bookpositing.content([
        == 1/4

        #lorem(600)]
    )
    bookpositing.page-image.i1-4(page:0,
        marge: "main",
        even:true,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )
    bookpositing.page-image.i1-4(page:1,
        even:false,
        marge : "main",
        full-page: true,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )

})


#bookpositing.composing(2,debug:true, {
        bookpositing.content([
        == 1/4

        #lorem(600)]
    )
    bookpositing.page-image.i1-4(page:0,
        marge: "second",
        even:true,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )
    bookpositing.page-image.i1-4(page:1,
        even:false,
        marge : "second",
        full-page: true,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )

})


#bookpositing.composing(2,debug:true, {
        bookpositing.content([
        == 1/4

        #lorem(600)]
    )
    bookpositing.page-image.i1-4(page:0,
        marge: "none",
        even:true,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )
    bookpositing.page-image.i1-4(page:1,
        even:false,
        marge : "none",
        full-page: true,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )

})


