#import "/src/bookpositing.typ"

#bookpositing.composing(2, {

    bookpositing.layout-header(page:0,[
        == 1/3 

        #lorem(150)]
    )
    bookpositing.content([
        //== 1/3

        #lorem(750)]
    )
    bookpositing.page-image.left-1-3(page:0,
        over-marge: false,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )
})

#bookpositing.composing(2, debug:true,{
        bookpositing.layout-header(page:0,[
        == 1/3 - right

        #lorem(140)]
    )
    bookpositing.content(lorem(750))
    bookpositing.page-image.right-1-3(page:0,
        over-marge: false,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )

})
