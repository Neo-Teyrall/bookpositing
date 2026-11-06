#import "/src/bookpositing.typ"

#bookpositing.composing(2,debug: true, {
    bookpositing.secondary-layout.layout-header(page:0,
        [
            == centred : main marge

        #lorem(100)]
    )

      bookpositing.page-image.centred(page:0,
          marge: "main",
          placement: top,
          height:30%,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )

     bookpositing.page-image.centred(page:0,
          marge: "main",
          placement: bottom,
          height:30%,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )

    bookpositing.content(lorem(500))

})

#bookpositing.composing(2,debug: true, {
    bookpositing.secondary-layout.layout-header(page:0,
        [
            == centred : second marge

        #lorem(100)]
    )

      bookpositing.page-image.centred(page:0,
          marge: "second",
          placement: top,
          height:30%,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )

     bookpositing.page-image.centred(page:0,
          marge: "second",
          placement: bottom,
          height:30%,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )

    bookpositing.content(lorem(500))

})

#bookpositing.composing(2,debug: true, {
    bookpositing.secondary-layout.layout-header(page:0,
        [
            == centred none marge

        #lorem(100)]
    )

      bookpositing.page-image.centred(page:0,
          marge: "none",
          placement: top,
          height:30%,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )


      bookpositing.page-image.centred(page:0,
          marge: "none",
          placement: bottom,
          height:30%,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )

    bookpositing.content(lorem(500))

})


#bookpositing.composing(2,debug: true, {
    bookpositing.secondary-layout.layout-header(page:0,
        [
            == centred full : main marge

        #lorem(100)]
    )

      bookpositing.page-image.centred(page:0,
          marge: "main",
          full-page:true,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )
    bookpositing.content(lorem(500))

})

#bookpositing.composing(2,debug: true, {
    bookpositing.secondary-layout.layout-header(page:0,
        [
            == centred large : second marge

        #lorem(100)]
    )

      bookpositing.page-image.centred(page:0,
          marge: "second",
          full-page: true,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )

    bookpositing.content(lorem(500))

}) 

#bookpositing.composing(2,debug: true, {
    bookpositing.secondary-layout.layout-header(page:0,
        [
            == centred none marge

        #lorem(100)]
    )

      bookpositing.page-image.centred(page:0,
          marge: "none",
          full-page: true,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )
    bookpositing.content(lorem(500))

})




