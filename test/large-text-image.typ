
#import "../src/lib.typ"
#import "/Utils/bg.typ"
#import "/Utils/projets.typ"

#show : projets.setup
#show : lib.contour
#show : bg.default


#set par(justify:true)

#lib.composing(2, debug: true, {

    lib.text-image.large(
        page:1,
        placement:top + right,
        box(stroke:1pt, text(fill:red,lorem(30)))
    )

    lib.layout-header(page:0,[
        == full 2 page
        
        #lorem(100)
    ]
    )
    lib.page-image.full-2-2(page:0,
        over-marge: true,
        height:46%,
        std.image(width: 100%,
            height: 100%,
            "/Assets/Figures/Talents/body-balance.svg",fit: "stretch")
    )
    lib.content(lorem(450))

})


#lib.composing(2,debug: true, {

    lib.text-image.large(
        page:1,
        placement:top + right,
        box(stroke:1pt, text(fill:red,lorem(30)))
    )
    lib.layout-header(page:0,
        [
            == 3/4

        #lorem(100)]
    )
    lib.page-image.left-3-4(page:0,
        over-marge: true,
        std.image(width: 100%,
            height: 100%,
            "/Assets/Figures/Talents/body-balance.svg",fit: "stretch")
    )
    lib.content(lorem(500))

})

#lib.composing(2, {

    lib.text-image.large(
        page:0,
        placement: bottom + left,
        box(stroke:1pt, text(fill:red,lorem(30)))
    )

    lib.text-image.large(
        page:1,
        placement:top + right,
        box(stroke:1pt, text(fill:red,lorem(30)))
    )
    lib.layout-header(page:0,[
        == 1/3 

        #lorem(150)]
    )
    lib.content([
        //== 1/3

        #lorem(600)]
    )
    lib.page-image.left-1-3(page:0,
        over-marge: false,
        std.image(width: 100%,
            height: 100%,
            "/Assets/Figures/Talents/body-balance.svg",fit: "stretch")
    )
})

#lib.composing(2, debug:true,{

    lib.text-image.large(
        page:0,
        placement:bottom,
        box(stroke:1pt, text(fill:red,lorem(30)))
    )
    lib.text-image.large(
        page:1,
        placement:top + right,
        box(stroke:1pt, text(fill:red,lorem(30)))
    )

        lib.layout-header(page:0,[
        == 1/3 - right

        #lorem(140)]
    )
    lib.content(lorem(500))
    lib.page-image.right-1-3(page:0,
        over-marge: false,
        std.image(width: 100%,
            height: 100%,
            "/Assets/Figures/Talents/body-balance.svg",fit: "stretch")
    )

})

#lib.composing(2,debug:true, {

    lib.text-image.large(
        page:1,
        placement:top + right,
        box(stroke:1pt, text(fill:red,lorem(30)))
    )
    lib.text-image.large(
        page:0,
        placement:top + right,
        box(stroke:1pt, text(fill:red,lorem(30)))
    )
        lib.content([
        == 1/4

        #lorem(600)]
    )
    lib.page-image.i1-4(page:0,
        over-marge: false,
        even:true,
        std.image(width: 100%,
            height: 100%,
            "/Assets/Figures/Talents/body-balance.svg",fit: "stretch")
    )
    lib.page-image.i1-4(page:1,
        even:false,
            full-page: true,
        std.image(width: 100%,
            height: 100%,
            "/Assets/Figures/Talents/body-balance.svg",fit: "stretch")
    )

})



#lib.composing(2,debug:true, {


    lib.text-image.large(
        page:0,
        placement:top,
        box(stroke:1pt, text(fill:red,lorem(30)))
    )
    lib.text-image.large(
        page:1,
        placement:top,
        box(stroke:1pt, text(fill:red,lorem(30)))
    )

     lib.layout-header(full-page:true,[
    == 2/3

        #lorem(100)

    bonjour
        ]
    )
        lib.content([
        
        #lorem(500)]

    )
    
    lib.page-image.left-2-3(page:0,
        over-marge: false,
        std.image(width: 100%,
            height: 100%,
            "/Assets/Figures/Talents/body-balance.svg",fit: "stretch")
    )
    lib.comment(page:1,placement: bottom+left, even:false, lorem(50))
})


#lib.composing(2,debug:true, {

    lib.text-image.large(
        page:0,
        placement:bottom ,
        box(stroke:1pt, text(fill:red,lorem(30)))
    )
    lib.text-image.large(
        page:1,
        placement:bottom ,
        box(stroke:1pt, text(fill:red,lorem(30)))
    )

    lib.layout-header([
    == 2/3-right

        #lorem(100)
        ]
    )
        lib.content([
        
        #lorem(600)]

    )

    lib.page-image.right-2-3(page:0,
        over-marge: true,

        placement: top,
        std.image(width: 100%,
            height: 100%,
            "/Assets/Figures/Talents/body-balance.svg",fit: "stretch")
    )
    lib.comment(page:0,placement: bottom+right, even:true, lorem(50))
})

