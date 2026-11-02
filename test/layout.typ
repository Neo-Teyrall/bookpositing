

#import "../src/bookpositing.typ"
// #import "/Utils/bg.typ"
// #import "/Utils/projets.typ"

// #show : projets.setup
#show : bookpositing.contour
// #show : bg.default


#set par(justify:true)

#bookpositing.composing(2, debug: true, {
    bookpositing.layout-header(page:0,[== full 2 page
        #lorem(100)]
    )
    bookpositing.page-image.full-2-2(page:0,
        over-marge: true,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )
    bookpositing.content(lorem(300))

})


#bookpositing.composing(2,debug: true, {
    bookpositing.layout-header(page:0,
        [
            == 3/4

        #lorem(100)]
    )
    bookpositing.page-image.left-3-4(page:0,
        over-marge: true,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )
    bookpositing.content(lorem(500))

})


#bookpositing.composing(2,debug:true, {
    bookpositing.layout-header(page:0,[
        == 3/4-right

        #lorem(100)]
    )
    bookpositing.page-image.right-3-4(page:0,
        over-marge: true,
        std.image(width: 100%,
            height: 100%,
            "/img.png",fit: "stretch")
    )
    bookpositing.content(lorem(300))
})

#bookpositing.composing(2, {

    bookpositing.layout-header(page:0,[
        == 1/3 

        #lorem(150)]
    )
    bookpositing.content([
        //== 1/3

        #lorem(600)]
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
    bookpositing.content(lorem(500))
    bookpositing.page-image.right-1-3(page:0,
        over-marge: false,
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



#bookpositing.composing(2,debug:true, {
     bookpositing.layout-header(full-page:true,[
    == 2/3

        #lorem(100)

    bonjour
        ]
    )
        bookpositing.content([
        
        #lorem(500)]

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
        
        #lorem(600)]

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

        #lorem(800)]

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
