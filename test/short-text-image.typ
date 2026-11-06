
#import "../src/bookpositing.typ"

#show : bookpositing.marge-debug

#set par(justify:true)

#bookpositing.composing(2, debug: true, {

    bookpositing.text-image.short(
        page:1,
        placement:top + right,
        text(fill:red,lorem(30))
    )

    bookpositing.secondary-layout.layout-header(page:0,[
        == full 2 page
        
        #lorem(100)
    ]
    )
    bookpositing.page-image.full-2-2(page:0,
           marge: "none",
        height:46%,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )
    bookpositing.content(lorem(450))

})


#bookpositing.composing(2,debug: true, {

    bookpositing.text-image.short(
        page:1,
        placement:top + right,
        box(stroke:1pt, text(fill:red,lorem(30)))
    )
    bookpositing.secondary-layout.layout-header(page:0,
        [
            == 3/4

        #lorem(100)]
    )
    bookpositing.page-image.left-3-4(page:0,
           marge: "none",
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )
    bookpositing.content(lorem(500))

})

#bookpositing.composing(2, {

    bookpositing.text-image.short(
        page:0,
        placement: bottom + left,
        box(stroke:1pt, text(fill:red,lorem(30)))
    )

    bookpositing.text-image.short(
        page:1,
        placement:top + right,
        box(stroke:1pt, text(fill:red,lorem(30)))
    )


    bookpositing.text-image.short(
        page:1,
        placement:bottom + left,
        box(stroke:1pt, text(fill:red,lorem(30)))
    )
    bookpositing.secondary-layout.layout-header(page:0,[
        == 1/3 

        #lorem(150)]
    )
    bookpositing.content([
        #lorem(600)]
    )
    bookpositing.page-image.left-1-3(page:0,
           marge: "none",
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )
})

#bookpositing.composing(2, debug:true,{

    bookpositing.text-image.short(
        page:0,
        placement:bottom+left,
        box(stroke:1pt, text(fill:red,lorem(30)))
    )

    bookpositing.text-image.short(
        page:0,
        placement:bottom+right,
        box(stroke:1pt, text(fill:red,lorem(30)))
    )

    bookpositing.text-image.short(
        page:1,
        placement:top + right,
        box(stroke:1pt, text(fill:red,lorem(30)))
    )

        bookpositing.secondary-layout.layout-header(page:0,[
        == 1/3 - right

        #lorem(140)]
    )
    bookpositing.content(lorem(500))
    bookpositing.page-image.right-1-3(page:0,
           marge: "none",
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )

})

#bookpositing.composing(2,debug:true, {

    bookpositing.text-image.short(
        page:1,
        placement:bottom + left,
        box(stroke:1pt, text(fill:red,lorem(30)))
    )
    bookpositing.text-image.short(
        page:0,
        placement:bottom + right,
        box(stroke:1pt, text(fill:red,lorem(30)))
    )
        bookpositing.content([
        == 1/4

        #lorem(550)]
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
            full-page: true,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )

})



#bookpositing.composing(2,debug:true, {


    bookpositing.text-image.short(
        page:0,
        placement:bottom+left,
        box(stroke:1pt, text(fill:red,lorem(30)))
    )
    bookpositing.text-image.short(
        page:0,
        placement:bottom+right,
        box(stroke:1pt, text(fill:red,lorem(30)))
    )


    bookpositing.text-image.short(
        page:1,
        placement:bottom+left,
        box(stroke:1pt, text(fill:red,lorem(30)))
    )
    bookpositing.text-image.short(
        page:1,
        placement:bottom+right,
        box(stroke:1pt, text(fill:red,lorem(30)))
    )

     bookpositing.content()[
    == 2/3

        #lorem(100)

        #lorem(500)
     ]

    
    
    bookpositing.page-image.left-2-3(page:0,
           marge: "none",
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )
    bookpositing.comment(page:1,placement: bottom+left, even:false, lorem(50))
})


#bookpositing.composing(2,debug:true, {

    
    bookpositing.text-image.short(
        page:0,
        placement:bottom+left,
        box(stroke:1pt, text(fill:red,lorem(30)))
    )
    bookpositing.text-image.short(
        page:0,
        placement:bottom+right,
        box(stroke:1pt, text(fill:red,lorem(30)))
    )


    bookpositing.text-image.short(
        page:1,
        placement:bottom+left,
        box(stroke:1pt, text(fill:red,lorem(30)))
    )
    bookpositing.text-image.short(
        page:1,
        placement:bottom+right,
        box(stroke:1pt, text(fill:red,lorem(30)))
    )

    bookpositing.secondary-layout.layout-header([
    == 2/3-right

        #lorem(100)
        ]
    )
        bookpositing.content([
        
        #lorem(600)]

    )

    bookpositing.page-image.right-2-3(page:0,
           marge: "none",

        placement: top,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )
    bookpositing.comment(page:0,placement: bottom+right, even:true, lorem(50))
})

