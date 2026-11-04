#import "/src/bookpositing.typ"

#bookpositing.composing(2,debug:true, {
        bookpositing.content([
        == 1/4

        #lorem(600)]
    )
    bookpositing.page-image.i1-4(page:0,
        over-marge: false,
        even:true,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )
    bookpositing.page-image.i1-4(page:1,
        even:false,
            full-page: true,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )

})


