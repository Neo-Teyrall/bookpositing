#import "/src/bookpositing.typ"


#bookpositing.composing(2,debug:true, {
     bookpositing.layout-header(full-page:true,[
    == 2/3

        #lorem(100)

    bonjour
        ]
    )
        bookpositing.content([
        
        #lorem(700)]

    )
    
    bookpositing.page-image.left-2-3(page:0,
        over-marge: false,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )
    bookpositing.comment(page:1,placement: bottom+left, even:false, lorem(50))
})


#bookpositing.composing(2,debug:true, {
    bookpositing.layout-header([
    == 2/3-right

        #lorem(100)
        ]
    )
        bookpositing.content([
        
        #lorem(750)]

    )

    bookpositing.page-image.right-2-3(page:0,
        over-marge: true,

        placement: top,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )
    bookpositing.comment(page:0,placement: bottom+right, even:true, lorem(50))
})


#bookpositing.composing(2,debug:true, {
        bookpositing.content([
        == 2/3-right

        #lorem(800)

        ]

    )

    bookpositing.page-image.right-2-3(page:0,
        over-marge: true,
        placement: bottom,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )
    bookpositing.comment(page:0,placement: top+right,even:true, lorem(50))
})

