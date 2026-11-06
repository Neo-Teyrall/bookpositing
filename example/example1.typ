#import "/src/bookpositing.typ"

#set par(justify: true)
#bookpositing.data.set_second-marge(outside: 1cm)

#bookpositing.composing(2,debug : false, {
    bookpositing.content(lorem(750))
    bookpositing.page-image.left-3-4(
        page:0,
        height:30%,
        marge:"second",
        image(
            "/img.png",
            fit: "stretch",
            height:100%,
            width:100%)
    )
})
